import os
import re

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
    content = f.read()

# Replace Step 6 HTML
html_pattern = re.compile(r'<h3>Thanh toAn</h3>\s*<fieldset>.*?</fieldset>', re.DOTALL)
new_html = """<h3>Thanh toAn</h3>
                        <fieldset>
                            <h2>THANH TOA?N COC (VIETQR T? D?NG)</h2>
                            <p class="desc">Vui lA?ng m? ?ng d?ng ngA?n hA?ng vA? quA?t mA? QR bA?n d??i d? thanh toA?n c?c t? d?ng.</p>
                            
                            <div style="text-align: center; margin-top: 20px; padding: 20px; background: #fafafa; border-radius: 12px; border: 1px solid #eaeaea;">
                                <div style="display: flex; justify-content: center; gap: 40px; text-align: left; margin-bottom: 20px;">
                                    <div>
                                        <p style="margin:0; font-size: 13px; color: #6b7280;">T?ng ti?n thuA?:</p>
                                        <p id="sepay-total-amount" style="margin:0; font-size: 16px; font-weight: bold; color: #374151;">0 VN?</p>
                                    </div>
                                    <div>
                                        <p style="margin:0; font-size: 13px; color: #6b7280;">S? ti?n c?c (50%):</p>
                                        <p id="sepay-deposit-amount" style="margin:0; font-size: 20px; font-weight: bold; color: #b59349;">0 VN?</p>
                                    </div>
                                </div>
                                <img id="sepay-qr-img" src="" alt="VietQR" style="max-width: 280px; border: 1px solid #e5e7eb; border-radius: 12px; padding: 10px; background: white; box-shadow: 0 10px 25px rgba(0,0,0,0.05); transition: opacity 0.3s; opacity: 0.3;"/>
                                
                                <div style="margin-top: 20px; font-size: 15px; color: #4b5563;">
                                    Tr?ng thA?i: <span id="sepay-status-text" style="font-weight: bold; color: #b59349;"><i class="fas fa-spinner fa-spin" style="margin-right: 5px;"></i> ?ang kh?i t?o d?n hA?ng...</span>
                                </div>
                                <p style="font-size: 13px; color: #9ca3af; margin-top: 8px;">D?n hA?ng s? t? d?ng xA?c nh?n ngay khi b?n chuy?n kho?n thA?nh cA?ng.</p>
                                
                                <div style="display: flex; gap: 10px; justify-content: center; margin-top: 30px;">
                                    <button type="button" onclick="payLater()" style="padding: 10px 20px; background: #374151; color: white; border: none; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer;">
                                        Thanh toA?n sau (Ti?n m?t)
                                    </button>
                                    <!-- NA?t nA?y ch? d? test -->
                                    <button type="button" onclick="simulatePaymentSuccess()" style="padding: 10px 20px; background: #e5e7eb; border: 1px solid #d1d5db; border-radius: 8px; font-size: 13px; color: #4b5563; cursor: pointer;">
                                        <i class="fas fa-bug"></i> (Dev) KhA?ch dA? chuy?n ti?n
                                    </button>
                                </div>
                            </div>
                        </fieldset>"""

content = html_pattern.sub(new_html, content)
with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated HTML step 6")
