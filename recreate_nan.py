import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# Modify the bike price HTML to include data-price
content = re.sub(r'<div class="price-day" style="display: block; color: #b59349; font-weight: bold;">\s*<fmt:formatNumber value="\$\{p\.dailyPriceForDay\}" type="number" pattern="#,###"/> đ/Ngày\s*</div>',
                 r'<div class="price-day" style="display: block; color: #b59349; font-weight: bold;" data-price="${p.dailyPriceForDay}">\n                                                        <fmt:formatNumber value="${p.dailyPriceForDay}" type="number" pattern="#,###"/> đ/Ngày\n                                                    </div>', content)

content = re.sub(r'<div class="price-week" style="display: none; color: #b59349; font-weight: bold;">\s*<fmt:formatNumber value="\$\{p\.dailyPriceForWeek\}" type="number" pattern="#,###"/> đ/Ngày\s*</div>',
                 r'<div class="price-week" style="display: none; color: #b59349; font-weight: bold;" data-price="${p.dailyPriceForWeek}">\n                                                        <fmt:formatNumber value="${p.dailyPriceForWeek}" type="number" pattern="#,###"/> đ/Ngày\n                                                    </div>', content)

content = re.sub(r'<div class="price-month" style="display: none; color: #b59349; font-weight: bold;">\s*<fmt:formatNumber value="\$\{p\.dailyPriceForMonth\}" type="number" pattern="#,###"/> đ/Ngày\s*</div>',
                 r'<div class="price-month" style="display: none; color: #b59349; font-weight: bold;" data-price="${p.dailyPriceForMonth}">\n                                                        <fmt:formatNumber value="${p.dailyPriceForMonth}" type="number" pattern="#,###"/> đ/Ngày\n                                                    </div>', content)

# Update Javascript calculation to use data-price
js_fix = """
                    const priceLabel = selectElement.closest('.form-box').querySelector('.price-current');
                    if (priceLabel) {
                        const dataPrice = priceLabel.getAttribute('data-price');
                        const price = dataPrice ? parseInt(dataPrice) : 0;
                        const totalPrice = quantityDay * price;
                        for (let i = 0; i < quantity; i++) {
                            bikeDetails.push({ name: bikeName, price: totalPrice.toString() });
                        }
                    }
"""

content = re.sub(r'const price = parseInt\(bikePrice.*?\}\s*\}\s*\}\s*\n', js_fix, content, flags=re.DOTALL)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)