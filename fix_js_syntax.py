import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

bad_js = """                    const priceLabel = selectElement.closest('.form-box').querySelector('.price-current');
                    if (priceLabel) {
                        const dataPrice = priceLabel.getAttribute('data-price');
                        const price = dataPrice ? parseInt(dataPrice) : 0;
                        const totalPrice = quantityDay * price;
                        for (let i = 0; i < quantity; i++) {
                            bikeDetails.push({ name: bikeName, price: totalPrice.toString() });
                        }
                    }"""

good_js = """                        const priceLabel = selectBox.closest('.form-box').querySelector('.price-current');
                        if (priceLabel) {
                            const dataPrice = priceLabel.getAttribute('data-price');
                            const price = dataPrice ? parseInt(dataPrice) : 0;
                            const totalPrice = quantityDay * price;
                            for (let i = 0; i < quantity; i++) {
                                bikeDetails.push({ name: bikeName, price: totalPrice.toString() });
                            }
                        }
                    }
                }"""

content = content.replace(bad_js, good_js)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)