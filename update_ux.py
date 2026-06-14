# -*- coding: utf-8 -*-
import re

with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Fix JSTL pre-selection
content = content.replace('${i == "1" ? \'selected\' : \'\'}', '${i == 1 ? \'selected\' : \'\'}')
content = content.replace('<c:if test="${o.motorcycleId eq chosenmotor}">', '<c:if test="${o.motorcycleId == chosenmotor}">')
content = content.replace('<c:if test="${o.motorcycleId ne chosenmotor}">', '<c:if test="${o.motorcycleId != chosenmotor}">')

# 2. Add the banner
banner_html = """
                                <div id="selected-bikes-banner" style="background: #fdf5e6; border-left: 4px solid #b59349; padding: 10px 15px; margin-bottom: 20px; font-weight: 600; color: #555; display: none; border-radius: 4px; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
                                    📌 <span style="color: #b59349;">Đang chọn:</span> <span id="selected-bikes-list" style="color: #333;"></span>
                                </div>
                                <div class="scrollable-vertical" id="motorcyclelist">
"""
content = content.replace('<div class="scrollable-vertical" id="motorcyclelist">', banner_html)

# 3. Add JS function
js_logic = """
            function updateSelectedBikesBanner() {
                const banner = document.getElementById('selected-bikes-banner');
                const listSpan = document.getElementById('selected-bikes-list');
                if(!banner || !listSpan) return;
                
                let selectedBikes = [];
                const motorBoxes = document.querySelectorAll('#motorcyclelist .form-box');
                motorBoxes.forEach(box => {
                    const select = box.querySelector('.form-check-select');
                    if (select && parseInt(select.value) > 0) {
                        const name = box.querySelector('.motor-name').textContent.trim();
                        const qty = parseInt(select.value);
                        if (qty > 1) {
                            selectedBikes.push(name + ' (x' + qty + ')');
                        } else {
                            selectedBikes.push(name);
                        }
                    }
                });
                
                if (selectedBikes.length > 0) {
                    listSpan.textContent = selectedBikes.join(', ');
                    banner.style.display = 'block';
                } else {
                    banner.style.display = 'none';
                }
            }
"""
content = content.replace('function toggleBikeNextButton() {', js_logic + '\n            function toggleBikeNextButton() {')

# Add call to updateSelectedBikesBanner inside toggleBikeNextButton so it triggers whenever quantity changes
content = content.replace('var anySelected = $(".form-check-select", "#motorcyclelist").toArray().some(function(select) {', 'updateSelectedBikesBanner();\n                  var anySelected = $(".form-check-select", "#motorcyclelist").toArray().some(function(select) {')

# Add call to DOMContentLoaded to run it initially
content = content.replace('// Add event listeners to validate form on image change', 'updateSelectedBikesBanner();\n                  // Add event listeners to validate form on image change')

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated booking.jsp successfully")
