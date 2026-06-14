import os

filepath = "src/main/java/com/smartride/controller/BookingInforHander.java"
with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
    lines = f.readlines()

new_payment_logic = """        // Check if this is just order creation
        String action = request.getParameter("action");
        if ("create_only".equals(action)) {
            String jsonResponse = "{\\\"status\\\":\\\"success\\\", \\\"bookingId\\\":\\\"" + bookingid + "\\\"}";
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(jsonResponse);
            return;
        }

"""

for i, line in enumerate(lines):
    if "//Payment" in line:
        lines.insert(i, new_payment_logic)
        break

# We also need to fix where it expects paymenttime and amount, because if create_only, those might be null.
for i, line in enumerate(lines):
    if "String paymentDate =" in line:
        lines[i] = '        String paymentDate = dataMap.containsKey("paymenttime") ? (String) dataMap.get("paymenttime") : "";\n'
    if "int amount = " in line and "dataMap.get(\"amount\")" in line:
        lines[i] = '        int amount = dataMap.containsKey("amount") ? Integer.parseInt((String) dataMap.get("amount")) : 0;\n'

with open(filepath, 'w', encoding='utf-8') as f:
    f.writelines(lines)
print("Updated BookingInforHander with python lines array")
