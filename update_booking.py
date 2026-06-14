import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# Replace iframe with SePay UI
sepay_ui = """
                            <div id="sepay-qr-container" style="text-align: center; padding: 20px;">
                                <h3 style="color: #b59349; font-weight: bold; margin-bottom: 15px;">Quét Mã VietQR Để Đặt Cọc</h3>
                                <p style="font-size: 16px; margin-bottom: 10px;">Tổng thanh toán: <b id="sepay-total-amount" style="color: #dc3545; font-size: 20px;">...</b></p>
                                <p style="font-size: 16px; margin-bottom: 20px;">Số tiền cọc: <b id="sepay-deposit-amount" style="color: #dc3545; font-size: 20px;">...</b></p>
                                <img id="sepay-qr-img" src="" alt="Mã QR VietQR" style="max-width: 300px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); margin-bottom: 20px; transition: 0.3s; opacity: 0.3;">
                                <div id="sepay-status-text" style="font-size: 16px; font-weight: 500; color: #10b981; margin-top: 10px;">
                                    <i class="fas fa-spinner fa-spin"></i> Đang khởi tạo đơn hàng...
                                </div>
                            </div>
"""
content = re.sub(r'<iframe id="myIframe".*?</iframe>', sepay_ui, content, flags=re.DOTALL)

# Find onStepChanged and modify index === 5 logic
# We want to call BookingHandler({ action: 'create_only' }) when reaching step 6
step_logic = """
                       if(currentIndex === 5){
                           var finishButton = document.querySelector('.wizard .actions a[href="#finish"]');
                           finishButton.style.display = 'none';
                           
                            const dataH2 = document.getElementById('dataInput');
                            const dataTotalStr = dataH2.textContent.replace(/[₫,.]/g, '').trim();
                            const dataTotal = parseInt(dataTotalStr) || 0;
                            const depositAmount = dataTotal * 10 / 100; // 10% deposit
                            
                            window.currentTotalAmount = dataTotal;
                            window.currentPaymentAmount = depositAmount;
                            
                            document.getElementById("sepay-total-amount").textContent = dataTotal.toLocaleString() + ' VNĐ';
                            document.getElementById("sepay-deposit-amount").textContent = depositAmount.toLocaleString() + ' VNĐ';
                            document.getElementById("sepay-qr-img").style.opacity = "0.3";
                            document.getElementById("sepay-status-text").innerHTML = "<i class='fas fa-spinner fa-spin'></i> Đang khởi tạo đơn hàng...";
                            
                            BookingHandler({ action: 'create_only' });
                       }
"""
content = re.sub(r'if\(currentIndex === 5\)\{.*?const observer = new MutationObserver\(sendDataToIframe\);.*?observer\.observe\(dataH2, \{ childList: true, subtree: true \}\);\s*\}', step_logic, content, flags=re.DOTALL)


