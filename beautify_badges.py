import os

filepath = "src/main/webapp/booking.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

# I will replace the text content logic in changePrice() with innerHTML for beautiful badges.
# We have these sections in JS:
old_js_day = """                              if(quantityDay >= 1 && quantityDay < 7){
                                  priceDayElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                                  packageLabels.forEach(el => el.textContent = "Áp dụng: Gói Theo Ngày");
                              }"""

new_js_day = """                              if(quantityDay >= 1 && quantityDay < 7){
                                  priceDayElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                                  packageLabels.forEach(el => {
                                      el.innerHTML = "";
                                  });
                              }"""
content = content.replace(old_js_day, new_js_day)

old_js_week = """                              if(quantityDay >= 7 && quantityDay < 30){
                                   priceWeekElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                                  packageLabels.forEach(el => el.textContent = "Áp dụng: Gói Theo Tuần");
                              }"""

new_js_week = """                              if(quantityDay >= 7 && quantityDay < 30){
                                   priceWeekElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                                  packageLabels.forEach(el => {
                                      el.innerHTML = '<div style="display: inline-flex; align-items: center; background: linear-gradient(135deg, #b59349 0%, #8c6f32 100%); color: white; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; box-shadow: 0 2px 8px rgba(181, 147, 73, 0.3); margin-top: 6px;"><i class="fas fa-gift" style="margin-right: 6px;"></i> Ưu đãi Gói Tuần</div>';
                                  });
                              }"""
content = content.replace(old_js_week, new_js_week)


old_js_month = """                              if(quantityDay >= 30){
                                   priceMonthElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                                  packageLabels.forEach(el => el.textContent = "Áp dụng: Gói Theo Tháng");
                              }"""

new_js_month = """                              if(quantityDay >= 30){
                                   priceMonthElements.forEach(element => {
                                     element.style.display = "inline-block";
                                     element.classList.add("price-current");
                                  });
                                  packageLabels.forEach(el => {
                                      el.innerHTML = '<div style="display: inline-flex; align-items: center; background: linear-gradient(135deg, #10b981 0%, #059669 100%); color: white; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3); margin-top: 6px;"><i class="fas fa-crown" style="margin-right: 6px;"></i> Đặc quyền Gói Tháng</div>';
                                  });
                              }"""
content = content.replace(old_js_month, new_js_month)

# Update the container styling so it aligns nicely
old_container = """<p class="active-package-label" style="text-align: right; font-size: 13px; font-weight: bold; color: #b59349; margin-top: 5px;"></p>"""
new_container = """<div class="active-package-label" style="text-align: right;"></div>"""
content = content.replace(old_container, new_container)


with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated beautiful badges")
