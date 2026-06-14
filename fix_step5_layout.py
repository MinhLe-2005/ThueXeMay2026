import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Fix the Javascript IDs so it doesn't crash and maps correctly
old_js = """                            if (storedFormData) {
                                document.getElementById('pickupdatetext').textContent = storedFormData.pickupdate;
                                document.getElementById('pickuploctext').textContent = storedFormData.pickuplocation;
                                document.getElementById('pickuptimetext').textContent = storedFormData.pickuptime;
                                document.getElementById('returnloctext').textContent = storedFormData.returnlocation;
                                document.getElementById('returndatetext').textContent = storedFormData.returndate;
                                document.getElementById('returntimetext').textContent = storedFormData.returntime;
                            }
                            
                            formData = {
                                first_name: document.getElementById('first_name').value,
                                last_name: document.getElementById('last_name').value,
                                email: document.getElementById('email').value,
                                phonenumber: document.getElementById('phonenumber').value,
                                address: document.getElementById('address').value,                           
                                dob: document.getElementById('dob').value,                          
                                gender: document.querySelector('input[name="gender"]:checked') ? document.querySelector('input[name="gender"]:checked').value : '',
                                identityCard : document.getElementById("identityCard").value,
                                issuedon : document.getElementById("issuedon").value,
                                expdate : document.getElementById("expdate").value                              
                            };

                            if (formData) {
                                document.getElementById('firstnametext').textContent = formData.first_name;
                                document.getElementById('lastnametext').textContent = formData.last_name;
                                document.getElementById('emailaddresstext').textContent = formData.email;
                                document.getElementById('phonetext').textContent = formData.phonenumber;
                                document.getElementById('addresstext').textContent = formData.address;
                                document.getElementById('birthdaytext').textContent = formData.dob;    
                                document.getElementById('gendertext').textContent = formData.gender;
                                document.getElementById('identityCardtext').textContent = formData.identityCard;
                                document.getElementById('issuedontext').textContent = formData.issuedon;   
                                document.getElementById('expdatetext').textContent = formData.expdate;   
                            }"""

new_js = """                            if (storedFormData) {
                                if(document.getElementById('pickupdatetext')) document.getElementById('pickupdatetext').textContent = storedFormData.pickupdate;
                                if(document.getElementById('pickuploctext')) document.getElementById('pickuploctext').textContent = storedFormData.pickuplocation;
                                if(document.getElementById('pickuptimetext')) document.getElementById('pickuptimetext').textContent = storedFormData.pickuptime;
                                if(document.getElementById('returnloctext')) document.getElementById('returnloctext').textContent = storedFormData.returnlocation;
                                if(document.getElementById('returndatetext')) document.getElementById('returndatetext').textContent = storedFormData.returndate;
                                if(document.getElementById('returntimetext')) document.getElementById('returntimetext').textContent = storedFormData.returntime;
                            }
                            
                            formData = {
                                first_name: document.getElementById('first_name') ? document.getElementById('first_name').value : '',
                                last_name: document.getElementById('last_name') ? document.getElementById('last_name').value : '',
                                email: document.getElementById('email') ? document.getElementById('email').value : '',
                                phonenumber: document.getElementById('phonenumber') ? document.getElementById('phonenumber').value : '',
                                address: document.getElementById('address') ? document.getElementById('address').value : '',                           
                                identityCard : document.getElementById("identityCard") ? document.getElementById("identityCard").value : ''
                            };

                            if (formData) {
                                if(document.getElementById('fullnametext')) document.getElementById('fullnametext').textContent = formData.first_name + ' ' + formData.last_name;
                                if(document.getElementById('emailtext')) document.getElementById('emailtext').textContent = formData.email;
                                if(document.getElementById('phonetext')) document.getElementById('phonetext').textContent = formData.phonenumber;
                                if(document.getElementById('addresstext')) document.getElementById('addresstext').textContent = formData.address;
                                if(document.getElementById('identitytext')) document.getElementById('identitytext').textContent = formData.identityCard;
                            }"""

content = content.replace(old_js, new_js)

# 2. Fix the layout of Step 5 (column instead of row)
old_html = """                            <div class="fieldset-content">
                                <div class="scrollable-vertical" style="display: flex; gap: 30px; flex-wrap: wrap;">
                                    
                                    <!-- Cột trái: Thông tin -->
                                    <div style="flex: 1; min-width: 300px;">"""

new_html = """                            <div class="fieldset-content">
                                <div class="scrollable-vertical" style="display: flex; flex-direction: column; gap: 30px;">
                                    
                                    <!-- Cột trên: Thông tin -->
                                    <div style="width: 100%;">"""

content = content.replace(old_html, new_html)

old_html2 = """                                    <!-- Cột phải: Hóa đơn -->
                                    <div style="width: 400px;">"""

new_html2 = """                                    <!-- Cột dưới: Hóa đơn -->
                                    <div style="width: 100%;">"""
                                    
content = content.replace(old_html2, new_html2)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)

