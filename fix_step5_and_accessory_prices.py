import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Format Accessory Price in JSP
old_acc_price_free = """                                                <c:if test="${a.price eq 0}">
                                                    <label for="daily-checkbox" class="items-free">Free</label>
                                                </c:if>
                                                <c:if test="${a.price ne 0}">
                                                    <label for="daily-checkbox">₫${a.price}00</label>
                                                </c:if>"""

new_acc_price_free = """                                                <c:if test="${a.price eq 0}">
                                                    <label for="daily-checkbox" class="items-free">Free</label>
                                                </c:if>
                                                <c:if test="${a.price ne 0}">
                                                    <label for="daily-checkbox"><fmt:formatNumber value="${a.price}" pattern="#,##0"/> ₫/Ngày</label>
                                                </c:if>"""
content = content.replace(old_acc_price_free, new_acc_price_free)

# 2. Fix Javascript accessory parsing
old_collect_accessory = """                const priceText = priceLabel ? priceLabel.textContent.replace('₫', '').replace('.000', '').trim() : '0';
                const price = priceText.includes('Free') ? 0 : parseInt(priceText, 10);"""

new_collect_accessory = """                const priceText = priceLabel ? priceLabel.textContent : '0';
                let price = 0;
                if (!priceText.includes('Free')) {
                    price = parseInt(priceText.replace(/\D/g, ''), 10);
                }"""
content = content.replace(old_collect_accessory, new_collect_accessory)

# 3. Fix Step 5 Bike calculation (prevent crash and use price-current)
old_bike_calc = """                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4').textContent;
                                const priceLabel = formBox.querySelector('.main-price').textContent;
                                const quantity = parseInt(selects.value, 10);
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    price = parseInt(priceLabel.replace(/\D/g, ''), 10);
                                }"""

new_bike_calc = """                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4') ? formBox.querySelector('h4').textContent : 'Xe';
                                const priceLabelElement = formBox.querySelector('.price-current') || formBox.querySelector('.main-price');
                                const priceLabel = priceLabelElement ? priceLabelElement.textContent : '0';
                                const quantity = parseInt(selects.value, 10) || 0;
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    price = parseInt(priceLabel.replace(/\D/g, ''), 10) || 0;
                                }"""
content = content.replace(old_bike_calc, new_bike_calc)

# 4. Fix Step 5 Accessory calculation (prevent crash and multiply by quantityDay)
old_acc_calc = """                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4').textContent;
                                const priceLabel = formBox.querySelector('label[for="daily-checkbox"]').textContent;
                                const quantity = parseInt(selects.value, 10);
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    price = parseInt(priceLabel.replace(/\D/g, ''), 10);
                                }

                                // Tính tổng giá
                                const totalPrice = quantity * price;"""

new_acc_calc = """                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4') ? formBox.querySelector('h4').textContent : 'Phụ kiện';
                                const priceLabelElement = formBox.querySelector('label[for="daily-checkbox"]');
                                const priceLabel = priceLabelElement ? priceLabelElement.textContent : '0';
                                const quantity = parseInt(selects.value, 10) || 0;
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    price = parseInt(priceLabel.replace(/\D/g, ''), 10) || 0;
                                }

                                // Tính tổng giá (nhân với số ngày)
                                const quantityDay = Math.max(1, Math.ceil(differenceInDays));
                                const totalPrice = quantityDay * price * quantity;"""
content = content.replace(old_acc_calc, new_acc_calc)

# Fix accessory HTML display in Step 5 (x quantityDay Ngày)
old_acc_html = """                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantity + ` Cái
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        ₫` + price.toLocaleString() + `/Ngày
                                    </div>"""

new_acc_html = """                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantityDay + ` Ngày (x` + quantity + ` Cái)
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        ₫` + price.toLocaleString() + `/Ngày
                                    </div>"""
content = content.replace(old_acc_html, new_acc_html)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)
