import os
filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

old_calc_1 = """                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4').textContent;
                                const priceLabelEl = formBox.querySelector('.price-current') || formBox.querySelector('.main-price');
                                const priceLabel = priceLabelEl ? priceLabelEl.textContent : '0';
                                const quantity = parseInt(selects.value, 10);
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    const digits = priceLabel.replace(/\D/g, '');
                                    price = digits ? parseInt(digits, 10) : 0;
                                }"""

new_calc_1 = """                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4').textContent;
                                const priceLabelEl = formBox.querySelector('.price-current') || formBox.querySelector('.main-price');
                                const quantity = parseInt(selects.value, 10);
                                let price = 0;
                                if (priceLabelEl && priceLabelEl.dataset.price) {
                                    price = parseFloat(priceLabelEl.dataset.price);
                                }"""

old_calc_2 = """                          const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                          const bikePrice = formMotorBox.querySelector('.price-current').textContent;
                          const price = parseInt(bikePrice.replace('₫', '').replace('.000/Day', '').trim());"""

new_calc_2 = """                          const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                          const priceLabelEl = formMotorBox.querySelector('.price-current') || formMotorBox.querySelector('.main-price');
                          let price = 0;
                          if (priceLabelEl && priceLabelEl.dataset.price) {
                              price = parseFloat(priceLabelEl.dataset.price);
                          }"""

content = content.replace(old_calc_1, new_calc_1)
content = content.replace(old_calc_2, new_calc_2)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated JS calculations in booking.jsp")
