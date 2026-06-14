# -*- coding: utf-8 -*-
import os

# Update booking.jsp
with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

new_logic_booking = """                $.validator.addMethod("notInPast", function(value, element) {
                    if (!value) return true;
                    var dateStr = $("#pickupdate").val();
                    if (!dateStr) return true;
                    
                    var pickupDateTime = new Date(dateStr + "T" + value);
                    var now = new Date();
                    now.setMinutes(now.getMinutes() - 5); // 5 min grace period for form filling
                    
                    return pickupDateTime >= now;
                }, "Giờ nhận xe không được ở trong quá khứ");

                $.validator.addMethod("minAdvanceTime", function(value, element) {
                    if (!value) return true;
                    var dateStr = $("#pickupdate").val();
                    if (!dateStr) return true;
                    
                    var pickupDateTime = new Date(dateStr + "T" + value);
                    var minTime = new Date();
                    minTime.setMinutes(minTime.getMinutes() + 30); // 30 min advance booking
                    minTime.setMinutes(minTime.getMinutes() - 5); // 5 min grace period
                    
                    return pickupDateTime >= minTime;
                }, "Vui lòng đặt xe trước 30 phút");"""

content = content.replace("""                $.validator.addMethod("minAdvanceTime", function(value, element) {
                    if (!value) return true;
                    var dateStr = $("#pickupdate").val();
                    if (!dateStr) return true;
                    
                    var pickupDateTime = new Date(dateStr + "T" + value);
                    var minTime = new Date();
                    minTime.setMinutes(minTime.getMinutes() + 30); // 30 min advance booking
                    minTime.setMinutes(minTime.getMinutes() - 5); // 5 min grace period
                    
                    return pickupDateTime >= minTime;
                }, "Vui lòng đặt xe trước 30 phút");""", new_logic_booking)

# We also need to add 'notInPast: true' to the rules of pickuptime!
# Let's see the rules section.
# I'll just find 'minAdvanceTime: true' and replace it with 'notInPast: true, minAdvanceTime: true'
content = content.replace("minAdvanceTime: true", "notInPast: true,\n                            minAdvanceTime: true")

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)

# Update home.jsp
with open('src/main/webapp/home.jsp', 'r', encoding='utf-8') as f:
    home_content = f.read()

old_logic_home = """                var minTime = new Date();
                minTime.setMinutes(minTime.getMinutes() + 30); // Require at least 30 min advance booking
                minTime.setMinutes(minTime.getMinutes() - 5); // 5 min grace period for filling out the form

                if (start < minTime) {
                    showHeroError("Vui lòng đặt xe trước 30 phút");
                    return false;
                }"""

new_logic_home = """                var now = new Date();
                now.setMinutes(now.getMinutes() - 5); // 5 min grace period
                if (start < now) {
                    showHeroError("Giờ nhận xe không được ở trong quá khứ!");
                    return false;
                }

                var minTime = new Date();
                minTime.setMinutes(minTime.getMinutes() + 30); // Require at least 30 min advance booking
                minTime.setMinutes(minTime.getMinutes() - 5); // 5 min grace period for filling out the form

                if (start < minTime) {
                    showHeroError("Vui lòng đặt xe trước 30 phút");
                    return false;
                }"""

home_content = home_content.replace(old_logic_home, new_logic_home)

with open('src/main/webapp/home.jsp', 'w', encoding='utf-8') as f:
    f.write(home_content)

print("Added notInPast validation to both files.")
