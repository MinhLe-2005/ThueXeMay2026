import os
filepath = "src/main/webapp/vnpay_pay.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

timer_html = """              <div class="mb-4 text-center" style="background: #fff0f0; padding: 15px; border-radius: 8px; border: 1px solid #ffcaca;">
                  <h5 style="color: #d32f2f; margin: 0; font-weight: 700; font-size: 16px;">Thời gian thanh toán còn lại</h5>
                  <div id="countdown-timer" style="font-size: 28px; font-weight: 800; color: #d32f2f; margin-top: 5px;">10:00</div>
              </div>
              
              <h4 class="mb-4" style="color: #1e293b; font-weight: 800;">"""

content = content.replace('<h4 class="mb-4" style="color: #1e293b; font-weight: 800;">Tóm tắt thanh toán</h4>', timer_html + 'Tóm tắt thanh toán</h4>')

overlay_html = """
      <!-- Overlay khi hết hạn -->
      <div id="timeout-overlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.85); z-index: 9999; flex-direction: column; justify-content: center; align-items: center; text-align: center; color: white;">
          <i class="fas fa-clock" style="font-size: 60px; color: #ff4d4f; margin-bottom: 20px;"></i>
          <h2 style="font-weight: 800; margin-bottom: 15px;">Phiên thanh toán đã hết hạn</h2>
          <p style="font-size: 16px; margin-bottom: 30px;">Bạn đã quá 10 phút để thực hiện giao dịch. Vui lòng đặt lại đơn hàng mới.</p>
          <button onclick="parent.location.href='home.jsp'" style="background: #b59349; color: white; border: none; padding: 12px 30px; font-size: 16px; font-weight: bold; border-radius: 8px; cursor: pointer; transition: 0.3s;">Đặt lại từ đầu</button>
      </div>

      <script type="text/javascript">
          // 10 minutes countdown
          var timeInSecs = 10 * 60;
          var ticker = setInterval(function() {
              timeInSecs--;
              var m = Math.floor(timeInSecs / 60);
              var s = timeInSecs % 60;
              document.getElementById("countdown-timer").innerText = 
                  (m < 10 ? "0" : "") + m + ":" + (s < 10 ? "0" : "") + s;
              
              if (timeInSecs <= 0) {
                  clearInterval(ticker);
                  document.getElementById("timeout-overlay").style.display = "flex";
              }
          }, 1000);
      </script>
"""

content = content.replace("</body>", overlay_html + "\n</body>")

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated vnpay_pay.jsp with countdown timer")
