import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Update JS logic to generate beautiful tags
old_js = """                const selectedBikesText = [];
                const selectBoxes = document.querySelectorAll('#motorcyclelist .form-check-select');
                selectBoxes.forEach(selectBox => {
                    const quantity = parseInt(selectBox.value);
                    if (quantity > 0) {
                        const formMotorBox = selectBox.closest('.form-box');
                        if (formMotorBox) {
                            const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                            selectedBikesText.push(quantity + "x " + bikeName + activeBadgeText);
                        }
                    }
                });

                const banner = document.getElementById('selected-bikes-banner');
                const listSpan = document.getElementById('selected-bikes-list');
                if (selectedBikesText.length > 0) {
                    listSpan.textContent = selectedBikesText.join(", ");
                    banner.style.display = 'block';
                } else {
                    banner.style.display = 'none';
                }"""

new_js = """                const selectedBikesText = [];
                const selectBoxes = document.querySelectorAll('#motorcyclelist .form-check-select');
                selectBoxes.forEach(selectBox => {
                    const quantity = parseInt(selectBox.value);
                    if (quantity > 0) {
                        const formMotorBox = selectBox.closest('.form-box');
                        if (formMotorBox) {
                            const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                            let packageBadge = activeBadgeText ? `<span style="background: rgba(181, 147, 73, 0.15); color: #b59349; padding: 2px 6px; border-radius: 4px; font-size: 11px; margin-left: 6px; font-weight: 700;">${activeBadgeText.replace(/[()]/g, '').trim()}</span>` : "";
                            let tagHtml = `<span style="display: inline-flex; align-items: center; background: #fff; border: 1px solid #e0e0e0; padding: 4px 10px; border-radius: 20px; box-shadow: 0 1px 3px rgba(0,0,0,0.05); margin-right: 8px; margin-bottom: 5px; font-size: 13px; transition: 0.2s;">
                                <span style="background: #1a1816; color: #b59349; width: 22px; height: 22px; border-radius: 50%; display: inline-flex; justify-content: center; align-items: center; font-size: 11px; font-weight: bold; margin-right: 8px;">${quantity}</span>
                                <span style="font-weight: 600; color: #333;">${bikeName}</span>
                                ${packageBadge}
                            </span>`;
                            selectedBikesText.push(tagHtml);
                        }
                    }
                });

                const banner = document.getElementById('selected-bikes-banner');
                const listSpan = document.getElementById('selected-bikes-list');
                if (selectedBikesText.length > 0) {
                    listSpan.innerHTML = selectedBikesText.join("");
                    banner.style.display = 'flex';
                } else {
                    banner.style.display = 'none';
                }"""
content = content.replace(old_js, new_js)

# 2. Update the banner styling to flex wrap and better padding
old_banner = """<div id="selected-bikes-banner" style="background: #fdf5e6; border-left: 4px solid #b59349; padding: 10px 15px; margin-bottom: 20px; font-weight: 600; color: #555; display: none; border-radius: 4px; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
                                    💡 <span style="color: #b59349;">Đang chọn:</span> <span id="selected-bikes-list" style="color: #333;"></span>
                                </div>"""

new_banner = """<div id="selected-bikes-banner" style="background: #fdf5e6; border-left: 4px solid #b59349; padding: 12px 15px; margin-bottom: 20px; font-weight: 600; color: #555; display: none; flex-direction: column; align-items: flex-start; gap: 8px; border-radius: 6px; box-shadow: 0 2px 4px rgba(0,0,0,0.05);">
                                    <div style="display: flex; align-items: center; gap: 6px; font-size: 15px;">
                                        <i class="fas fa-shopping-cart" style="color: #b59349;"></i>
                                        <span style="color: #b59349; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px;">Xe Đang Chọn</span>
                                    </div>
                                    <div id="selected-bikes-list" style="display: flex; flex-wrap: wrap; gap: 4px; width: 100%;"></div>
                                </div>"""
content = content.replace(old_banner, new_banner)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)
