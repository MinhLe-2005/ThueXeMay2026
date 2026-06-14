import os

filepath = "src/main/java/com/smartride/controller/SepayWebhookServlet.java"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

content = content.replace('daoMS.updateMotorcycleStatus(mcId, "AAA duyAAAt");', 'daoMS.insertMotorcycleStatus(mcId, "STAFF00001", "A,AA thanh toAAn cA?c", paymentDateText, "XAAc nhA?n tA? A,A?ng qua SePay");')

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated SepayWebhookServlet.java")
