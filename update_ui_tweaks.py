import os

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Remove the pushpin icon from the banner
old_banner = """                                    <div id="sticky-banner" style="display: none; padding: 12px 20px; background: #fffcf0; border: 1px solid #f0e6d2; border-left: 4px solid #b59349; margin-bottom: 20px; border-radius: 4px; position: sticky; top: 0; z-index: 10;">
                                        <p style="margin: 0; font-size: 14px; color: #666;"><span style="color: #d97706;">📌 Đang chọn:</span> <span id="selected-bikes-list" style="font-weight: 600; color: #333;"></span></p>
                                    </div>"""

new_banner = """                                    <div id="sticky-banner" style="display: none; padding: 12px 20px; background: #fffcf0; border: 1px solid #f0e6d2; border-left: 4px solid #b59349; margin-bottom: 20px; border-radius: 4px; position: sticky; top: 0; z-index: 10;">
                                        <p style="margin: 0; font-size: 14px; color: #666;"><span style="color: #d97706; font-weight: bold;">Đang chọn:</span> <span id="selected-bikes-list" style="font-weight: 600; color: #333;"></span></p>
                                    </div>"""

content = content.replace(old_banner, new_banner)

# 2. Add a dynamic label indicating the active package
# First, add a placeholder in each form-check
old_form_check = """<p class="price-note">Không bao gồm thuế và bảo hiểm</p>"""
new_form_check = """<p class="price-note">Không bao gồm thuế và bảo hiểm</p>
                                                    <p class="active-package-label" style="text-align: right; font-size: 13px; font-weight: bold; color: #b59349; margin-top: 5px;"></p>"""

content = content.replace(old_form_check, new_form_check)

# 3. Update changePrice() to update the text of .active-package-label
old_js_day = """                              if(quantityDay >= 1 && quantityDay < 7){
                                  
                                  priceDayElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                              }"""
new_js_day = """                              const packageLabels = document.querySelectorAll('.active-package-label');

                              if(quantityDay >= 1 && quantityDay < 7){
                                  priceDayElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                                  packageLabels.forEach(el => el.textContent = "Áp dụng: Gói Theo Ngày");
                              }"""
content = content.replace(old_js_day, new_js_day)

old_js_week = """                              if(quantityDay >= 7 && quantityDay < 30){
                                   priceWeekElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                              }"""
new_js_week = """                              if(quantityDay >= 7 && quantityDay < 30){
                                   priceWeekElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                                  packageLabels.forEach(el => el.textContent = "Áp dụng: Gói Theo Tuần");
                              }"""
content = content.replace(old_js_week, new_js_week)

old_js_month = """                              if(quantityDay >= 30){
                                   priceMonthElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                              }"""
new_js_month = """                              if(quantityDay >= 30){
                                   priceMonthElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                                  packageLabels.forEach(el => el.textContent = "Áp dụng: Gói Theo Tháng");
                              }"""
content = content.replace(old_js_month, new_js_month)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated banner icon and package label")
