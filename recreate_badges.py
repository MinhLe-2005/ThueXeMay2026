import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

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

                            if(quantityDay >= 30){
                                priceMonthElements.forEach(element => {
                                   element.style.display = "block";
                                   element.classList.add("price-current");
                                });
                                activeBadge = '<span style="display: inline-block; padding: 4px 10px; background: rgba(16, 185, 129, 0.08); border: 1px solid rgba(16, 185, 129, 0.3); color: #059669; border-radius: 4px; font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; margin-top: 6px;">Đặc quyền Gói Tháng</span>';
                            } else if(quantityDay >= 7){
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

content = re.sub(r'priceDayElements\.forEach\(element => \{.*?\} else if \(quantityDay > 30\)\{.*?\}', badge_logic, content, flags=re.DOTALL)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)