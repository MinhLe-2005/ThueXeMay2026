import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

sepay_ui = """
                            <div id="sepay-qr-container" style="text-align: center; padding: 20px;">
                                <h4 style="color: #b59349; font-weight: bold; margin-bottom: 15px;">Quét Mã VietQR Để Đặt Cọc</h4>
                                <p style="font-size: 16px; margin-bottom: 10px;">Tổng thanh toán: <b id="sepay-total-amount" style="color: #dc3545; font-size: 20px;">...</b></p>
                                <p style="font-size: 16px; margin-bottom: 20px;">Số tiền cọc: <b id="sepay-deposit-amount" style="color: #dc3545; font-size: 20px;">...</b></p>
                                <img id="sepay-qr-img" src="" alt="Mã QR VietQR" style="max-width: 300px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); margin-bottom: 20px; transition: 0.3s; opacity: 0.3;">
                                <div id="sepay-status-text" style="font-size: 16px; font-weight: 500; color: #10b981; margin-top: 10px;">
                                    <i class="fas fa-spinner fa-spin"></i> Đang khởi tạo đơn hàng...
                                </div>
                            </div>
"""

content = re.sub(r'<iframe id="myIframe".*?</iframe>', sepay_ui, content, flags=re.DOTALL)

step_logic = """                       if(currentIndex === 5){
                              BookingHandler({ action: 'create_only' });
                         }"""
content = re.sub(r'if\(currentIndex === 5\)\{.*?const observer = new MutationObserver\(sendDataToIframe\);.*?observer\.observe\(dataH2, \{ childList: true, subtree: true \}\);\s*\}', step_logic, content, flags=re.DOTALL)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)