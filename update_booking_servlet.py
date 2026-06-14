import os

filepath = "src/main/java/com/smartride/controller/BookingServlet.java"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

old_logic = """        } else {
            session.setAttribute("redirectAfterLogin", "booking");
            response.sendRedirect("login");
        }"""

new_logic = """        } else {
            String motorcycleid = request.getParameter("motorcycleid");
            String redirectUrl = "booking";
            if (motorcycleid != null && !motorcycleid.isEmpty()) {
                redirectUrl += "?motorcycleid=" + motorcycleid;
            }
            session.setAttribute("redirectAfterLogin", redirectUrl);
            response.sendRedirect("login");
        }"""

content = content.replace(old_logic, new_logic)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated BookingServlet.java")
