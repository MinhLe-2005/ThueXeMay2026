import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

old_html = """                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </fieldset>"""

new_html = """                                        </div>
                                        
                                        <!-- Terms and Conditions -->
                                        <div class="form-check" style="margin-top: 20px;">
                                            <div class="checkbox-container" style="display: flex; align-items: center; gap: 8px;">
                                                <input type="checkbox" id="daily-checkbox-term" onchange="toggleNextButton()" style="width: 18px; height: 18px; cursor: pointer; accent-color: #b59349;">
                                                <label for="daily-checkbox-term" style="font-size: 14px; margin: 0; cursor: pointer; color: #555;">Tôi đồng ý với <a href="policies.jsp" target="_blank" style="color: #b59349; text-decoration: underline; font-weight: 600;">điều khoản dịch vụ</a></label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </fieldset>"""

if "id=\"daily-checkbox-term\"" not in content:
    content = content.replace(old_html, new_html)

    with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
        f.write(content)
    print("Added terms and conditions checkbox.")
else:
    print("Checkbox already exists!")
