import os

filepath = "src/main/java/com/smartride/controller/BookingInforHander.java"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

old_payment_logic = """        //Payment
        // A,A?AA?1nh dAAAng chuAA?"i A,?~AAA u vAAo"""

new_payment_logic = """        // Check if this is just order creation
        String action = request.getParameter("action");
        if ("create_only".equals(action)) {
            String jsonResponse = "{\\\"status\\\":\\\"success\\\", \\\"bookingId\\\":\\\"" + bookingid + "\\\"}";
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(jsonResponse);
            return;
        }

        //Payment
        // A,A?AA?1nh dAAAng chuAA?"i A,?~AAA u vAAo"""
content = content.replace(old_payment_logic, new_payment_logic)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated BookingInforHander.java")
