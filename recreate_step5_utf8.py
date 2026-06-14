import os

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

start_marker = "<h3>Xác nhận</h3>"
end_marker = "<h3>Thanh toán</h3>"

start_idx = content.find(start_marker)
end_idx = content.find(end_marker)

if start_idx == -1:
    # Maybe it's garbled in the file currently?
    print("Warning: Clean start marker not found. Trying regex or older marker...")
    import re
    # Try finding the original "Xác nhận" or any corrupted version
    match = re.search(r'<h3>X.*?c nh.*?n</h3>', content)
    if match:
        start_idx = match.start()
        print("Found via regex.")

if end_idx == -1:
    match2 = re.search(r'<h3>Thanh to.*?n</h3>', content)
    if match2:
        end_idx = match2.start()

new_step5 = """<h3>Xác nhận</h3>
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
                                            <h4 style="margin-top: 0; color: #b59349; border-bottom: 2px solid #f0f0f0; padding-bottom: 10px; margin-bottom: 20px;"><i class="bi bi-person-lines-fill"></i> THÔNG TIN KHÁCH HÀNG</h4>
                                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
                                                <div><label style="font-size: 11px; color: #888;">Họ và Tên</label><p style="margin: 0; font-weight: 600;" id="fullnametext"></p></div>
                                                <div><label style="font-size: 11px; color: #888;">Số điện thoại</label><p style="margin: 0; font-weight: 600;" id="phonetext"></p></div>
                                                <div style="grid-column: span 2;"><label style="font-size: 11px; color: #888;">Email</label><p style="margin: 0; font-weight: 600;" id="emailtext"></p></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Cột phải: Dịch vụ -->
                                    <div style="flex: 1; min-width: 300px;">
                                        <div class="form-box" style="padding: 24px; background: #faf9f7; border-radius: 12px; border: 1px solid #e0d5b7;">
                                            <h4 style="margin-top: 0; color: #b59349; border-bottom: 2px solid #e0d5b7; padding-bottom: 10px; margin-bottom: 20px;"><i class="bi bi-bicycle"></i> DỊCH VỤ ĐÃ CHỌN</h4>
                                            
                                            <label style="font-size: 12px; font-weight: 700; color: #555; text-transform: uppercase;">Xe máy</label>
                                            <div id="savedBikeContainer" style="margin-bottom: 20px; padding: 12px; background: #fff; border-radius: 8px;"></div>
                                            
                                            <label style="font-size: 12px; font-weight: 700; color: #555; text-transform: uppercase;">Phụ kiện</label>
                                            <div id="savedItemsContainer" style="margin-bottom: 20px; padding: 12px; background: #fff; border-radius: 8px;"></div>
                                            
                                            <div style="border-top: 2px dashed #ccc; margin: 20px 0;"></div>
                                            
                                            <div style="display: flex; justify-content: space-between; align-items: flex-end;">
                                                <h4 style="margin: 0; color: #333;">TỔNG CỘNG</h4>
                                                <p id="totaltext" style="font-size: 24px; font-weight: 800; color: #b59349; margin: 0;"></p>
                                            </div>
                                            <input type="hidden" id="finalTotal" name="total" value="0"/>
                                            <input type="hidden" id="daysTotal" name="totaldays" value="1"/>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </fieldset>
                        
                        """

if start_idx != -1 and end_idx != -1:
    content = content[:start_idx] + new_step5 + content[end_idx:]
    with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
        f.write(content)
    print("Success")
else:
    print("Failed to find markers")
