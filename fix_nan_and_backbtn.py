import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

# 1. Fix NaN money by calculating differenceInDays inside currentIndex === 4
old_js_step5 = """                            if (formData) {
                                if(document.getElementById('fullnametext')) document.getElementById('fullnametext').textContent = formData.first_name + ' ' + formData.last_name;
                                if(document.getElementById('emailtext')) document.getElementById('emailtext').textContent = formData.email;
                                if(document.getElementById('phonetext')) document.getElementById('phonetext').textContent = formData.phonenumber;
                                if(document.getElementById('addresstext')) document.getElementById('addresstext').textContent = formData.address;
                                if(document.getElementById('identitytext')) document.getElementById('identitytext').textContent = formData.identityCard;
                            }
                            
                           
                            
                            // Thêm tiêu đề h4 và dữ liệu số lượng với giá tiền vào div có thể trong item-container
                            const formBoxTotal = document.getElementById('form-box-total');"""

new_js_step5 = """                            if (formData) {
                                if(document.getElementById('fullnametext')) document.getElementById('fullnametext').textContent = formData.first_name + ' ' + formData.last_name;
                                if(document.getElementById('emailtext')) document.getElementById('emailtext').textContent = formData.email;
                                if(document.getElementById('phonetext')) document.getElementById('phonetext').textContent = formData.phonenumber;
                                if(document.getElementById('addresstext')) document.getElementById('addresstext').textContent = formData.address;
                                if(document.getElementById('identitytext')) document.getElementById('identitytext').textContent = formData.identityCard;
                            }
                            
                            // Re-calculate differenceInDays because it might be out of scope
                            let differenceInDays = 1;
                            try {
                                const pickupD = new Date(formData.pickupdate + 'T' + formData.pickuptime);
                                const returnD = new Date(formData.returndate + 'T' + formData.returntime);
                                differenceInDays = (returnD.getTime() - pickupD.getTime()) / (1000 * 3600 * 24);
                                if (isNaN(differenceInDays) || differenceInDays < 0) differenceInDays = 1;
                            } catch(e) {
                                console.error(e);
                            }
                            
                            // Thêm tiêu đề h4 và dữ liệu số lượng với giá tiền vào div có thể trong item-container
                            const formBoxTotal = document.getElementById('form-box-total');"""
content = content.replace(old_js_step5, new_js_step5)

# 2. Add popstate listener to map Browser Back Button to Wizard Previous Step
old_js_init = """                form.children("div").steps({
                    headerTag: "h3",
                    bodyTag: "fieldset",
                    transitionEffect: "fade",
                    stepsOrientation: "vertical",
                    titleTemplate: '<div class="title"><span class="step-number">#index#</span><span class="step-text">#title#</span></div>',"""

new_js_init = """                // Prevent accidental exit on browser back button
                history.pushState(null, null, location.href);
                window.addEventListener('popstate', function(event) {
                    var currentStep = $("#signup-form").steps("getCurrentIndex");
                    if (currentStep > 0) {
                        $("#signup-form").steps("previous");
                        history.pushState(null, null, location.href);
                    } else {
                        history.back(); // Allow exit if on first step
                    }
                });

                form.children("div").steps({
                    headerTag: "h3",
                    bodyTag: "fieldset",
                    transitionEffect: "fade",
                    stepsOrientation: "vertical",
                    titleTemplate: '<div class="title"><span class="step-number">#index#</span><span class="step-text">#title#</span></div>',"""
content = content.replace(old_js_init, new_js_init)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)
