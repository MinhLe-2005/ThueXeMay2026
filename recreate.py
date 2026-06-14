import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Fix Accessory Price
content = content.replace('name="accessories" value="0">', 'name="accessories" value="${a.price}">')

# 2. Remove 1-hour advance rule
content = re.sub(r'var minTime = new Date\(\);\s*minTime\.setHours\(minTime\.getHours\(\) \+ 1\);\s*minTime\.setMinutes\(minTime\.getMinutes\(\) - 5\); // 5 min grace period', r'var minTime = new Date();', content)
content = content.replace('"Vui lòng đặt xe trước 1 tiếng"', '"Giờ nhận xe không được ở trong quá khứ"')

# 3. Remove (Tuần) and (Tháng) texts from prices in booking.jsp
content = content.replace('(Tuần)', '').replace('(Tháng)', '')

# 4. We will leave Step 5 as it is but fix any NaN issues.
# Wait, the user actually wants the elegant badges! 
# Let us inject elegant badges when the user selects Tuần or Tháng.
# We will do this via javascript in changePrice().
badge_logic = """
                              priceDayElements.forEach(element => {
                                     element.style.display = "none";
                                     element.classList.remove("price-current");
                              });
                              priceWeekElements.forEach(element => {
                                     element.style.display = "none";
                                     element.classList.remove("price-current");
                              });
                              priceMonthElements.forEach(element => {
                                     element.style.display = "none";
                                     element.classList.remove("price-current");
                              });
                              
                              let activeBadge = "";

                              if(differenceInDays >= 30){
                                  priceMonthElements.forEach(element => {
                                     element.style.display = "block";
                                     element.classList.add("price-current");
                                  });
                                  activeBadge = '<span style="display: inline-block; padding: 4px 10px; background: rgba(16, 185, 129, 0.08); border: 1px solid rgba(16, 185, 129, 0.3); color: #059669; border-radius: 4px; font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-top: 6px;">Đặc quyền Gói Tháng</span>';
                              } else if(differenceInDays >= 7){
                                  priceWeekElements.forEach(element => {
                                     element.style.display = "block";
                                     element.classList.add("price-current");
                                  });
                                  activeBadge = '<span style="display: inline-block; padding: 4px 10px; background: rgba(181, 147, 73, 0.08); border: 1px solid rgba(181, 147, 73, 0.3); color: #b59349; border-radius: 4px; font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-top: 6px;">Ưu đãi Gói Tuần</span>';
                              } else {
                                  priceDayElements.forEach(element => {
                                     element.style.display = "block";
                                     element.classList.add("price-current");
                                  });
                              }
                              
                              // Update badge in UI
                              document.querySelectorAll('.active-package-label').forEach(el => el.innerHTML = activeBadge);
"""
content = re.sub(r'priceDayElements\.forEach\(element => \{.*?\} else \{.*?priceDayElements\.forEach.*?\}', badge_logic, content, flags=re.DOTALL)

# Add .active-package-label below the price container
content = content.replace('<div class="price-month" style="display: none; color: #b59349; font-weight: bold;">', '<div class="active-package-label" style="text-align: right;"></div>\n                                                    <div class="price-month" style="display: none; color: #b59349; font-weight: bold;">')

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)