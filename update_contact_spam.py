import re

with open('src/main/java/com/smartride/controller/ContactServlet.java', 'r', encoding='utf-8') as f:
    content = f.read()

old_block = """        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String title = request.getParameter("title");
        String message = request.getParameter("message");
        
        HttpSession session = request.getSession();"""

new_block = """        String honeypot = request.getParameter("website_url_honeypot");
        if (honeypot != null && !honeypot.isEmpty()) {
            // SPAM BOT DETECTED: Silently accept but do nothing
            request.setAttribute("msg", "Gửi yêu cầu thành công! Cảm ơn bạn đã liên hệ, đội ngũ SmartRide sẽ phản hồi bạn trong vòng 24h làm việc.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        
        Long lastContactTime = (Long) session.getAttribute("lastContactTime");
        if (lastContactTime != null && (System.currentTimeMillis() - lastContactTime < 60000)) {
            // Rate limit: 1 request per 60 seconds
            request.setAttribute("errorMsg", "Bạn thao tác quá nhanh. Vui lòng chờ 1 phút trước khi gửi yêu cầu tiếp theo để tránh spam.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }
        session.setAttribute("lastContactTime", System.currentTimeMillis());

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String title = request.getParameter("title");
        String message = request.getParameter("message");"""

content = content.replace(old_block, new_block)

with open('src/main/java/com/smartride/controller/ContactServlet.java', 'w', encoding='utf-8') as f:
    f.write(content)
