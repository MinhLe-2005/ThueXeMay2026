import os

filepath = "src/main/webapp/home.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

old_logic = """                var minTime = new Date();
                minTime.setMinutes(minTime.getMinutes() + 30); // Require at least 30 min advance booking
                minTime.setMinutes(minTime.getMinutes() - 5); // 5 min grace period for filling out the form

                if (start < minTime) {
                    showHeroError("Vui lòng đặt xe trước 30 phút");
                    return false;
                }"""

# since there's encoding issue in stdout `Vui lAng `t xe tr>c 30 phAt`, it's utf-8 in file.
# Let's read file, find the lines to remove using string replacement.
with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content.replace(old_logic, ""))
print("Removed minTime check in home.jsp")
