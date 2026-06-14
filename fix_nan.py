# -*- coding: utf-8 -*-
import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# Fix the value="" bug
content = content.replace(
    '<span style="text-decoration: line-through; color: #999; font-size: 16px;"><fmt:formatNumber value="" pattern="#,##0"/> ₫</span>',
    '<span style="text-decoration: line-through; color: #999; font-size: 16px;"><fmt:formatNumber value="${p.dailyPriceForDay}" pattern="#,##0"/> ₫</span>'
)

# Fix the NaN bug in TỔNG TIỀN Javascript
old_js = """                                const priceLabel = formBox.querySelector('.main-price').textContent;
                                const quantity = parseInt(selects.value, 10);
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    price = parseInt(priceLabel.replace(/\D/g, ''), 10);
                                }"""

new_js = """                                const priceLabelEl = formBox.querySelector('.price-current') || formBox.querySelector('.main-price');
                                const priceLabel = priceLabelEl ? priceLabelEl.textContent : '0';
                                const quantity = parseInt(selects.value, 10);
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    const digits = priceLabel.replace(/\D/g, '');
                                    price = digits ? parseInt(digits, 10) : 0;
                                }"""

content = content.replace(old_js, new_js)

# Save
with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)

print("Fixed bugs.")
