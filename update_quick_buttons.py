import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# Replace the buttons HTML to add IDs and remove inline hover JS (we'll handle it properly)
old_buttons = """                                        <div style="margin-top: 8px; display: flex; flex-wrap: wrap; align-items: center; gap: 8px;">
                                            <button type="button" style="background: #fff; color: #b59349; border: 1px solid #b59349; padding: 4px 12px; font-size: 12px; font-weight: 600; border-radius: 20px; cursor: pointer; transition: 0.3s;" onclick="setQuickReturnDate(7)" onmouseover="this.style.background='#b59349'; this.style.color='#fff';" onmouseout="this.style.background='#fff'; this.style.color='#b59349';">
                                                Thuê 1 Tuần (Giá ưu đãi theo Tuần)
                                            </button>
                                            <button type="button" style="background: #fff; color: #b59349; border: 1px solid #b59349; padding: 4px 12px; font-size: 12px; font-weight: 600; border-radius: 20px; cursor: pointer; transition: 0.3s;" onclick="setQuickReturnDate(30)" onmouseover="this.style.background='#b59349'; this.style.color='#fff';" onmouseout="this.style.background='#fff'; this.style.color='#b59349';">
                                                Thuê 1 Tháng (Giá ưu đãi theo Tháng)
                                            </button>
                                            <span style="font-size: 11px; color: #28a745; font-style: italic; margin-top: 2px;">
                                                <i class="icon-check"></i> (Giá sẽ được giảm tự động ở bước Chọn Xe)
                                            </span>
                                        </div>"""

new_buttons = """                                        <div style="margin-top: 8px; display: flex; flex-wrap: wrap; align-items: center; gap: 8px;">
                                            <button type="button" id="btn-quick-week" style="background: #fff; color: #b59349; border: 1px solid #b59349; padding: 4px 12px; font-size: 12px; font-weight: 600; border-radius: 20px; cursor: pointer; transition: 0.3s;" onclick="setQuickReturnDate(7)">
                                                Thuê 1 Tuần (Giá ưu đãi theo Tuần)
                                            </button>
                                            <button type="button" id="btn-quick-month" style="background: #fff; color: #b59349; border: 1px solid #b59349; padding: 4px 12px; font-size: 12px; font-weight: 600; border-radius: 20px; cursor: pointer; transition: 0.3s;" onclick="setQuickReturnDate(30)">
                                                Thuê 1 Tháng (Giá ưu đãi theo Tháng)
                                            </button>
                                            <span style="font-size: 11px; color: #28a745; font-style: italic; margin-top: 2px;">
                                                <i class="icon-check"></i> (Giá sẽ được giảm tự động ở bước Chọn Xe)
                                            </span>
                                        </div>"""

content = content.replace(old_buttons, new_buttons)

# Update the setQuickReturnDate function and add new logic
old_script = """        <script>
        function setQuickReturnDate(days) {
            const pickupInput = document.getElementById('pickupdate');
            const returnInput = document.getElementById('returndate');
            if (!pickupInput.value) {
                alert('Vui lòng chọn Ngày nhận xe trước!');
                return;
            }
            const date = new Date(pickupInput.value);
            date.setDate(date.getDate() + days);
            
            const yyyy = date.getFullYear();
            const mm = String(date.getMonth() + 1).padStart(2, '0');
            const dd = String(date.getDate()).padStart(2, '0');
            returnInput.value = yyyy + '-' + mm + '-' + dd;
            
            // Dispatch change event to trigger differenceInDays calculation
            returnInput.dispatchEvent(new Event('change'));
        }
        </script>"""

new_script = """        <script>
        window.activePackage = null;
        
        function setQuickReturnDate(days, autoEvent = false) {
            const pickupInput = document.getElementById('pickupdate');
            const returnInput = document.getElementById('returndate');
            if (!pickupInput.value) {
                alert('Vui lòng chọn Ngày nhận xe trước!');
                return;
            }
            
            if (!autoEvent) {
                window.activePackage = days === 7 ? 'week' : (days === 30 ? 'month' : null);
            }
            
            const date = new Date(pickupInput.value);
            date.setDate(date.getDate() + days);
            
            const yyyy = date.getFullYear();
            const mm = String(date.getMonth() + 1).padStart(2, '0');
            const dd = String(date.getDate()).padStart(2, '0');
            returnInput.value = yyyy + '-' + mm + '-' + dd;
            
            updateQuickButtonsStyle(days);
            
            // Dispatch change event to trigger differenceInDays calculation
            if (!autoEvent) {
                returnInput.dispatchEvent(new Event('change'));
            }
        }
        
        function updateQuickButtonsStyle(days) {
            const btnWeek = document.getElementById('btn-quick-week');
            const btnMonth = document.getElementById('btn-quick-month');
            
            if (btnWeek) {
                if (days === 7) {
                    btnWeek.style.background = '#b59349';
                    btnWeek.style.color = '#fff';
                    btnWeek.style.fontWeight = '800';
                } else {
                    btnWeek.style.background = '#fff';
                    btnWeek.style.color = '#b59349';
                    btnWeek.style.fontWeight = '600';
                }
            }
            
            if (btnMonth) {
                if (days === 30) {
                    btnMonth.style.background = '#b59349';
                    btnMonth.style.color = '#fff';
                    btnMonth.style.fontWeight = '800';
                } else {
                    btnMonth.style.background = '#fff';
                    btnMonth.style.color = '#b59349';
                    btnMonth.style.fontWeight = '600';
                }
            }
        }
        
        document.addEventListener('DOMContentLoaded', function() {
            const pickupInput = document.getElementById('pickupdate');
            const returnInput = document.getElementById('returndate');
            
            pickupInput.addEventListener('change', function() {
                if (window.activePackage === 'week') {
                    setQuickReturnDate(7, true);
                    returnInput.dispatchEvent(new Event('change'));
                } else if (window.activePackage === 'month') {
                    setQuickReturnDate(30, true);
                    returnInput.dispatchEvent(new Event('change'));
                }
            });
            
            returnInput.addEventListener('change', function() {
                if (pickupInput.value && returnInput.value) {
                    const start = new Date(pickupInput.value);
                    const end = new Date(returnInput.value);
                    const diffTime = Math.abs(end - start);
                    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                    
                    if (diffDays === 7) {
                        window.activePackage = 'week';
                        updateQuickButtonsStyle(7);
                    } else if (diffDays === 30) {
                        window.activePackage = 'month';
                        updateQuickButtonsStyle(30);
                    } else {
                        window.activePackage = null;
                        updateQuickButtonsStyle(0); // clear both
                    }
                }
            });
        });
        </script>"""

content = content.replace(old_script, new_script)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)