# Modify BookingHandler to accept options and start polling
# Wait, the original function is `function BookingHandler(dataReturn) {`
booking_handler_replacement = """
        function BookingHandler(options) {
            var formData = new FormData();
             // Lấy các giá trị từ các thẻ <p>
            var pickupDate = document.getElementById("pickupdatetext").textContent.trim();
            var pickupTime = document.getElementById("pickuptimetext").textContent.trim();
            var pickupLocation = document.getElementById("pickuploctext").textContent.trim();
            var returnLocation = document.getElementById("returnloctext").textContent.trim();
            var returnDate = document.getElementById("returndatetext").textContent.trim();
            var returnTime = document.getElementById("returntimetext").textContent.trim();
            var accountId = document.getElementById("accountId").textContent.trim();
            var fistname = document.getElementById("firstnametext").textContent.trim();
            var lastname = document.getElementById("lastnametext").textContent.trim();
            var phone = document.getElementById("phonetext").textContent.trim();
            var email = document.getElementById("emailaddresstext").textContent.trim();
            var address = document.getElementById("addresstext").textContent.trim();
            var dob = document.getElementById("birthdaytext").textContent.trim();
            var gender = document.getElementById("gendertext").textContent.trim();
            var customerId = document.getElementById("customerId").textContent.trim();
            var identityCard = document.getElementById("identityCard").value;
            var issuedon = document.getElementById("issuedon").value;
            var expdate = document.getElementById("expdate").value;
            var total = document.getElementById("dataInput").textContent.trim();
            
            const pickupD = new Date(pickupDate);
            const returnD = new Date(returnDate);
            const differenceInTime = returnD.getTime() - pickupD.getTime();
            const differenceInDays = differenceInTime / (1000 * 3600 * 24);
            
            var quantityDay = Math.max(1, Math.ceil(differenceInDays));
            
            let dataTotal = window.currentTotalAmount || 0;
            let depositAmount = window.currentPaymentAmount || 0;

            const accessories = collectAccessoryData();
            
            var data = {
                customerId: customerId,
                accountId: accountId,
                pickupDate: pickupDate,
                pickupTime: pickupTime,
                pickupLocation: pickupLocation,
                returnDate: returnDate,
                returnTime: returnTime,
                quantityDay: quantityDay,
                motorcycleDetailIds: ${listDetail},
                fistname: fistname,
                lastname: lastname,
                phone: phone,
                email: email,
                address: address,
                dob: dob,
                gender: gender,
                identityCard: identityCard,
                issuedon: issuedon,
                expdate: expdate,
                amount: depositAmount,
                total: dataTotal,
                accessories: accessories,
                voucherId: document.getElementById('applied-voucher-id').value || '0'
            };
            
            formData.append("jsonData", JSON.stringify(data));
            
            if (options && options.action === 'create_only') {
                formData.append("action", "create_only");
            }

            var fileInputFront = document.getElementById('imageFront');
            var fileInputBack = document.getElementById('imageBack');
            if (fileInputFront && fileInputFront.files.length > 0) {
                formData.append("fileFront", fileInputFront.files[0]);
            }
            if (fileInputBack && fileInputBack.files.length > 0) {
                formData.append("fileBack", fileInputBack.files[0]);
            }

            $.ajax({
                type: "POST",
                url: "bookinghandler",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    if (options && options.action === 'create_only') {
                        if (response.status === 'success' && response.bookingId) {
                            var bId = response.bookingId;
                            var qrUrl = "https://qr.sepay.vn/img?acc=1037077133&bank=Vietcombank&amount=" + depositAmount + "&des=" + bId;
                            document.getElementById("sepay-qr-img").src = qrUrl;
                            document.getElementById("sepay-qr-img").style.opacity = "1";
                            document.getElementById("sepay-status-text").innerHTML = "<i class='fas fa-qrcode'></i> Vui lòng quét mã để thanh toán. Tự động kiểm tra...";
                            
                            // Start polling
                            var pollInterval = setInterval(function() {
                                $.get("check-payment-status?bookingId=" + bId, function(res) {
                                    if (res.status === 'paid') {
                                        clearInterval(pollInterval);
                                        document.getElementById("sepay-status-text").innerHTML = "<i class='fas fa-check-circle'></i> Thanh toán thành công! Đang chuyển hướng...";
                                        document.getElementById("sepay-status-text").style.color = "#16a34a";
                                        document.getElementById("booking-success-overlay").style.display = "flex";
                                    }
                                });
                            }, 3000);
                        }
                    } else {
                        window.location.href = 'home';
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error sending data:", error);
                }
            });
        }
"""
content = re.sub(r'function BookingHandler\(dataReturn\).*?window\.location\.href = \'home\';\s*\}', booking_handler_replacement, content, flags=re.DOTALL)

# Remove the old vnpay_return.jsp iframe at the bottom
content = re.sub(r'<iframe id="myI".*?</iframe>', '', content)

# Add success overlay at the very end before </body>
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
if "booking-success-overlay" not in content:
    content = content.replace("</body>", overlay_html + "\n</body>")

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)