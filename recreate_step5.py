import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

step5_new = """                            <div class="fieldset-content">
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
                                                <div><label style="font-size: 11px; color: #888;">Điện thoại</label><p style="margin: 0; font-weight: 600;" id="phonetext"></p></div>
                                                <div><label style="font-size: 11px; color: #888;">CCCD</label><p style="margin: 0; font-weight: 600;" id="identitytext"></p></div>
                                                <div><label style="font-size: 11px; color: #888;">Email</label><p style="margin: 0; font-weight: 600;" id="emailtext"></p></div>
                                                <div style="grid-column: span 2;"><label style="font-size: 11px; color: #888;">Địa chỉ</label><p style="margin: 0; font-weight: 600;" id="addresstext"></p></div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!-- Cột phải: Hóa đơn -->
                                    <div style="width: 400px;">
                                        <div class="form-box" style="padding: 24px; background: #fafafa; border-radius: 12px; border: 1px dashed #ccc; margin-bottom: 20px;">
                                            <h4 style="margin-top: 0; color: #333; margin-bottom: 15px;"><i class="bi bi-motorcycle"></i> XE ĐÃ CHỌN</h4>
                                            <div id="savedBikeContainer" style="margin-bottom: 20px;"></div>
                                            
                                            <h4 style="color: #333; margin-bottom: 15px; border-top: 1px dashed #ddd; padding-top: 15px;"><i class="bi bi-box-seam"></i> PHỤ KIỆN</h4>
                                            <div id="savedItemsContainer" style="margin-bottom: 20px;"></div>
                                            
                                            <div style="border-top: 2px solid #eee; padding-top: 15px; margin-top: 15px;">
                                                <div style="display: flex; justify-content: space-between; margin-bottom: 10px; font-weight: 600; color: #555;">
                                                    <span>Tạm tính:</span>
                                                    <span id="dataTotal">... đ</span>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- Voucher Area -->
                                        <div class="form-box" style="padding: 20px; background: #fff; border-radius: 12px; border: 1px solid #eaeaea;">
                                            <h4 style="margin-top: 0; margin-bottom: 15px; font-size: 14px;"><i class="fas fa-ticket-alt"></i> MÃ GIẢM GIÁ</h4>
                                            <div style="display: flex; gap: 10px;">
                                                <input type="text" id="voucher-code-input" placeholder="Nhập mã..." style="flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 6px; text-transform: uppercase;">
                                                <button type="button" id="apply-voucher-btn" onclick="applyVoucher()" style="background: linear-gradient(135deg, #02b8af, #046fd4); color: white; border: none; padding: 0 15px; border-radius: 6px; font-weight: 600; cursor: pointer; transition: 0.2s;">Áp dụng</button>
                                            </div>
                                            <p id="voucher-msg" style="margin: 8px 0 0 0; font-size: 12px; color: #6b7280; min-height: 18px;"></p>
                                            <input type="hidden" id="applied-voucher-id" name="voucherId" value="0">
                                            <input type="hidden" id="applied-discount" value="0">
                                        </div>
                                        
                                        <!-- Final Total Box -->
                                        <div id="form-box-total" class="form-box" style="padding: 20px; background: #b59349; color: white; border-radius: 12px; margin-top: 20px; text-align: right;">
                                            <h4 style="margin: 0; font-size: 14px; opacity: 0.9; text-transform: uppercase; letter-spacing: 1px;">TỔNG THANH TOÁN</h4>
                                            <h2 id="dataInput" style="margin: 10px 0 0 0; font-size: 28px; font-weight: 800;">... đ</h2>
                                            <div style="margin-top: 8px; font-size: 12px; opacity: 0.8;">Đã bao gồm thuế và phí bảo hiểm</div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>"""

content = re.sub(r'<div class="fieldset-content">\s*<div class="scrollable-vertical">\s*<h4>NGÀY & GIỜ</h4>.*?<div class="form-box" id="form-box-total"[^>]*>.*?</div>\s*</div>\s*</div>', step5_new, content, flags=re.DOTALL)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)