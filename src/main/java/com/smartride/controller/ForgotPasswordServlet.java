
package com.smartride.controller;

import com.smartride.constant.SendEmail;
import com.smartride.dao.AccountDAO;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import static java.lang.System.out;
import java.util.Properties;
import java.util.UUID;
import com.smartride.dto.Account;
import java.io.PrintWriter;

@WebServlet(name = "ForgotPassWordServlet", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        AccountDAO dao = AccountDAO.getInstance();
//        Account acc = dao.checkLogin("ginokami", "password123");
        String token = UUID.randomUUID().toString();
        String email = request.getParameter("email");
        if(dao.createToken(token, email)){
            String link = "<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                "    <title>Reset Your Password</title>\n" +
                "    <style>\n" +
                "        body {\n" +
"            font-family: Arial, sans-serif;\n" +
"            background-color: #f8f9fa;\n" +
"            color: #212529;\n" +
"            margin: 0;\n" +
"            padding: 0;\n" +
"            background: white;\n" +
"        }\n" +
"        .container {\n" +
"            margin-top: 50px;\n" +
"            max-width: 800px;\n" +
"            margin: 50px auto;\n" +
"            padding: 0 15px;\n" +
"        }\n" +
"        .text-center{\n" +
"            text-align: center;\n" +
"        }\n" +
"        .logo {\n" +
"            margin: 0 auto -40px;\n" +
"        }\n" +
"        .card {\n" +
"            background: #fff;\n" +
"            border-radius: 0.25rem;\n" +
"            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);\n" +
"            padding: 20px;\n" +
"            margin-bottom: 20px;\n" +
"        }\n" +
"        .card-body {\n" +
"            padding: 1.25rem;\n" +
"        }\n" +
"        .card-title {\n" +
"            margin-bottom: 0.75rem;\n" +
"            font-size: 1.25rem;\n" +
"            font-weight: bold;\n" +
"        }\n" +
"        .reset-button {\n" +
"            background-color: #28a745;\n" +
"            color: white;\n" +
"            border: none;\n" +
"            padding: 10px 20px;\n" +
"            font-size: 16px;\n" +
"            cursor: pointer;\n" +
"            display: block;\n" +
"            margin: 20px auto;\n" +
"            text-align: center;\n" +
"            width: 42%;\n" +
"            border-radius: 8px;\n" +
"            text-decoration: none; /* Để liên kết trông giống nút */\n" +
"        }\n" +
"        .reset-button:hover {\n" +
"            background-color: #218838;\n" +
"        }\n" +
"        a {\n" +
"            color: #007bff;\n" +
"            text-decoration: none;\n" +
"            background-color: transparent;\n" +
"        }\n" +
"        a:hover {\n" +
"            color: #0056b3;\n" +
"            text-decoration: underline;\n" +
"        }" +
                "    </style>\n" +
                "</head>\n" +
                "<body>\n" +
                "    <div class=\"container text-center\">\n" +
                "        <img src=\"https://i.imgur.com/hi3iwTJ.png\" alt=\"Logo\" class=\"logo\" style=\"width: 12%;\">\n" +
                "        <div class=\"card mt-4\" style=\"width: 60%;margin: 0 auto; box-shadow: 0 0.125rem 1.25rem rgba(0, 0, 0, 0.075);\">\n" +
                "            <div class=\"card-body\">\n" +
                "                <h3 class=\"card-title\">Đặt lại mật khẩu ColorBike</h3>\n" +
                "                <p>Chúng tôi nghe nói rằng bạn đã mất mật khẩu. Rất tiếc về điều đó!</p>\n" +
                "                <p>Nhưng đừng lo lắng! Bạn có thể sử dụng nút dưới đây để đặt lại mật khẩu của mình:</p>\n" +
                "                <a href='http://localhost:8080/MotorcyleHiringProject/verify?token=" + token + "'class=\"reset-button\">Đặt lại mật khẩu của bạn</a>\n" +
                "                <p>Nếu bạn không sử dụng liên kết này trong vòng 5 phút, nó sẽ hết hạn. Để nhận liên kết đặt lại mật khẩu mới, hãy truy cập: <a href=\"http://localhost:9999/MotorcyleHiringProject/forgotpassword.jsp\">forgot password</a></p>\n" +
                "                <p>Cảm ơn,<br>Nhóm hỗ trợ ColorBike</p>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "        <p class=\"mt-3\">Bạn nhận được email này vì đã có yêu cầu đặt lại mật khẩu cho tài khoản của bạn.</p>\n" +
                "    </div>\n" +
                "</body>\n" +
                "</html>";
            SendEmail.sendVerificationEmail(email, link);
            
            
            
            
            
            out.println("<!DOCTYPE html>\n" +
                    "<html lang=\"en\">\n" +
                    "<head>\n" +
                    "    <meta charset=\"UTF-8\">\n" +
                    "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                    "    <title>Reset Password</title>\n" +
                    "    <link href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\" rel=\"stylesheet\">\n" +
                    "    <style>\n" +
                    "        body {\n" +
                    "            background-color: #f8f9fa;\n" +
                    "        }\n" +
                    "        .container {\n" +
                    "            max-width: 500px;\n" +
                    "            margin-top: 50px;\n" +
                    "        }\n" +
                    "        .form-container {\n" +
                    "            background-color: #ffffff;\n" +
                    "            padding: 20px;\n" +
                    "            border-radius: 10px;\n" +
                    "            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);\n" +
                    "        }\n" +
                    "        .form-container img {\n" +
                    "            display: block;\n" +
                    "            margin: 0 auto 20px;\n" +
                    "             width: 22%;\n" +
                    "        }\n" +
                    "        .form-container h2 {\n" +
                    "            font-size: 16px;\n" +
                    "            color: #6c757d;\n" +
                    "            text-align: center;\n" +
                    "            margin-bottom: 20px;\n" +
                    "        }\n" +
                    "        .form-container .btn {\n" +
                    "            width: 100%;\n" +
                    "        }\n" +
                    "        .form-container .links {\n" +
                    "            display: flex;\n" +
                    "            justify-content: center;\n" +
                    "            margin-top: 20px;\n" +
                    "        }\n" +
                    "        .form-container .links a {\n" +
                    "            color: #6c757d;\n" +
                    "            text-decoration: none;\n" +
                    "            margin: 0 10px;\n" +
                    "        }\n" +
                    "        .form-container .links a:hover {\n" +
                    "            text-decoration: underline;\n" +
                    "        }\n" +
                    "    </style>\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "    <div class=\"container\">\n" +
                    "        <div class=\"form-container\">\n" +
                    "            <div class=\"text-center\">\n" +
                    "                <img src=\"images/logo.png\" width=\"auto\" height=\"52\">\n" +
                    "            </div>\n" +
                    "            <h2>Kiểm tra email của bạn để nhận liên kết đặt lại mật khẩu. Nếu không thấy email trong vài phút, hãy kiểm tra thư mục spam của bạn.</h2>\n" +
                    "            <div class=\"d-grid\">\n" +
                    "                <button class=\"btn btn-primary\" type=\"button\" onclick=\"location.href='login.jsp'\">Trở về đăng nhập</button>\n" +
                    "            </div>\n" +          
                    "        </div>\n" +
                    "    </div>\n" +
                    "    <script src=\"https://code.jquery.com/jquery-3.5.1.slim.min.js\"></script>\n" +
                    "    <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js\"></script>\n" +
                    "    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js\"></script>\n" +
                    "</body>\n" +
                    "</html>");
        }
        else{
            request.setAttribute("message", "Email không tồn tại");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }



    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}