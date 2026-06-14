import os
filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

old_js_1 = """                                // Create new div elements similar to formBoxTotal structure
                                const itemContainer = document.createElement('div');
                                itemContainer.classList.add('item-container');
                                itemContainer.style.display = 'flex';
                                itemContainer.style.justifyContent = 'space-between';
                                itemContainer.style.alignItems = 'center';
                                itemContainer.style.padding = '15px 0';
                                itemContainer.style.borderBottom = '1px dashed #eaeaea';

                                itemContainer.innerHTML = `
                                    <div style="flex: 2;">
                                        <h4 style="margin: 0; font-size: 16px; color: #333;">` + title + `</h4>
                                    </div>
                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantityDay + ` Ngày
                                    </div>
                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantity + ` Xe
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        ₫` + price.toLocaleString() + `/Ngày
                                    </div>
                                    <div style="flex: 1.5; text-align: right;">
                                        <h4 style="margin: 0; font-size: 18px; color: #b59349;">₫` + totalPrice.toLocaleString() + `</h4>
                                    </div>
                                `;"""

new_js_1 = """                                // Render motorcycle receipt item
                                const itemContainer = document.createElement('div');
                                itemContainer.style.display = 'flex';
                                itemContainer.style.justifyContent = 'space-between';
                                itemContainer.style.padding = '10px 0';
                                itemContainer.style.borderBottom = '1px dashed #e0e0e0';

                                itemContainer.innerHTML = `
                                    <div style="flex: 1;">
                                        <p style="margin: 0; font-size: 14px; font-weight: 600; color: #333;">` + title + `</p>
                                        <p style="margin: 4px 0 0; font-size: 12px; color: #888;">` + quantity + ` xe x ` + quantityDay + ` ngày</p>
                                    </div>
                                    <div style="text-align: right;">
                                        <p style="margin: 0; font-size: 14px; font-weight: 700; color: #333;">` + totalPrice.toLocaleString() + ` ₫</p>
                                        <p style="margin: 4px 0 0; font-size: 12px; color: #888;">` + price.toLocaleString() + ` ₫/ngày</p>
                                    </div>
                                `;"""

content = content.replace(old_js_1, new_js_1)

old_js_2 = """                                // Tạo các thẻ div mới
                                const itemContainer = document.createElement('div');
                                itemContainer.classList.add('item-container');
                                itemContainer.style.display = 'flex';
                                itemContainer.style.justifyContent = 'space-between';
                                itemContainer.style.alignItems = 'center';
                                itemContainer.style.padding = '15px 0';
                                itemContainer.style.borderBottom = '1px dashed #eaeaea';

                                itemContainer.innerHTML = `
                                    <div style="flex: 2;">
                                        <h4 style="margin: 0; font-size: 16px; color: #333;">` + title + `</h4>
                                    </div>
                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantity + ` Cái
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        ` + priceLabel + `
                                    </div>
                                    <div style="flex: 1.5; text-align: right;">
                                        <h4 style="margin: 0; font-size: 18px; color: #b59349;">₫` + totalPrice.toLocaleString() + `</h4>
                                    </div>
                                `;"""

new_js_2 = """                                // Render accessory receipt item
                                const itemContainer = document.createElement('div');
                                itemContainer.style.display = 'flex';
                                itemContainer.style.justifyContent = 'space-between';
                                itemContainer.style.padding = '10px 0';
                                itemContainer.style.borderBottom = '1px dashed #e0e0e0';

                                itemContainer.innerHTML = `
                                    <div style="flex: 1;">
                                        <p style="margin: 0; font-size: 14px; font-weight: 600; color: #333;">` + title + `</p>
                                        <p style="margin: 4px 0 0; font-size: 12px; color: #888;">` + quantity + ` cái</p>
                                    </div>
                                    <div style="text-align: right;">
                                        <p style="margin: 0; font-size: 14px; font-weight: 700; color: #333;">` + totalPrice.toLocaleString() + ` ₫</p>
                                        <p style="margin: 4px 0 0; font-size: 12px; color: #888;">` + price.toLocaleString() + ` ₫/cái</p>
                                    </div>
                                `;"""

content = content.replace(old_js_2, new_js_2)

old_js_3 = """                            // Apply voucher discount if any
                            const appliedDiscount = parseInt(document.getElementById('applied-discount').value) || 0;
                            const finalAmount = Math.max(0, totalAmount - appliedDiscount);

                            const itemTotalContainer = document.createElement('div');
                                itemTotalContainer.classList.add('item-container');
                                itemTotalContainer.style.display = 'flex';
                                itemTotalContainer.style.justifyContent = 'flex-end';
                                itemTotalContainer.style.alignItems = 'center';
                                itemTotalContainer.style.padding = '15px 0';
                                itemTotalContainer.style.marginTop = '20px';

                                itemTotalContainer.innerHTML = `
                                <div style="display:flex; justify-content:space-between; width: 100%; align-items: center;">
                                    <h4 style="margin: 0; font-size: 18px; color: #333;">Tổng thanh toán:</h4>
                                    <h2 id="dataInput" style="margin: 0; font-size: 26px; color: #b59349; font-weight: 700;">₫`+ finalAmount.toLocaleString() +`</h2>
                                </div>`;"""

new_js_3 = """                            // Apply voucher discount if any
                            const appliedDiscount = parseInt(document.getElementById('applied-discount').value) || 0;
                            const finalAmount = Math.max(0, totalAmount - appliedDiscount);

                            const itemTotalContainer = document.createElement('div');
                            itemTotalContainer.style.marginTop = '15px';
                            
                            let htmlContent = `
                                <div style="display:flex; justify-content:space-between; padding-bottom: 10px;">
                                    <span style="font-size: 15px; color: #555;">Tạm tính:</span>
                                    <span style="font-size: 15px; font-weight: 600; color: #333;">`+ totalAmount.toLocaleString() +` ₫</span>
                                </div>
                            `;
                            if (appliedDiscount > 0) {
                                htmlContent += `
                                <div style="display:flex; justify-content:space-between; padding-bottom: 10px; color: #16a34a;">
                                    <span style="font-size: 15px;">Giảm giá:</span>
                                    <span style="font-size: 15px; font-weight: 600;">-`+ appliedDiscount.toLocaleString() +` ₫</span>
                                </div>
                                `;
                            }
                            htmlContent += `
                                <div style="display:flex; justify-content:space-between; align-items: center; border-top: 2px dashed #ccc; padding-top: 15px; margin-top: 5px;">
                                    <span style="font-size: 16px; font-weight: 700; color: #333;">TỔNG CỘNG:</span>
                                    <span id="dataInput" style="font-size: 24px; font-weight: 800; color: #b59349;">`+ finalAmount.toLocaleString() +` ₫</span>
                                </div>
                            `;

                            itemTotalContainer.innerHTML = htmlContent;"""

content = content.replace(old_js_3, new_js_3)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated JS rendering for formBoxTotal")
