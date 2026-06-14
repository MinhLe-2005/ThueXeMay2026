import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# Add logic into changePrice()
banner_js = """                            let activeBadgeText = "";
                            if(quantityDay >= 30) {
                                activeBadgeText = " (Gói Tháng)";
                            } else if(quantityDay >= 7) {
                                activeBadgeText = " (Gói Tuần)";
                            }
                            
                            // Array to hold selected bikes for banner
                            const selectedBikesText = [];
"""

content = content.replace('const bikeDetails = [];', banner_js + '\n                            const bikeDetails = [];')

# Inside the loop:
push_logic = """                        const priceLabel = selectBox.closest('.form-box').querySelector('.price-current');
                        if (priceLabel) {
                            const dataPrice = priceLabel.getAttribute('data-price');
                            const price = dataPrice ? parseInt(dataPrice) : 0;
                            const totalPrice = quantityDay * price;
                            for (let i = 0; i < quantity; i++) {
                                bikeDetails.push({ name: bikeName, price: totalPrice.toString() });
                            }
                            
                            // Add to banner text
                            if (quantity > 0) {
                                selectedBikesText.push(quantity + "x " + bikeName + activeBadgeText);
                            }
                        }"""

content = content.replace("""                        const priceLabel = selectBox.closest('.form-box').querySelector('.price-current');
                        if (priceLabel) {
                            const dataPrice = priceLabel.getAttribute('data-price');
                            const price = dataPrice ? parseInt(dataPrice) : 0;
                            const totalPrice = quantityDay * price;
                            for (let i = 0; i < quantity; i++) {
                                bikeDetails.push({ name: bikeName, price: totalPrice.toString() });
                            }
                        }""", push_logic)

# At the end of changePrice:
update_banner_logic = """
            // Update the banner
            const banner = document.getElementById('selected-bikes-banner');
            const listSpan = document.getElementById('selected-bikes-list');
            if (selectedBikesText.length > 0) {
                listSpan.textContent = selectedBikesText.join(", ");
                banner.style.display = 'block';
            } else {
                banner.style.display = 'none';
            }
            
            const accessoriesData = collectAccessoryData();"""

content = content.replace('const accessoriesData = collectAccessoryData();', update_banner_logic)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)