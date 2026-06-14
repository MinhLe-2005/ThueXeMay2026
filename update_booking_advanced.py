import os
import re

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
    content = f.read()

# 1. Add "Thanh toán sau" button and id to status text
old_sepay_ui = """                                  <div style="margin-top: 20px; font-size: 15px; color: #4b5563;">
                                      Trạng thái: <span style="font-weight: bold; color: #b59349;"><i class="fas fa-spinner fa-spin" style="margin-right: 5px;"></i> Đang chờ nhận tiền...</span>
                                  </div>
                                  <p style="font-size: 13px; color: #9ca3af; margin-top: 8px;">Đơn hàng sẽ tự động xác nhận ngay khi bạn chuyển khoản thành công.</p>
                                  
                                  <!-- Nút này chỉ để test -->
                                  <button type="button" onclick="simulatePaymentSuccess()" style="margin-top: 30px; padding: 8px 16px; background: #e5e7eb; border: 1px solid #d1d5db; border-radius: 6px; font-size: 12px; color: #4b5563; cursor: pointer; transition: 0.2s;">
                                      <i class="fas fa-bug"></i> (Dev) Mô phỏng Khách đã chuyển tiền
                                  </button>
                              </div>"""

new_sepay_ui = """                                  <div style="margin-top: 20px; font-size: 15px; color: #4b5563;">
                                      Trạng thái: <span id="sepay-status-text" style="font-weight: bold; color: #b59349;"><i class="fas fa-spinner fa-spin" style="margin-right: 5px;"></i> Đang khởi tạo đơn hàng...</span>
                                  </div>
                                  <p style="font-size: 13px; color: #9ca3af; margin-top: 8px;">Đơn hàng sẽ tự động xác nhận ngay khi bạn chuyển khoản thành công.</p>
                                  
                                  <div style="display: flex; gap: 10px; justify-content: center; margin-top: 30px;">
                                      <button type="button" onclick="payLater()" style="padding: 10px 20px; background: #374151; color: white; border: none; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer;">
                                          Thanh toán sau (Tiền mặt)
                                      </button>
                                      <!-- Nút này chỉ để test -->
                                      <button type="button" onclick="simulatePaymentSuccess()" style="padding: 10px 20px; background: #e5e7eb; border: 1px solid #d1d5db; border-radius: 8px; font-size: 13px; color: #4b5563; cursor: pointer;">
                                          <i class="fas fa-bug"></i> (Dev) Khách đã chuyển tiền
                                      </button>
                                  </div>
                              </div>"""
content = content.replace(old_sepay_ui, new_sepay_ui)

# 2. Update newIndex === 5
old_newindex_5 = """                        if (newIndex === 5) {
                              const dataH2 = document.getElementById('dataInput');
                              const dataTotalStr = dataH2.textContent.replace(/[^0-9]/g, ''); 
                              const dataTotal = parseInt(dataTotalStr, 10);
                              
                              // Generate fake order ID
                              window.currentOrderId = "DH" + new Date().getTime();
                              window.currentPaymentAmount = dataTotal;
                              
                              // Load SePay VietQR (Bank: VCB, Acc: 1037077133)
                              const qrUrl = `https://qr.sepay.vn/img?bank=VCB&acc=1037077133&template=compact&amount=${dataTotal}&des=${window.currentOrderId}`;
                              document.getElementById("sepay-qr-img").src = qrUrl;
                          }"""

new_newindex_5 = """                        if (newIndex === 5) {
                              if (!window.currentOrderId) {
                                  const dataH2 = document.getElementById('dataInput');
                                  const dataTotalStr = dataH2.textContent.replace(/[^0-9]/g, ''); 
                                  const dataTotal = parseInt(dataTotalStr, 10);
                                  window.currentPaymentAmount = dataTotal;
                                  
                                  document.getElementById("sepay-qr-img").style.opacity = "0.3";
                                  BookingHandler({ action: 'create_only' });
                              }
                          }"""
content = content.replace(old_newindex_5, new_newindex_5)

# 3. Modify simulatePaymentSuccess and add payLater
old_simulate = """        function simulatePaymentSuccess() {
            var dataReturn = {
                status: 'success',
                txnRef: window.currentOrderId,
                amount: window.currentPaymentAmount,
                time: new Date().toISOString()
            };
            BookingHandler(dataReturn);
        }"""

new_simulate = """        function payLater() {
            if (!window.currentOrderId) return;
            document.getElementById("booking-success-overlay").style.display = "flex";
        }
        
        function simulatePaymentSuccess() {
            if (!window.currentOrderId) return;
            $.ajax({
                type: "POST",
                url: "sepay-webhook",
                data: { bookingId: window.currentOrderId, amount: window.currentPaymentAmount, status: "success" },
                success: function(response) {
                     document.getElementById("booking-success-overlay").style.display = "flex";
                }
            });
        }"""
content = content.replace(old_simulate, new_simulate)

# 4. Modify BookingHandler to send create_only and handle response
content = content.replace('url: "bookinghandler",', 'url: dataReturn && dataReturn.action === "create_only" ? "bookinghandler?action=create_only" : "bookinghandler",')

old_ajax_success = """                  success: function(response) {
                      console.log("Data sent successfully:", response);
                      document.getElementById("booking-success-overlay").style.display = "flex";
                  },"""

new_ajax_success = """                  success: function(response) {
                      console.log("Data sent successfully:", response);
                      if (dataReturn && dataReturn.action === 'create_only') {
                          window.currentOrderId = response.bookingId;
                          const qrUrl = `https://qr.sepay.vn/img?bank=VCB&acc=1037077133&template=compact&amount=${window.currentPaymentAmount}&des=${window.currentOrderId}`;
                          document.getElementById("sepay-qr-img").src = qrUrl;
                          document.getElementById("sepay-qr-img").style.opacity = "1";
                          document.getElementById("sepay-status-text").innerHTML = "<i class='fas fa-spinner fa-spin'></i> Đang chờ nhận tiền...";
                      } else {
                          document.getElementById("booking-success-overlay").style.display = "flex";
                      }
                  },"""
content = content.replace(old_ajax_success, new_ajax_success)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated booking.jsp")
