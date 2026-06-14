import os

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# Add the success overlay HTML right before </body>
overlay_html = """
    <!-- Success Overlay -->
    <div id="booking-success-overlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255,255,255,0.95); z-index: 10000; flex-direction: column; justify-content: center; align-items: center; text-align: center;">
        <div style="background: white; padding: 40px; border-radius: 16px; box-shadow: 0 10px 40px rgba(0,0,0,0.1); max-width: 400px; width: 90%;">
            <div style="width: 80px; height: 80px; background: #10b981; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px;">
                <i class="fas fa-check" style="color: white; font-size: 40px;"></i>
            </div>
            <h2 style="color: #1f2937; font-weight: 800; margin-bottom: 10px;">Đặt Xe Thành Công!</h2>
            <p style="color: #6b7280; margin-bottom: 30px; line-height: 1.5;">Cảm ơn bạn đã tin tưởng dịch vụ của chúng tôi. Thông tin đơn đặt xe đã được ghi nhận trên hệ thống.</p>
            <button onclick="window.location.href='home'" style="background: #b59349; color: white; border: none; padding: 12px 30px; font-size: 16px; font-weight: bold; border-radius: 8px; cursor: pointer; transition: 0.3s; width: 100%;">Về Trang Chủ</button>
        </div>
    </div>
"""
content = content.replace("</body>", overlay_html + "\n</body>")

# Replace the AJAX logic
old_ajax = """            $.ajax({
                type: "POST",
                url: "bookinghandler", // Thay đổi URL tới servlet của bạn
//                data: JSON.stringify(data),              
//                contentType: "application/json",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    console.log("Data sent successfully:", response);
                },
                error: function(xhr, status, error) {
                    console.error("Error sending data:", error);
                }
            });
            window.location.href = 'home';
        }"""

new_ajax = """            $.ajax({
                type: "POST",
                url: "bookinghandler",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    console.log("Data sent successfully:", response);
                    document.getElementById("booking-success-overlay").style.display = "flex";
                },
                error: function(xhr, status, error) {
                    console.error("Error sending data:", error);
                    alert("Đã xảy ra lỗi khi lưu đơn hàng. Vui lòng thử lại!");
                }
            });
        }"""
content = content.replace(old_ajax, new_ajax)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated booking.jsp with success overlay")
