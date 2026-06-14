import os
import re

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
    content = f.read()

# Replace if(currentIndex === 5) inside onStepChanged
js_pattern = re.compile(r'if\s*\(\s*currentIndex\s*===\s*5\s*\)\s*\{.*?const\s+sendDataToIframe\s*=\s*\(\)\s*=>\s*\{.*?\};\s*\}', re.DOTALL)
new_js = """if(currentIndex === 5){
                             var finishButton = document.querySelector('.wizard .actions a[href="#finish"]');
                             finishButton.style.display = 'none';
                             
                             if (!window.currentOrderId) {
                                  const dataH2 = document.getElementById('dataInput');
                                  const dataTotalStr = dataH2.textContent.replace(/[^0-9]/g, ''); 
                                  const dataTotal = parseInt(dataTotalStr, 10);
                                  const depositAmount = Math.round(dataTotal / 2);
                                  
                                  window.currentTotalAmount = dataTotal;
                                  window.currentPaymentAmount = depositAmount;
                                  
                                  document.getElementById("sepay-total-amount").textContent = dataTotal.toLocaleString() + ' VN?';
                                  document.getElementById("sepay-deposit-amount").textContent = depositAmount.toLocaleString() + ' VN?';
                                  document.getElementById("sepay-qr-img").style.opacity = "0.3";
                                  document.getElementById("sepay-status-text").innerHTML = "<i class='fas fa-spinner fa-spin'></i> ?ang kh?i t?o d?n hA?ng...";
                                  
                                  BookingHandler({ action: 'create_only' });
                             }
                         }"""
content = js_pattern.sub(new_js, content)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated JS index 5")
