import re

with open('src/main/java/com/smartride/controller/ContactServlet.java', 'r', encoding='utf-8') as f:
    content = f.read()

old_block = """        // Gửi email thông báo về mail hệ thống
        String to = "smartride.system@gmail.com";
        String content = "<h3>Bạn vừa nhận được một liên hệ mới từ khách hàng trên hệ thống SmartRide.</h3>"
                + "<p><strong>Thông tin khách hàng:</strong></p>"
                + "<ul>"
                + "<li><strong>Tên:</strong> " + name + "</li>"
                + "<li><strong>Số điện thoại:</strong> " + phone + "</li>"
                + "<li><strong>Email:</strong> " + email + "</li>"
                + "<li><strong>Tiêu đề:</strong> " + title + "</li>"
                + "</ul>"
                + "<p><strong>Nội dung:</strong><br/>" + message.replace("\\n", "<br>") + "</p>";
        
        try {
            com.smartride.constant.SendEmail.sendVerificationEmail(to, content);
            request.setAttribute("msg", "Gửi yêu cầu thành công! Cảm ơn bạn đã liên hệ, đội ngũ SmartRide sẽ phản hồi bạn trong vòng 24h làm việc.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Đã lưu thông tin liên hệ nhưng có lỗi khi gửi email thông báo: " + e.getMessage());
        }"""

old_block_ansi = """        // G-i email thA'ng bAo v? mail h th`ng
        String to = "smartride.system@gmail.com";
        String content = "<h3>Bn va nh-n `c mTt liAn h m>i t khAch hAng trAn h th`ng SmartRide.</h3>"
                + "<p><strong>ThA'ng tin khAch hAng:</strong></p>"
                + "<ul>"
                + "<li><strong>TAn:</strong> " + name + "</li>"
                + "<li><strong>S` `in thoi:</strong> " + phone + "</li>"
                + "<li><strong>Email:</strong> " + email + "</li>"
                + "<li><strong>TiAu `?:</strong> " + title + "</li>"
                + "</ul>"
                + "<p><strong>NTi dung:</strong><br/>" + message.replace("\\n", "<br>") + "</p>";
        
        try {
            com.smartride.constant.SendEmail.sendVerificationEmail(to, content);
            request.setAttribute("msg", "G-i yAu c u thAnh cA'ng! Cm n bn `A liAn h, `Ti ngc SmartRide s phn h"i bn trong vAng 24h lAm vic.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "?A lu thA'ng tin liAn h nhng cA3 l-i khi g-i email thA'ng bAo: " + e.getMessage());
        }"""

new_block = """        // Gửi email thông báo cho Khách hàng
        String customerContent = "<h3>Xin chào " + name + ",</h3>"
                + "<p>Cảm ơn bạn đã liên hệ với <strong>SmartRide</strong>.</p>"
                + "<p>Chúng tôi đã nhận được yêu cầu của bạn với nội dung sau:</p>"
                + "<ul>"
                + "<li><strong>Tiêu đề:</strong> " + title + "</li>"
                + "<li><strong>Nội dung:</strong><br/>" + message.replace("\\n", "<br>") + "</li>"
                + "</ul>"
                + "<p>Đội ngũ hỗ trợ của chúng tôi sẽ xem xét và phản hồi bạn qua email hoặc số điện thoại (" + phone + ") trong thời gian sớm nhất (thường trong vòng 24 giờ làm việc).</p>"
                + "<br><p>Trân trọng,<br><strong>Đội ngũ SmartRide</strong></p>";

        // Gửi email thông báo về mail hệ thống
        String adminTo = "smartride.system@gmail.com";
        String adminContent = "<h3>Bạn vừa nhận được một liên hệ mới từ khách hàng trên hệ thống SmartRide.</h3>"
                + "<p><strong>Thông tin khách hàng:</strong></p>"
                + "<ul>"
                + "<li><strong>Tên:</strong> " + name + "</li>"
                + "<li><strong>Số điện thoại:</strong> " + phone + "</li>"
                + "<li><strong>Email:</strong> " + email + "</li>"
                + "<li><strong>Tiêu đề:</strong> " + title + "</li>"
                + "</ul>"
                + "<p><strong>Nội dung:</strong><br/>" + message.replace("\\n", "<br>") + "</p>";
        
        try {
            // Gửi cho Admin
            com.smartride.constant.SendEmail.sendVerificationEmail(adminTo, adminContent);
            // Gửi cho Khách hàng
            com.smartride.constant.SendEmail.sendVerificationEmail(email, customerContent);

            request.setAttribute("msg", "Gửi yêu cầu thành công! Cảm ơn bạn đã liên hệ, đội ngũ SmartRide sẽ phản hồi bạn qua email trong vòng 24h làm việc.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Đã lưu thông tin liên hệ nhưng có lỗi khi gửi email thông báo: " + e.getMessage());
        }"""

if old_block in content:
    content = content.replace(old_block, new_block)
elif old_block_ansi in content:
    content = content.replace(old_block_ansi, new_block)
else:
    print("Could not find the block to replace!")

with open('src/main/java/com/smartride/controller/ContactServlet.java', 'w', encoding='utf-8') as f:
    f.write(content)
