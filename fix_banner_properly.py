import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# Remove garbage from Step 5
bad_init = """                            let activeBadgeText = "";
                            if(quantityDay >= 30) {
                                activeBadgeText = " (GA3i ThAng)";
                            } else if(quantityDay >= 7) {
                                activeBadgeText = " (GA3i Tu n)";
                            }
                            
                            // Array to hold selected bikes for banner
                            const selectedBikesText = [];

                            const bikeDetails = [];"""

# If the unicode failed in my previous python script, maybe the strings are slightly different?
# I'll just use regex to remove it safely.
content = re.sub(r'let activeBadgeText = "";\s+if\(quantityDay >= 30\) \{.*?const selectedBikesText = \[\];\s+const bikeDetails = \[\];', 'const bikeDetails = [];', content, flags=re.DOTALL)

content = re.sub(r'\s*// Add to banner text\s*if \(quantity > 0\) \{\s*selectedBikesText\.push.*?\}\s*', '\n', content, flags=re.DOTALL)

content = re.sub(r'\s*// Update the banner\s*const banner = document\.getElementById\(\'selected-bikes-banner\'\);.*?banner\.style\.display = \'none\';\s*\}\s*const accessoriesData = collectAccessoryData\(\);', '\n            const accessoriesData = collectAccessoryData();', content, flags=re.DOTALL)

# Now, inject the `updateSelectedBikesBanner()` function right after `toggleBikeNextButton`
banner_js_function = """

            function updateSelectedBikesBanner() {
                const pickupInput = document.getElementById('pickupdate').value;
                const returnInput = document.getElementById('returndate').value;
                let activeBadgeText = "";
                if (pickupInput && returnInput) {
                    const start = new Date(pickupInput);
                    const end = new Date(returnInput);
                    const differenceInDays = Math.abs(end - start) / (1000 * 3600 * 24);
                    var quantityDay = Math.max(1, Math.ceil(differenceInDays));
                    if(quantityDay >= 30) {
                        activeBadgeText = " (Gói Tháng)";
                    } else if(quantityDay >= 7) {
                        activeBadgeText = " (Gói Tuần)";
                    }
                }
                
                const selectedBikesText = [];
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
                }
            }"""

content = content.replace('function toggleBikeNextButton() {', banner_js_function + '\n\n            function toggleBikeNextButton() {')

# Hook it into the change event
content = content.replace('toggleBikeNextButton();\n              });', 'toggleBikeNextButton();\n                 updateSelectedBikesBanner();\n              });')

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)