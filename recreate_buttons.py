import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

buttons_html = """<input type="date" name="returndate" id="returndate"  />
                                        <div style="margin-top: 8px; display: flex; flex-wrap: wrap; align-items: center; gap: 8px;">
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

content = content.replace('<input type="date" name="returndate" id="returndate"  />', buttons_html)

script_js = """        <script>
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
        </script>
    </body>"""

content = content.replace('</body>', script_js)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)