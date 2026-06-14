import os

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
    lines = f.readlines()

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
                              </div>
"""

new_js_steps = """                        if (newIndex === 5) {
                              const dataH2 = document.getElementById('dataInput');
                              const dataTotalStr = dataH2.textContent.replace(/[^0-9]/g, ''); 
                              const dataTotal = parseInt(dataTotalStr, 10);
                              
                              // Generate fake order ID
                              window.currentOrderId = "DH" + new Date().getTime();
                              window.currentPaymentAmount = dataTotal;
                              
                              // Load SePay VietQR (Bank: VCB, Acc: 1037077133)
                              const qrUrl = `https://qr.sepay.vn/img?bank=VCB&acc=1037077133&template=compact&amount=${dataTotal}&des=${window.currentOrderId}`;
                              document.getElementById("sepay-qr-img").src = qrUrl;
                          }
"""

for i, line in enumerate(lines):
    if "<h2>THANH TOA" in line and "C" in line:
        # Found the heading. Replace it and the next 2 lines.
        lines[i] = new_step6
        lines[i+1] = ""
        lines[i+2] = ""
        break

for i, line in enumerate(lines):
    if "if (newIndex === 5) {" in line:
        # Found the if block. Find the end of it.
        lines[i] = new_js_steps
        j = i + 1
        open_brackets = 0
        while j < len(lines):
            if "{" in lines[j]:
                open_brackets += lines[j].count("{")
            if "}" in lines[j]:
                open_brackets -= lines[j].count("}")
                if open_brackets < 0:
                    lines[j] = ""
                    break
            lines[j] = ""
            j += 1
        break

with open(filepath, 'w', encoding='utf-8') as f:
    f.writelines(lines)
print("Updated via line parsing")
