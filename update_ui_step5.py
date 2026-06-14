import os
filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

start_marker = "<h3>Xác nhận</h3>"
end_marker = "<h3>Thanh toán</h3>"

start_idx = content.find(start_marker)
end_idx = content.find(end_marker)

if start_idx != -1 and end_idx != -1:
    new_html = """<h3>Xác nhận</h3>
                        <fieldset>
                            <h2>XÁC NHẬN ĐƠN ĐẶT XE</h2>
                            <p class="desc">Hãy kiểm tra kỹ thông tin đơn đặt xe của bạn trước khi thanh toán.</p>
                            <div class="fieldset-content">
                                <div class="scrollable-vertical" style="display: flex; gap: 30px; flex-wrap: wrap;">
                                    
                                    <!-- Cột trái: Thông tin -->
                                    <div style="flex: 1; min-width: 300px;">
                                        <div class="form-box" style="padding: 24px; background: #fff; border-radius: 12px; border: 1px solid #eaeaea; margin-bottom: 20px;">
                                            <h4 style="margin-top: 0; color: #b59349; border-bottom: 2px solid #f0f0f0; padding-bottom: 10px; margin-bottom: 20px;"><i class="bi bi-clock-history"></i> THỜI GIAN</h4>
                                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                                                <div>
                                                    <label style="font-size: 11px; text-transform: uppercase; color: #888; font-weight: 700;">Nhận xe</label>
                                                    <p style="font-size: 15px; color: #333; font-weight: 600; margin: 4px 0 0;"><span id="pickupdatetext"></span> <span id="pickuptimetext"></span></p>
                                                    <p id="pickuploctext" style="font-size: 13px; color: #666; margin: 4px 0 0;"></p>
                                                </div>
                                                <div>
                                                    <label style="font-size: 11px; text-transform: uppercase; color: #888; font-weight: 700;">Trả xe</label>
                                                    <p style="font-size: 15px; color: #333; font-weight: 600; margin: 4px 0 0;"><span id="returndatetext"></span> <span id="returntimetext"></span></p>
                                                    <p id="returnloctext" style="font-size: 13px; color: #666; margin: 4px 0 0;"></p>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-box" style="padding: 24px; background: #fff; border-radius: 12px; border: 1px solid #eaeaea;">
                                            <h4 style="margin-top: 0; color: #b59349; border-bottom: 2px solid #f0f0f0; padding-bottom: 10px; margin-bottom: 20px;"><i class="bi bi-person-lines-fill"></i> KHÁCH HÀNG</h4>
                                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                                                <div>
                                                    <label style="font-size: 11px; text-transform: uppercase; color: #888; font-weight: 700;">Họ và Tên</label>
                                                    <p style="font-size: 15px; color: #333; font-weight: 600; margin: 4px 0 0;"><span id="firstnametext"></span> <span id="lastnametext"></span></p>
                                                </div>
                                                <div>
                                                    <label style="font-size: 11px; text-transform: uppercase; color: #888; font-weight: 700;">Số điện thoại</label>
                                                    <p id="phonetext" style="font-size: 15px; color: #333; font-weight: 600; margin: 4px 0 0;"></p>
                                                </div>
                                                <div style="grid-column: span 2;">
                                                    <label style="font-size: 11px; text-transform: uppercase; color: #888; font-weight: 700;">Email</label>
                                                    <p id="emailaddresstext" style="font-size: 15px; color: #333; font-weight: 600; margin: 4px 0 0;"></p>
                                                </div>
                                                <div>
                                                    <label style="font-size: 11px; text-transform: uppercase; color: #888; font-weight: 700;">Ngày sinh</label>
                                                    <p id="birthdaytext" style="font-size: 15px; color: #333; font-weight: 600; margin: 4px 0 0;"></p>
                                                </div>
                                                <div>
                                                    <label style="font-size: 11px; text-transform: uppercase; color: #888; font-weight: 700;">Giới tính</label>
                                                    <p id="gendertext" style="font-size: 15px; color: #333; font-weight: 600; margin: 4px 0 0;"></p>
                                                </div>
                                                <div style="grid-column: span 2;">
                                                    <label style="font-size: 11px; text-transform: uppercase; color: #888; font-weight: 700;">CCCD/CMND</label>
                                                    <p style="font-size: 15px; color: #333; font-weight: 600; margin: 4px 0 0;"><span id="identityCardtext"></span> (Cấp: <span id="issuedontext"></span> - Hết hạn: <span id="expdatetext"></span>)</p>
                                                </div>
                                                <div style="grid-column: span 2;">
                                                    <label style="font-size: 11px; text-transform: uppercase; color: #888; font-weight: 700;">Địa chỉ</label>
                                                    <p id="addresstext" style="font-size: 15px; color: #333; font-weight: 600; margin: 4px 0 0;"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Cột phải: Hóa đơn -->
                                    <div style="flex: 1; min-width: 320px; max-width: 450px;">
                                        <div class="receipt-box" style="padding: 24px; background: #fafafa; border-radius: 12px; border: 1px solid #e0e0e0; box-shadow: 0 4px 15px rgba(0,0,0,0.05);">
                                            <h4 style="margin-top: 0; color: #333; font-weight: 800; text-align: center; border-bottom: 2px dashed #ccc; padding-bottom: 15px; margin-bottom: 20px;">HÓA ĐƠN TẠM TÍNH</h4>
                                            
                                            <!-- Container ẩn để clone JS nhưng không hiển thị trực tiếp ở đây nữa mà render thẳng vào receipt -->
                                            <div id="savedBikeContainer" style="display:none;"></div>
                                            <div id="savedItemsContainer" style="display:none;"></div>

                                            <div id="form-box-total" style="min-height: 100px;">
                                                <!-- Javascript sẽ render các item hóa đơn vào đây -->
                                            </div>

                                            <div style="margin-top: 20px; border-top: 2px dashed #ccc; padding-top: 20px;">
                                                <div style="display: flex; gap: 10px; align-items: center; width: 100%; margin-bottom: 15px;">
                                                    <input type="text" id="voucher-code-input" placeholder="Nhập mã voucher..."
                                                           style="flex:1; padding: 10px 14px; border: 1.5px solid #d1d5db; border-radius: 8px; font-size: 14px; outline: none;"
                                                           oninput="document.getElementById('voucher-msg').textContent=''; resetVoucher();" />
                                                    <button type="button" id="apply-voucher-btn"
                                                            onclick="applyVoucher()"
                                                            style="padding: 10px 20px; background: linear-gradient(135deg, #b59349 0%, #8c6f32 100%); color:#fff; border:none; border-radius:8px; font-size:14px; font-weight:600; cursor:pointer; white-space:nowrap;">
                                                        Áp dụng
                                                    </button>
                                                </div>
                                                <div id="voucher-msg" style="margin-top: -5px; margin-bottom: 10px; font-size: 13px;"></div>
                                                <input type="hidden" id="applied-voucher-id" value="0" />
                                                <input type="hidden" id="applied-discount" value="0" />
                                            </div>
                                            
                                            <div class="form-check" style="margin-top: 15px;">
                                                <div class="checkbox-container">
                                                    <input type="checkbox" id="daily-checkbox-term" onchange="toggleNextButton()">
                                                    <label for="daily-checkbox-term" style="font-size: 14px;">Tôi đồng ý với <a href="policies.jsp" target="_blank" style="color: #b59349; text-decoration: underline; font-weight: 600;">điều khoản dịch vụ</a></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </fieldset>

                        """

    content = content[:start_idx] + new_html + content[end_idx:]

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print("Updated HTML structure for Step 5")
else:
    print("Could not find start/end markers")
