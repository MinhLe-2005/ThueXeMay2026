import os

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Replace iframe with SePay UI
old_step6 = """                              <h2>THANH TOA?N COC</h2>
                              <p class="desc">HAy thanh toAn s` ti?n c?c theo bAn d>i ` hoAn thAnh `n `t xe c a bn</p>
                              <iframe id="myIframe" src="vnpay_pay.jsp" style="width: 100%; height: 550px; border-style: hidden"></iframe>"""

new_step6 = """                              <h2>THANH TOÁN CỌC (VIETQR TỰ ĐỘNG)</h2>
                              <p class="desc">Vui lòng mở ứng dụng ngân hàng và quét mã QR bên dưới để thanh toán cọc tự động.</p>
                              
                              <div style="text-align: center; margin-top: 20px; padding: 20px; background: #fafafa; border-radius: 12px; border: 1px solid #eaeaea;">
                                  <img id="sepay-qr-img" src="" alt="VietQR" style="max-width: 280px; border: 1px solid #e5e7eb; border-radius: 12px; padding: 10px; background: white; box-shadow: 0 10px 25px rgba(0,0,0,0.05);"/>
                                  
                                  <div style="margin-top: 20px; font-size: 15px; color: #4b5563;">
                                      Trạng thái: <span style="font-weight: bold; color: #b59349;"><i class="fas fa-spinner fa-spin" style="margin-right: 5px;"></i> Đang chờ nhận tiền...</span>
                                  </div>
                                  <p style="font-size: 13px; color: #9ca3af; margin-top: 8px;">Đơn hàng sẽ tự động xác nhận ngay khi bạn chuyển khoản thành công.</p>
                                  
                                  <!-- Nút này chỉ để test -->
                                  <button type="button" onclick="simulatePaymentSuccess()" style="margin-top: 30px; padding: 8px 16px; background: #e5e7eb; border: 1px solid #d1d5db; border-radius: 6px; font-size: 12px; color: #4b5563; cursor: pointer; transition: 0.2s;">
                                      <i class="fas fa-bug"></i> (Dev) Mô phỏng Khách đã chuyển tiền
                                  </button>
                              </div>"""
# Since encoding issues might prevent exact match, I'll search for 'myIframe' and replace the block
import re
content = re.sub(r'<h2>THANH TOA\?N C.*?<iframe id="myIframe".*?</iframe>', new_step6, content, flags=re.DOTALL)

# Add simulatePaymentSuccess and update step logic
old_js_steps = """                        if (newIndex === 5) {
                              const dataH2 = document.getElementById('dataInput');
  
                              // Ly iframe
                              const iframe = document.getElementById('myIframe');
  
                              // Truy?n d_ liu t th h2 vAo iframe khi th h2 thay ` i
                              const sendDataToIframe = () => {
                                  // Ly giA tr< c a th h2
                                  const dataTotal = dataH2.textContent.replace(/[,,.]/g, '').trim(); // Ly d_ liu vA xA3a du chm vA du chm cAu
                                  iframe.contentWindow.postMessage(dataTotal, '*');
                              };
  
                              // To Observer ` theo dAui s thay ` i nTi dung c a th h2
                              const observer = new MutationObserver(() => {
                                  sendDataToIframe();
                              });
  
                              // Cu hAnh Observer ` lng nghe s thay ` i nTi dung (text)
                              observer.observe(dataH2, { childList: true, subtree: true, characterData: true });
  
                              // G-i d_ liu l n ` u khi iframe ti xong
                              iframe.onload = () => {
                                  sendDataToIframe();
                              };
                          }"""

new_js_steps = """                        if (newIndex === 5) {
                              const dataH2 = document.getElementById('dataInput');
                              const dataTotal = dataH2.textContent.replace(/[₫,.]/g, '').replace('VND', '').trim(); 
                              
                              // Generate fake order ID
                              window.currentOrderId = "DH" + new Date().getTime();
                              window.currentPaymentAmount = dataTotal;
                              
                              // Load SePay VietQR (Bank: VCB, Acc: 1037077133)
                              const qrUrl = `https://qr.sepay.vn/img?bank=VCB&acc=1037077133&template=compact&amount=${dataTotal}&des=${window.currentOrderId}`;
                              document.getElementById("sepay-qr-img").src = qrUrl;
                          }"""
content = re.sub(r'if \(newIndex === 5\) \{.*?iframe\.onload.*?\}\;', new_js_steps, content, flags=re.DOTALL)

# Add the simulate function
simulate_func = """
        function simulatePaymentSuccess() {
            var dataReturn = {
                status: 'success',
                txnRef: window.currentOrderId,
                amount: window.currentPaymentAmount,
                time: new Date().toISOString()
            };
            BookingHandler(dataReturn);
        }
"""
content = content.replace("function BookingHandler(dataReturn) {", simulate_func + "\n        function BookingHandler(dataReturn) {")

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated booking.jsp with SePay UI and logic")
