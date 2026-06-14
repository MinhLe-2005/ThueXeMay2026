import os
import re

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
    content = f.read()

# Replace BookingHandler and add new functions
js_pattern2 = re.compile(r'function\s+BookingHandler\s*\(\)\s*\{.*?success:\s*function\s*\(.*?\}\s*\);\s*\}', re.DOTALL)
new_js2 = """        function payLater() {
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
        }
        
        function BookingHandler(dataReturn) {
            var formData = new FormData();
            
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
            var identityCard = document.getElementById("identityCard").value;
            var issuedon = document.getElementById("issuedon").value;
            var expdate = document.getElementById("expdate").value;
            var total = document.getElementById("dataInput").textContent.replace(/[^0-9]/g, '');
            var imageFront = document.getElementById("imageFront").files[0];
            var imageBack = document.getElementById("imageBack").files[0];
            var note = document.getElementById("note").value;
            
            formData.append("pickupDate", pickupDate);
            formData.append("pickupTime", pickupTime);
            formData.append("pickupLocation", pickupLocation);
            formData.append("returnLocation", returnLocation);
            formData.append("returnDate", returnDate);
            formData.append("returnTime", returnTime);
            formData.append("accountId", accountId);
            formData.append("firstname", fistname);
            formData.append("lastname", lastname);
            formData.append("phone", phone);
            formData.append("email", email);
            formData.append("address", address);
            formData.append("dob", dob);
            formData.append("identityCard", identityCard);
            formData.append("issuedon", issuedon);
            formData.append("expdate", expdate);
            formData.append("total", total);
            if (imageFront) formData.append("imageFront", imageFront);
            if (imageBack) formData.append("imageBack", imageBack);
            formData.append("note", note);
            
            let selectedBikesArray = [];
            const motorBoxes = document.querySelectorAll('#motorcyclelist .form-box');
            motorBoxes.forEach(box => {
                const select = box.querySelector('.form-check-select');
                if (select && parseInt(select.value) > 0) {
                    const motorId = select.id.split('-').pop();
                    const qty = parseInt(select.value);
                    selectedBikesArray.push(motorId + ":" + qty);
                }
            });
            formData.append("selectedBikes", selectedBikesArray.join(","));

            let selectedAccessoriesArray = [];
            const accessoryBoxes = document.querySelectorAll('.form-box');
            accessoryBoxes.forEach(box => {
                const select = box.querySelector('.form-check-select');
                if (select && select.id.startsWith('daily-select-A') && parseInt(select.value) > 0) {
                    const accessoryId = select.id.split('-').pop();
                    const qty = parseInt(select.value);
                    selectedAccessoriesArray.push(accessoryId + ":" + qty);
                }
            });
            formData.append("selectedAccessories", selectedAccessoriesArray.join(","));
            
            const appliedVoucherId = document.getElementById('applied-voucher-id').value;
            formData.append("voucherId", appliedVoucherId);
            
            let url = "bookinghandler";
            if (dataReturn && dataReturn.action === 'create_only') {
                url += "?action=create_only";
            }
            
            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: url,
                data: formData,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function(response) {
                    console.log("Data sent successfully:", response);
                    if (dataReturn && dataReturn.action === 'create_only') {
                        window.currentOrderId = response.bookingId;
                        const qrUrl = `https://qr.sepay.vn/img?bank=VCB&acc=1037077133&template=compact&amount=${window.currentPaymentAmount}&des=${window.currentOrderId}`;
                        document.getElementById("sepay-qr-img").src = qrUrl;
                        document.getElementById("sepay-qr-img").style.opacity = "1";
                        document.getElementById("sepay-status-text").innerHTML = "<i class='fas fa-spinner fa-spin'></i> ?ang ch? nh?n ti?n...";
                    } else {
                        document.getElementById("booking-success-overlay").style.display = "flex";
                    }
                },
                error: function(e) {
                    console.log("ERROR: ", e);
                }
            });
        }"""
content = js_pattern2.sub(new_js2, content)

# Remove the vnpay_return iframe
content = content.replace('<iframe id="myI" src="vnpay_return.jsp" style="width: 100%; height: 1000px; display:none;"></iframe>', '')

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated JS BookingHandler")
