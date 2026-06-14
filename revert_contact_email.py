import re

with open('src/main/java/com/smartride/controller/ContactServlet.java', 'r', encoding='utf-8') as f:
    content = f.read()

# I will replace the try-catch block to remove the customer email sending
old_block = """        try {
            // Gửi cho Admin
            com.smartride.constant.SendEmail.sendVerificationEmail(adminTo, adminContent);
            // Gửi cho Khách hàng
            com.smartride.constant.SendEmail.sendVerificationEmail(email, customerContent);

            request.setAttribute("msg", "Gửi yêu cầu thành công! Cảm ơn bạn đã liên hệ, đội ngũ SmartRide sẽ phản hồi bạn qua email trong vòng 24h làm việc.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Đã lưu thông tin liên hệ nhưng có lỗi khi gửi email thông báo: " + e.getMessage());
        }"""

new_block = """        try {
            // Gửi cho Admin (Main Mail)
            com.smartride.constant.SendEmail.sendVerificationEmail(adminTo, adminContent);

            request.setAttribute("msg", "Gửi yêu cầu thành công! Cảm ơn bạn đã liên hệ, đội ngũ SmartRide sẽ phản hồi bạn trong vòng 24h làm việc.");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Đã lưu thông tin liên hệ nhưng có lỗi khi gửi email thông báo: " + e.getMessage());
        }"""

content = content.replace(old_block, new_block)

with open('src/main/java/com/smartride/controller/ContactServlet.java', 'w', encoding='utf-8') as f:
    f.write(content)
