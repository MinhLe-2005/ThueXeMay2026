// Script block 0


// Script block 1


// Script block 2


// Script block 3


// Script block 4


// Script block 5


// Script block 6


// Script block 7


// Script block 8

            // Unused navbar fetch commented out to prevent console error
            /*
            fetch('includes/navbar2.jsp')  // Sß╗¡ dß╗Ñng ─æ╞░ß╗¥ng dß║½n t╞░╞íng ─æß╗æi
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(html => {
                const container = document.getElementById('navbar-container');
                const shadowRoot = container.attachShadow({ mode: 'open' });

                // Th├¬m li├¬n kß║┐t tß╗¢i th╞░ viß╗çn Bootstrap Icons
                const link = document.createElement('link');
                link.rel = 'stylesheet';
                link.href = 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css';
                shadowRoot.appendChild(link);

                const template = document.createElement('template');
                template.innerHTML = html;

                // Copy c├íc thß║╗ link v├á script tß╗½ template v├áo shadow DOM
                const linksAndScripts = template.content.querySelectorAll('link, script');
                linksAndScripts.forEach(element => {
                    shadowRoot.appendChild(element.cloneNode(true));
                });

                // Copy nß╗Öi dung ch├¡nh v├áo shadow DOM
                shadowRoot.appendChild(template.content.cloneNode(true));
            })
            .catch(error => {
                console.error('Fetch error:', error);
            });
            */
            
            let totalI = 0;
            const numberAccessStatesI = {};
            (function ($) {



                var form = $("#signup-form");
                
                $.validator.addMethod("minAdvanceTime", function(value, element) {
                    if (!value) return true;
                    var dateStr = $("#pickupdate").val();
                    if (!dateStr) return true;
                    
                    var pickupDateTime = new Date(dateStr + "T" + value);
                    var minTime = new Date();
                    minTime.setHours(minTime.getHours() + 1);
                    minTime.setMinutes(minTime.getMinutes() - 5); // 5 min grace period
                    
                    return pickupDateTime >= minTime;
                }, "Vui l├▓ng ─æß║╖t xe tr╞░ß╗¢c 1 tiß║┐ng");

                $.validator.addMethod("businessHours", function(value, element) {
                    if (!value) return true;
                    var parts = value.split(':');
                    if (parts.length < 2) return true;
                    var hour = parseInt(parts[0], 10);
                    var minute = parseInt(parts[1], 10);
                    if (hour < 7 || hour > 23 || (hour === 23 && minute > 0)) {
                        return false;
                    }
                    return true;
                }, "Chß╗ë nhß║¡n/trß║ú xe trong giß╗¥ hoß║ít ─æß╗Öng (07:00 - 23:00)");

                form.validate({
                    errorPlacement: function errorPlacement(error, element) {
                        element.before(error);
                    },
                    rules: {
                        email: {
                            email: true
                        },
                        pickuptime: {
                            businessHours: true,
                            minAdvanceTime: true
                        },
                        returntime: {
                            businessHours: true
                        }
                    },
                    onfocusout: function (element) {
                        $(element).valid();
                    },
                });
                form.children("div").steps({
                    headerTag: "h3",
                    bodyTag: "fieldset",
                    transitionEffect: "fade",
                    stepsOrientation: "vertical",
                    titleTemplate: '<div class="title"><span class="step-number">#index#</span><span class="step-text">#title#</span></div>',
                    labels: {
                        previous: 'L├╣i lß║íi',
                        next: 'Tiß║┐p theo',
                        finish: 'Kß║┐t th├║c',
                        current: '',
                    },
                    onStepChanging: function (event, currentIndex, newIndex) {
                        if (currentIndex === 0) {
                            form.parent().parent().parent().append('<div class="footer footer-' + currentIndex + '"></div>');
                        }
                        if (currentIndex === 1) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-0').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 2) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-1').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 3) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-2').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 4) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-3').addClass('footer-' + currentIndex + '');
                        }
                        if (currentIndex === 5) {
                            form.parent().parent().parent().find('.footer').removeClass('footer-4').addClass('footer-' + currentIndex + '');
                        }

                        // if(currentIndex === 4) {
                        //     form.parent().parent().parent().append('<div class="footer" style="height:752px;"></div>');
                        // }
                        form.validate().settings.ignore = ":disabled,:hidden";
                        return form.valid();
                    },
                    onFinishing: function (event, currentIndex) {
                        form.validate().settings.ignore = ":disabled";
                        return form.valid();
                    },
                    onFinished: function (event, currentIndex) {
                        
                        var formData = form.serialize();
                      
                        $.ajax({
                        url: 'forgotPassword', // Replace with your servlet URL
                        type: 'POST',
                        data: formData,
                       
                        success: function (response) {
                            // Handle success
                            alert('Submitted successfully');
                            console.log(response);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            // Handle error
                            alert('Submission failed');
                            console.error(textStatus, errorThrown);
                        }
                    });
                    },
                    onStepChanged: function (event, currentIndex, priorIndex) {

                        var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                        storedFormData = {
                                pickupdate: document.getElementById('pickupdate').value,
                                pickuptime: document.getElementById('pickuptime').value,
                                returndate: document.getElementById('returndate').value,
                                returntime: document.getElementById('returntime').value,
                                pickuplocation: document.getElementById('pickuplocation').value,
                                returnlocation: document.getElementById('returnlocation').value
                            };
                        const pickupDateText = storedFormData.pickupdate;
                        const returnDateText = storedFormData.returndate;

                        // Chuyß╗ân c├íc chuß╗ùi ng├áy th├ánh ─æß╗æi t╞░ß╗úng Date
                        const pickupDate = new Date(pickupDateText);
                        const returnDate = new Date(returnDateText);

                        // T├¡nh sß╗æ ng├áy ch├¬nh lß╗çch
                        const differenceInTime = returnDate.getTime() - pickupDate.getTime();
                        const differenceInDays = differenceInTime / (1000 * 3600 * 24);
                            
                        if(currentIndex === 0){
                            nextButton.style.pointerEvents = 'auto';
                            nextButton.style.color = '';
                            nextButton.style.background = ''; nextButton.style.opacity = '1';
                        }
                        if (currentIndex === 1) {
//                            nextButton.style.pointerEvents = 'none';
//                            nextButton.style.background = ''; nextButton.style.opacity = '0.5';
//                            nextButton.style.color = '';
                            
                            toggleBikeNextButton();
                            changePrice();
                           
                       }
                                              if(currentIndex === 5){
                           var finishButton = document.querySelector('.wizard .actions a[href="#finish"]');
                           finishButton.style.display = 'none';
                           
                            const dataH2 = document.getElementById('dataInput');
                            const dataTotalStr = dataH2.textContent.replace(/[₫,.]/g, '').trim();
                            const dataTotal = parseInt(dataTotalStr) || 0;
                            const depositAmount = dataTotal * 10 / 100; // 10% deposit
                            
                            window.currentTotalAmount = dataTotal;
                            window.currentPaymentAmount = depositAmount;
                            
                            document.getElementById("sepay-total-amount").textContent = dataTotal.toLocaleString() + ' VNĐ';
                            document.getElementById("sepay-deposit-amount").textContent = depositAmount.toLocaleString() + ' VNĐ';
                            document.getElementById("sepay-qr-img").style.opacity = "0.3";
                            document.getElementById("sepay-status-text").innerHTML = "<i class='fas fa-spinner fa-spin'></i> Đang khởi tạo đơn hàng...";
                            
                            BookingHandler({ action: 'create_only' });
                       }
                       
                       function changePrice(){
                            var quantityDay = Math.max(1, Math.ceil(differenceInDays));
                            const priceDayElements = document.querySelectorAll('.price-day');
                            const priceWeekElements = document.querySelectorAll('.price-week');
                            const priceMonthElements = document.querySelectorAll('.price-month');
                            
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
                            
                            console.log(differenceInDays);
                            
                            if(quantityDay >= 1 && quantityDay <= 7){
                                
                                priceDayElements.forEach(element => {
                                   element.style.display = "inline-block";
                                   element.classList.add("price-current");
                                });
                            }
                            else if(quantityDay >= 8 && quantityDay <= 30){
                                
                                priceWeekElements.forEach(element => {
                                   element.style.display = "inline-block";
                                   element.classList.add("price-current");
                                });
                            }
                            else if(quantityDay >= 30){
                                
                                priceMonthElements.forEach(element => {
                                   element.style.display = "inline-block";
                                   element.classList.add("price-current");
                                });
                            }
                       }

                        if (currentIndex === 3) {
                            validateForm();
//                            nextButton.style.pointerEvents = 'auto';
//                            nextButton.style.color = '';
//                            nextButton.style.background = ''; nextButton.style.opacity = '1';
                        }
                        
                        if (currentIndex === 2) {
                            nextButton.style.pointerEvents = 'auto';
                            nextButton.style.color = '';
                            nextButton.style.background = ''; nextButton.style.opacity = '1';
                            let sum = 0;
                            const checkboxMotorContainer = document.getElementById('motorcyclelist');
                            const selectBoxes = checkboxMotorContainer.querySelectorAll('.form-check-select');

                            // Lß║╖p qua tß╗½ng select box v├á lß║Ñy th├┤ng tin nß║┐u gi├í trß╗ï lß╗¢n h╞ín 0
                            selectBoxes.forEach(selectBox => {
                                const quantity = parseInt(selectBox.value);
                                if (quantity > 0) {
                                   sum += quantity;
                                }
                            });
                            
                            if(sum !== totalI){
                                totalI = sum;
                                const checkboxContainer = document.getElementById('protection');
                                // ─Éß║╖t max v├á min cho c├íc input c├│ class 'form-check-select'
                                checkboxContainer.querySelectorAll('.form-check-select').forEach(input => {
                                    const label = input.nextElementSibling;
                                    let max = sum * 2;
                                    const min = 0;
                                    
                                    if (label.classList.contains('items-free')) {
                                        max = sum;
                                    }
                                    createOptions(input, min, max);
                                    
                                });
                                
                                if (numberAccessStatesI) {
                                    console.log(Object.keys(numberAccessStatesI).length !== 0);
                                    if(Object.keys(numberAccessStatesI).length !== 0){
                                        Object.keys(numberAccessStatesI).forEach(numberId => {
                                            const numberSelect = document.querySelector(`#protection #` + numberId);
                                            if (numberSelect) {
                                               
                                                const value = typeof numberAccessStatesI[numberId] === 'number' && !isNaN(numberAccessStatesI[numberId]) ? numberAccessStatesI[numberId] : 0;
                                                numberSelect.value = value;

                                            }
                                        });
                                    }
                                }                        
                                
                            }
                          
//                        
                            // H├ám tß║ío c├íc t├╣y chß╗ìn cho thß║╗ <select>
                            function createOptions(selectElement, min, max) {
                                selectElement.innerHTML = ''; // X├│a c├íc t├╣y chß╗ìn c┼⌐ nß║┐u c├│
                                for (let i = min; i <= max; i++) {
                                    const option = document.createElement('option');
                                    option.value = i;
                                    option.text = i;
                                    selectElement.appendChild(option);
                                }
                            }
                            
                            
                        }
                        
                        if(currentIndex !== 5){
                            const steps = document.querySelectorAll('.wizard ul[role="tablist"] li');
                            steps[5].classList.remove('done');
                            steps[5].classList.add('disabled');
                        }
                        
                        if (currentIndex === 4) { // B╞░ß╗¢c thß╗⌐ t╞░ (index bß║»t ─æß║ºu tß╗½ 0)
                            const checkbox = document.getElementById('daily-checkbox-term');
                            nextButton.style.pointerEvents = 'none';
                            nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                            nextButton.style.color = '';
                            
                            // Function to toggle the next button based on the checkbox state
                            checkbox.addEventListener('change', toggleNextButton);
                            // Initial check
                            toggleNextButton();
                            changePrice();
                            // Lß║Ñy dß╗» liß╗çu ─æ├ú l╞░u tß╗½ localStorage v├á th├¬m lß║íi v├áo savedItemsContainer
                            
                            if (storedFormData) {
                                document.getElementById('pickupdatetext').textContent = storedFormData.pickupdate;
                                document.getElementById('pickuploctext').textContent = storedFormData.pickuplocation;
                                document.getElementById('pickuptimetext').textContent = storedFormData.pickuptime;
                                document.getElementById('returnloctext').textContent = storedFormData.returnlocation;
                                document.getElementById('returndatetext').textContent = storedFormData.returndate;
                                document.getElementById('returntimetext').textContent = storedFormData.returntime;
                            }

                            //Add motorcycle have chosen
                            const savedBikeContainer = document.getElementById('savedBikeContainer');
                            savedBikeContainer.innerHTML = '';

                     
                            const numberMotorStates = {};


                            const checkboxMotorContainer = document.getElementById('motorcyclelist');

                            //tß║Ñt cß║ú c├íc select box trong div
                            const selectBoxes = checkboxMotorContainer.querySelectorAll('.form-check-select');

                            // Lß║╖p qua tß╗½ng select box v├á lß║Ñy th├┤ng tin nß║┐u gi├í trß╗ï lß╗¢n h╞ín 0
                            selectBoxes.forEach(selectBox => {
                                const quantity = parseInt(selectBox.value);
                                if (quantity > 0) {
                                    const formMotorBox = selectBox.closest('.form-box');
                                    if (formMotorBox) {
                                        savedBikeContainer.insertAdjacentHTML('beforeend', formMotorBox.outerHTML);
                                        numberMotorStates[selectBox.id] = quantity;
                                    }
                                }
                            });

                             // Hiß╗ân thß╗ï c├íc gi├í trß╗ï ─æ├ú l╞░u trong numberMotorStates
                            if (numberMotorStates) {
                                Object.keys(numberMotorStates).forEach(numberId => {
                                    const numberSelect = document.querySelector(`#savedBikeContainer #` + numberId);
                                    if (numberSelect) {
                                        numberSelect.value = numberMotorStates[numberId];
                                        numberSelect.disabled = true;  // Nß║┐u bß║ín muß╗æn v├┤ hiß╗çu h├│a c├íc select box ─æ├ú ─æ╞░ß╗úc l╞░u
                                    }
                                });
                            }
                            
                            //Add assecc item have chosen
                            const savedItemsContainer = document.getElementById('savedItemsContainer');
                            savedItemsContainer.innerHTML = ''; // Clear any previous 

                            const numberAccessStates = {};


                            const checkboxContainer = document.getElementById('protection');

                            // Lß║Ñy tß║Ñt cß║ú c├íc checkbox trong div
                            const checkboxes = checkboxContainer.querySelectorAll('.form-check-select');

                            // Lß║╖p qua tß╗½ng checkbox v├á lß║Ñy th├┤ng tin
                            checkboxes.forEach(selectBox => {
                                const quantity = parseInt(selectBox.value);
                                if (quantity > 0) {
                                    const formAccessBox = selectBox.closest('.form-box');
                                    if (formAccessBox) {
                                        savedItemsContainer.insertAdjacentHTML('beforeend', formAccessBox.outerHTML);
                                        numberAccessStates[selectBox.id] = quantity;
                                    }
                                }
                            });
                            if (numberAccessStates) {
                                Object.keys(numberAccessStates).forEach(numberId => {
                                    const numberSelect = document.querySelector(`#savedItemsContainer #` + numberId);
                                    if (numberSelect) {
                                        numberSelect.value = numberAccessStates[numberId];
                                        numberSelect.disabled = true;  // Nß║┐u bß║ín muß╗æn v├┤ hiß╗çu h├│a c├íc select box ─æ├ú ─æ╞░ß╗úc l╞░u
                                    }
                                });
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
                            }
                            
                           
                            
                            // Th├¬m ti├¬u ─æß╗ü h4 v├á dß╗» liß╗çu sß╗æ l╞░ß╗úng vß╗¢i gi├í tiß╗ün v├áo div cß╗Ñ thß╗â trong item-container
                            const formBoxTotal = document.getElementById('form-box-total');
                            formBoxTotal.innerHTML = '';
                            let totalAmount = 0;
                            //calculator motorcycles
                            const  savedBikeCal = document.querySelectorAll('#savedBikeContainer .form-box');
                            savedBikeCal.forEach(formBox => { 
                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4').textContent;
                                const priceLabel = formBox.querySelector('.main-price').textContent;
                                const quantity = parseInt(selects.value, 10);
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    price = parseInt(priceLabel.replace(/\D/g, ''), 10);
                                }

                                // Quantity l├á sß╗æ ng├áy ch├¬nh lß╗çch giß╗»a ng├áy trß║ú v├á ng├áy pickup
                                const quantityDay = Math.max(1, Math.ceil(differenceInDays)); // ─Éß║úm bß║úo quantity ├¡t nhß║Ñt l├á 1

                                // T├¡nh tß╗òng gi├í
                                const totalPrice = quantityDay * price * quantity;
                                totalAmount += totalPrice;

                                // Create new div elements similar to formBoxTotal structure
                                const itemContainer = document.createElement('div');
                                itemContainer.classList.add('item-container');
                                itemContainer.style.display = 'flex';
                                itemContainer.style.justifyContent = 'space-between';
                                itemContainer.style.alignItems = 'center';
                                itemContainer.style.padding = '15px 0';
                                itemContainer.style.borderBottom = '1px dashed #eaeaea';

                                itemContainer.innerHTML = `
                                    <div style="flex: 2;">
                                        <h4 style="margin: 0; font-size: 16px; color: #333;">` + title + `</h4>
                                    </div>
                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantityDay + ` Ng├áy
                                    </div>
                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantity + ` Xe
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        Γé½` + price.toLocaleString() + `/Ng├áy
                                    </div>
                                    <div style="flex: 1.5; text-align: right;">
                                        <h4 style="margin: 0; font-size: 18px; color: #b59349;">Γé½` + totalPrice.toLocaleString() + `</h4>
                                    </div>
                                `;

                                formBoxTotal.appendChild(itemContainer);                                  
                            });
                            
                            // Calculator items
                            const  savedAsseccCal = document.querySelectorAll('#savedItemsContainer .form-box');
                            savedAsseccCal.forEach(formBox => {                              
                                // Lß║Ñy nß╗Öi dung tß╗½ thß║╗ h4 v├á label
                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4').textContent;
                                const priceLabel = formBox.querySelector('label[for="daily-checkbox"]').textContent;
                                const quantity = parseInt(selects.value, 10);
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    price = parseInt(priceLabel.replace(/\D/g, ''), 10);
                                }

                                // T├¡nh tß╗òng gi├í
                                const totalPrice = quantity * price;
                                totalAmount += totalPrice;

                                // Tß║ío c├íc thß║╗ div mß╗¢i
                                const itemContainer = document.createElement('div');
                                itemContainer.classList.add('item-container');
                                itemContainer.style.display = 'flex';
                                itemContainer.style.justifyContent = 'space-between';
                                itemContainer.style.alignItems = 'center';
                                itemContainer.style.padding = '15px 0';
                                itemContainer.style.borderBottom = '1px dashed #eaeaea';

                                itemContainer.innerHTML = `
                                    <div style="flex: 2;">
                                        <h4 style="margin: 0; font-size: 16px; color: #333;">` + title + `</h4>
                                    </div>
                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantity + ` C├íi
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        ` + priceLabel + `
                                    </div>
                                    <div style="flex: 1.5; text-align: right;">
                                        <h4 style="margin: 0; font-size: 18px; color: #b59349;">Γé½` + totalPrice.toLocaleString() + `</h4>
                                    </div>
                                `;

                                formBoxTotal.appendChild(itemContainer);
                                
                            });
                            // Tß║ío thß║╗ div item-total v├á th├¬m v├áo cuß╗æi savedItemsContainer
                            const itemTotalContainer = document.createElement('div');
                            itemTotalContainer.classList.add('item-total');
                            itemTotalContainer.style.paddingTop = '20px';
                            itemTotalContainer.style.display = 'flex';
                            itemTotalContainer.style.flexDirection = 'column';
                            itemTotalContainer.style.alignItems = 'flex-end';

                            // Apply voucher discount if any
                            const appliedDiscount = parseInt(document.getElementById('applied-discount').value) || 0;
                            const finalAmount = Math.max(0, totalAmount - appliedDiscount);

                            let discountHtml = '';
                            if (appliedDiscount > 0) {
                                discountHtml = `<div style="display:flex; justify-content:space-between; width: 100%; color:#16a34a; font-size:15px; margin-bottom:12px; font-weight: 600;">
                                    <span>≡ƒÄë Giß║úm gi├í voucher:</span>
                                    <span>-Γé½1</span>
                                </div>`;
                            }

                            itemTotalContainer.innerHTML = discountHtml +
                                `<div style="display:flex; justify-content:space-between; width: 100%; align-items: center;">
                                    <h4 style="margin: 0; font-size: 18px; color: #333;">Tß╗òng thanh to├ín:</h4>
                                    <h2 id="dataInput" style="margin: 0; font-size: 26px; color: #b59349; font-weight: 700;">Γé½`+ finalAmount.toLocaleString() +`</h2>
                                </div>`;
                            formBoxTotal.appendChild(itemTotalContainer);
                        }

                        function toggleNextButton() {
                               const checkbox =document.getElementById('daily-checkbox-term');
                               if (checkbox.checked) {
                                   nextButton.style.pointerEvents = 'auto';
                                   nextButton.style.color = '';
                                   nextButton.style.background = ''; nextButton.style.opacity = '1';
                               } else {
                                   nextButton.style.pointerEvents = 'none';
                                   nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                                   nextButton.style.color = '';
                               }
                        }
                        
                        
                        
                        return true;
                    }


                });
                jQuery.extend(jQuery.validator.messages, {
                    required: "",
                    remote: "",
                    email: "",
                    url: "",
                    date: "",
                    dateISO: "",
                    number: "",
                    digits: "",
                    creditcard: "",
                    equalTo: ""
                });

                $.dobPicker({
                    daySelector: '#birth_date',
                    monthSelector: '#birth_month',
                    yearSelector: '#birth_year',
                    dayDefault: '',
                    monthDefault: '',
                    yearDefault: '',
                    minimumAge: 0,
                    maximumAge: 120
                });
                var marginSlider = document.getElementById('slider-margin');
                if (marginSlider != undefined) {
                    noUiSlider.create(marginSlider, {
                        start: [1100],
                        step: 100,
                        connect: [true, false],
                        tooltips: [true],
                        range: {
                            'min': 100,
                            'max': 2000
                        },
                        pips: {
                            mode: 'values',
                            values: [100, 2000],
                            density: 4
                        },
                        format: wNumb({
                            decimals: 0,
                            thousand: '',
                            prefix: '$ ',
                        })
                    });
                    var marginMin = document.getElementById('value-lower'),
                            marginMax = document.getElementById('value-upper');

                    marginSlider.noUiSlider.on('update', function (values, handle) {
                        if (handle) {
                            marginMax.innerHTML = values[handle];
                        } else {
                            marginMin.innerHTML = values[handle];
                        }
                    });
                }





            })(jQuery);
            
            
            document.addEventListener('DOMContentLoaded', () => {
                              
                const requiredFields = [
                    document.getElementById('pickupdate'),
                    document.getElementById('pickuptime'),
                    document.getElementById('returndate'),
                    document.getElementById('returntime'),
                    document.getElementById('pickuplocation'),
                    document.getElementById('returnlocation')
                ];
                
                // Function to format date to YYYY-MM-DD
                const formatDate = (date) => {
                    const d = new Date(date);
                    let month = '' + (d.getMonth() + 1);
                    let day = '' + d.getDate();
                    const year = d.getFullYear();

                    if (month.length < 2) month = '0' + month;
                    if (day.length < 2) day = '0' + day;

                    return [year, month, day].join('-');
                };
                
                const pickupdate = requiredFields[0];
                const returndate = requiredFields[2];
                // Set the min attribute for pickupdate
                const today = new Date();
                // today.setDate(today.getDate() + 1); // Minimum pick-up date is tomorrow
                pickupdate.min = formatDate(today);
                returndate.min = formatDate(today);
                
                pickupdate.addEventListener('change', () => {
                    const pickupdateValue = new Date(pickupdate.value);
                    pickupdateValue.setDate(pickupdateValue.getDate() + 1); // Minimum return date is one day after pick-up date
                    returndate.min = formatDate(pickupdateValue);

                    if (new Date(returndate.value) <= new Date(pickupdate.min)) {
                        returndate.value = formatDate(pickupdateValue);
                    }
                });
                
                returndate.addEventListener('change', () => {
                    const returndateValue = new Date(returndate.value);
                    returndateValue.setDate(returndateValue.getDate() - 1); // Minimum return date is one day after pick-up date
                    pickupdate.max = formatDate(returndateValue);

                    if (new Date(returndate.value) <= new Date(pickupdate.min)) {
                        pickupdate.value = formatDate(returndateValue);
                    }
                });

                // Initialize the values if they are empty
                if (!pickupdate.value) {
                    pickupdate.value = formatDate(today);
                }

                if (!returndate.value) {
                    const defaultReturnDate = new Date(pickupdate.value);
                    defaultReturnDate.setDate(defaultReturnDate.getDate() + 1);
                    returndate.value = formatDate(defaultReturnDate);
                }
                
                function checkFields() {
                    var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                    const allFieldsFilled = requiredFields.every(field => field.value.trim() !== '');
                    if (allFieldsFilled) {
                        nextButton.style.pointerEvents = 'auto';
                        nextButton.style.color = '';
                        nextButton.style.background = ''; nextButton.style.opacity = '1';
                    } else {
                        nextButton.style.pointerEvents = 'none';
                        nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                        nextButton.style.color = '';

                         const currentStepIndex = 1;
                         const steps = document.querySelectorAll('.wizard ul[role="tablist"] li');

                         steps.forEach((step, index) => {
                             console.log(index);
                             if (index > currentStepIndex) {
                                 step.classList.remove('done');
                                 step.classList.add('disabled');
                             }
                         });
                    }
                }
                
                
                requiredFields.forEach(field => {
                    field.addEventListener('input', checkFields);
                    field.addEventListener('change', checkFields);
                });
                
               
                // Initial check in case some fields are pre-filled
                checkFields();
                
                // Image preview for CCCD/CMND
                document.querySelectorAll('input[type="file"][name^="image"]').forEach(fileInput => {
                    fileInput.addEventListener('change', function(event) {
                        const file = event.target.files[0];
                        const wrapper = fileInput.closest('.upload-card-wrapper');
                        const card = wrapper.querySelector('.upload-card');
                        const cardTitle = card ? card.querySelector('.upload-title') : null;
                        const cardSubtitle = card ? card.querySelector('.upload-subtitle') : null;
                        const cardIcon = card ? card.querySelector('i') : null;
                        const dynamicPreviewContainer = wrapper.querySelector('.image-preview-container:not(.existing-image)');
                        const existingPreviewContainer = wrapper.querySelector('.existing-image');

                        if (file) {
                            // Mark card as uploaded (green state)
                            if (card) card.classList.add('uploaded');
                            if (cardIcon) { cardIcon.className = 'bi bi-check-circle-fill'; }
                            if (cardTitle) cardTitle.textContent = 'Γ£ô ─É├ú chß╗ìn: ' + file.name.substring(0, 20) + (file.name.length > 20 ? '...' : '');
                            if (cardSubtitle) cardSubtitle.textContent = 'Nhß║Ñn ─æß╗â thay ─æß╗òi ß║únh';

                            const reader = new FileReader();
                            reader.onload = function(e) {
                                if (dynamicPreviewContainer) {
                                    const img = dynamicPreviewContainer.querySelector('.img-preview');
                                    img.src = e.target.result;
                                    dynamicPreviewContainer.style.display = 'flex';
                                    dynamicPreviewContainer.style.position = 'relative';
                                    
                                    // Add clear button if not exists
                                    let clearBtn = dynamicPreviewContainer.querySelector('.clear-btn');
                                    if (!clearBtn) {
                                        clearBtn = document.createElement('button');
                                        clearBtn.className = 'clear-btn';
                                        clearBtn.innerHTML = '&times;';
                                        clearBtn.type = 'button';
                                        clearBtn.title = 'X├│a ß║únh';
                                        clearBtn.style.position = 'absolute';
                                        clearBtn.style.top = '-10px';
                                        clearBtn.style.right = '-10px';
                                        clearBtn.style.background = '#dc2626';
                                        clearBtn.style.color = 'white';
                                        clearBtn.style.border = 'none';
                                        clearBtn.style.borderRadius = '50%';
                                        clearBtn.style.width = '24px';
                                        clearBtn.style.height = '24px';
                                        clearBtn.style.lineHeight = '1';
                                        clearBtn.style.cursor = 'pointer';
                                        clearBtn.style.boxShadow = '0 2px 4px rgba(0,0,0,0.2)';
                                        clearBtn.style.display = 'flex';
                                        clearBtn.style.alignItems = 'center';
                                        clearBtn.style.justifyContent = 'center';
                                        clearBtn.style.fontSize = '18px';
                                        clearBtn.style.fontWeight = 'bold';
                                        clearBtn.style.zIndex = '10';
                                        
                                        clearBtn.onclick = function(e) {
                                            e.stopPropagation();
                                            e.preventDefault();
                                            fileInput.value = '';
                                            fileInput.dispatchEvent(new Event('change'));
                                        };
                                        dynamicPreviewContainer.appendChild(clearBtn);
                                    }
                                }
                                if (existingPreviewContainer) {
                                    existingPreviewContainer.style.display = 'none';
                                }
                            };
                            reader.readAsDataURL(file);
                        } else {
                            // Reset card state
                            if (card) card.classList.remove('uploaded');
                            if (cardIcon) { cardIcon.className = fileInput.name === 'imageFront' ? 'bi bi-person-vcard' : 'bi bi-credit-card-2-back'; }
                            if (dynamicPreviewContainer) dynamicPreviewContainer.style.display = 'none';
                            if (existingPreviewContainer) existingPreviewContainer.style.display = 'flex';
                        }
                    });
                });
                
                // Add event listeners to validate form on image change
                const frontInput = document.getElementById('imageFront');
                const backInput = document.getElementById('imageBack');
                if (frontInput) frontInput.addEventListener('change', validateForm);
                if (backInput) backInput.addEventListener('change', validateForm);
                
            });
            
            document.addEventListener('DOMContentLoaded', () => {
                
                storedFormData = {
                        pickupdate: document.getElementById('pickupdate').value,                             
                        returndate: document.getElementById('returndate').value                    
                    };
                const pickupDateText = storedFormData.pickupdate;
                const returnDateText = storedFormData.returndate;
                
                
                // Chuyß╗ân c├íc chuß╗ùi ng├áy th├ánh ─æß╗æi t╞░ß╗úng Date
                const pickupDate = new Date(pickupDateText);
                const returnDate = new Date(returnDateText);
                
                console.log(pickupDate);
                console.log(returnDateText);
                
                // T├¡nh sß╗æ ng├áy ch├¬nh lß╗çch
                const differenceInTime = returnDate.getTime() - pickupDate.getTime();
                const differenceInDays = differenceInTime / (1000 * 3600 * 24);
                
                
                
            });
            
            function validateIdentityCard() {
                const identityCard = document.getElementById('identityCard');
                return identityCard.value.length === 12;
            }
            
            function validateForm() {
                const requiredFields = [
                    document.getElementById('first_name'),
                    document.getElementById('last_name'),
                    document.getElementById('email'),
                    document.getElementById('phonenumber'),
                    document.getElementById('address'),
                    document.getElementById('dob'),
                    document.querySelector('input[name="gender"]:checked'),
                    document.getElementById('identityCard'),
                    document.getElementById('issuedon'),
                    document.getElementById('expdate')
                ];
                
                const allFieldsFilled = requiredFields.every(field => field && field.value.trim() !== '');
                const identityCardValid = validateIdentityCard();
                
                let filesValid = true;
                const custIdEl = document.getElementById('customerId');
                if (custIdEl && custIdEl.textContent.trim() === 'Not') {
                    const frontFile = document.getElementById('imageFront');
                    const backFile = document.getElementById('imageBack');
                    filesValid = (frontFile && frontFile.files.length > 0) && (backFile && backFile.files.length > 0);
                }
                
                var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                if (allFieldsFilled && identityCardValid && filesValid) {
                    nextButton.disabled = false;
                    nextButton.style.pointerEvents = 'auto';
                    nextButton.style.color = '';
                    nextButton.style.background = ''; nextButton.style.opacity = '1';
                } else {
                    nextButton.disabled = true;
                    nextButton.style.pointerEvents = 'none';
                    nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                    nextButton.style.color = '';
                    
                    const currentStepIndex = 3;
                    const steps = document.querySelectorAll('.wizard ul[role="tablist"] li');

                    steps.forEach((step, index) => {

                        if (index > currentStepIndex) {
                            step.classList.remove('done');
                            step.classList.add('disabled');
                        }
                    });
                }
            }

            $("#motorcyclelist").on("change", ".form-check-select", function() {
               toggleBikeNextButton();
            });
            
           function toggleBikeNextButton() {
                var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                // Kiß╗âm tra nß║┐u c├│ bß║Ñt kß╗│ select box n├áo c├│ gi├í trß╗ï lß╗¢n h╞ín 0
                var anySelected = $(".form-check-select", "#motorcyclelist").toArray().some(function(select) {
                    return parseInt($(select).val()) > 0;
                });

                // Nß║┐u c├│ ├¡t nhß║Ñt mß╗Öt select box ─æ├ú chß╗ìn, k├¡ch hoß║ít n├║t "Next"
                if (anySelected) {
                    nextButton.style.pointerEvents = 'auto';
                    nextButton.style.color = '';
                    nextButton.style.background = ''; nextButton.style.opacity = '1';
                    const checkboxContainer = document.getElementById('protection');
                    // Lß║Ñy tß║Ñt cß║ú c├íc checkbox trong div
                    const checkboxes = checkboxContainer.querySelectorAll('.form-check-select');
                    // Lß║╖p qua tß╗½ng checkbox v├á lß║Ñy th├┤ng tin
                    checkboxes.forEach(selectBox => {
                        const quantity = parseInt(selectBox.value);                     
                        const formAccessBox = selectBox.closest('.form-box');
                        if (formAccessBox) {
                            numberAccessStatesI[selectBox.id] = quantity;
                        }
                    });
                    
                } else {
                    nextButton.style.pointerEvents = 'none';
                    nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                    nextButton.style.color = '';

                     const currentStepIndex = 1;
                     const steps = document.querySelectorAll('.wizard ul[role="tablist"] li');

                     steps.forEach((step, index) => {
                       
                         if (index > currentStepIndex) {
                             step.classList.remove('done');
                             step.classList.add('disabled');
                         }
                     });
                }
            }
                            
            function incrementQuantity(motorcycleId) {
                var checkbox = document.getElementById('daily-checkbox-' + motorcycleId);
                var quantityInput = document.getElementById('daily-quantity-' + motorcycleId);
                quantityInput.value = parseInt(quantityInput.value) + 1;
                if (!checkbox.checked) {
                    checkbox.checked = true;
                    checkbox.parentElement.style.borderColor = '#28a745';
                }
                toggleBikeNextButton();
            }

            function decrementQuantity(motorcycleId) {
                var checkbox = document.getElementById('daily-checkbox-' + motorcycleId);
                var quantityInput = document.getElementById('daily-quantity-' + motorcycleId);
                if (quantityInput.value > 0) {
                    quantityInput.value = parseInt(quantityInput.value) - 1;
                    if(parseInt(quantityInput.value) === 0){
                        checkbox.checked = false;
                        checkbox.parentElement.style.borderColor = '';
                    }
                }
                toggleBikeNextButton();

            }
            
            function clearQuantity(motorcycleId) {
                var checkbox = document.getElementById('daily-checkbox-' + motorcycleId);
                var quantityInput = document.getElementById('daily-quantity-' + motorcycleId);              
                checkbox.checked = false;
                checkbox.parentElement.style.borderColor = '';
                quantityInput.value = 0;   
                toggleBikeNextButton();
            }
            
           

        window.addEventListener('message', (event) => {
            if (event.data === 'activateOverlay') {
                const overlay = document.getElementById('overlay');
                overlay.classList.add('active');
//                
//                // Thß╗▒c hiß╗çn c├íc h├ánh ─æß╗Öng cß║ºn thiß║┐t tß║íi ─æ├óy, v├¡ dß╗Ñ: tß║»t overlay sau 3 gi├óy
//                setTimeout(() => {
//                    overlay.classList.remove('active');
//                }, 30000000);
            }
            if(event.data === 'stopOverlay') {
                const overlay = document.getElementById('overlay');
                overlay.classList.remove('active');
            }
        });
           // Kiß╗âm tra nß║┐u c├│ dß╗» liß╗çu n├áo ─æ╞░ß╗úc gß╗¡i tß╗½ servlet
        function handlePaymentStatus(data) {
            if (data.status === 'success') {
                BookingHandler(data);
            }
        }
        
        window.addEventListener('storage', function(event) {
            console.log(event.key);
            if (event.key === 'payment_status') {
                var paymentStatus = JSON.parse(event.newValue);
                handlePaymentStatus(paymentStatus);
            }
        });

        
        function collectAccessoryData() {
            const accessories = [];
            const savedItemsContainer = document.getElementById('savedItemsContainer');
            // Lß║╖p qua tß║Ñt cß║ú c├íc phß║ºn tß╗¡ c├│ class "form-box"
            savedItemsContainer.querySelectorAll('.form-box').forEach(box => {
                const select = box.querySelector('.form-check-select');
                const quantity = parseInt(select.value);
                const id = select.id.split('-').pop();  // Lß║Ñy accessoryId tß╗½ id cß╗ºa select box
                const priceLabel = box.querySelector('.form-check .checkbox-container label');
                const priceText = priceLabel ? priceLabel.textContent.replace('Γé½', '').replace('.000', '').trim() : '0';
                const price = priceText.includes('Free') ? 0 : parseInt(priceText, 10);
                // Nß║┐u sß╗æ l╞░ß╗úng lß╗¢n h╞ín 0, th├¬m v├áo danh s├ích
                if (quantity > 0) {
                    accessories.push({
                        id: id,
                        quantity: quantity.toString(),
                        price: parseInt(price)
                    });
                }
            });

            return accessories;
        }
        function BookingHandler(options) {
            var formData = new FormData();
            
//            alert("Thanh to├ín th├ánh c├┤ng vß╗¢i m├ú giao dß╗ïch: " + data.txnRef);
             // Lß║Ñy c├íc gi├í trß╗ï tß╗½ c├íc thß║╗ <p>
            var pickupDate = document.getElementById("pickupdatetext").textContent.trim();
            var pickupTime = document.getElementById("pickuptimetext").textContent.trim();
            var pickupLocation = document.getElementById("pickuploctext").textContent.trim();
            var returnLocation = document.getElementById("returnloctext").textContent.trim();
            var returnDate = document.getElementById("returndatetext").textContent.trim();
            var returnTime = document.getElementById("returntimetext").textContent.trim();
            var accountId = document.getElementById("accountId").textContent.trim();
            var fistname = document.getElementById("firstnametext").textContent.trim();
            var lastname = document.getElementById("lastnametext").textContent.trim();
            var phone = document.getElementById("phonetext").textContent.trim();
            var email = document.getElementById("emailaddresstext").textContent.trim();
            var address = document.getElementById("addresstext").textContent.trim();
            var dob = document.getElementById("birthdaytext").textContent.trim();
            var gender = document.getElementById("gendertext").textContent.trim();
            var customerId = document.getElementById("customerId").textContent.trim();
            var identityCard = document.getElementById("identityCard").value;
            var issuedon = document.getElementById("issuedon").value;
            var expdate = document.getElementById("expdate").value;
            var total = document.getElementById("dataInput").textContent.trim();
            
            
            // Chuyß╗ân c├íc chuß╗ùi ng├áy th├ánh ─æß╗æi t╞░ß╗úng Date
            const pickupD = new Date(pickupDate);
            const returnD = new Date(returnDate);

            // T├¡nh sß╗æ ng├áy ch├¬nh lß╗çch
            const differenceInTime = returnD.getTime() - pickupD.getTime();
            const differenceInDays = differenceInTime / (1000 * 3600 * 24);
            
             // Quantity l├á sß╗æ ng├áy ch├¬nh lß╗çch giß╗»a ng├áy trß║ú v├á ng├áy pickup
            const quantityDay = Math.max(1, Math.ceil(differenceInDays));
            
            const bikeDetails = [];

            const checkboxMotorContainer = document.getElementById('savedBikeContainer');

            // tß║Ñt cß║ú c├íc select box trong div
            const selectBoxes = checkboxMotorContainer.querySelectorAll('.form-check-select');

            // Lß║╖p qua tß╗½ng select box v├á lß║Ñy th├┤ng tin nß║┐u gi├í trß╗ï lß╗¢n h╞ín 0
            selectBoxes.forEach(selectBox => {
                const quantity = parseInt(selectBox.value);
                if (quantity > 0) {
                    const formMotorBox = selectBox.closest('.form-box');
                    if (formMotorBox) {
                        const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                        const bikePrice = formMotorBox.querySelector('.price-current').textContent;
                        const price = parseInt(bikePrice.replace('Γé½', '').replace('.000/Day', '').trim());
                        const totalPrice = quantityDay * price;
//                        const price = priceLabel ? priceLabel.textContent.replace('Γé½', '').replace('.000', '').trim() : 0;
                        // L╞░u tß╗½ng chiß║┐c xe theo sß╗æ l╞░ß╗úng
                        for (let i = 0; i < quantity; i++) {                                                                                    
                            bikeDetails.push({ name: bikeName, price: totalPrice.toString() });
                        }
                    }
                }
            });
            const accessoriesData = collectAccessoryData();

            console.log(bikeDetails);
            console.log(accessoriesData);
            console.log(fistname);
            var data = {
                pickupDate: pickupDate + " " + pickupTime,
                pickupLocation: pickupLocation,
                returnLocation: returnLocation,
                returnDate: returnDate + " " + returnTime,
                accountId: accountId,          
                fistname : fistname,
                lastname : lastname, 
                phone : phone,
                email : email,
                address: address,
                dob: dob,
                gender: gender,
                customerId : customerId,
                identityCard : identityCard,
                issuedon : issuedon,
                expdate : expdate,
                bikeDetails: bikeDetails,
                accessories: accessoriesData,
                total : total,
                amount: window.currentPaymentAmount || 0,
                paymenttime: new Date().toISOString(),
                voucherId: document.getElementById('applied-voucher-id').value || '0'
            };
            
             // Convert object to JSON and append to formData
            formData.append("jsonData", JSON.stringify(data));

            // Add files to formData
            var fileInputFront = document.getElementById('imageFront');
            var fileInputBack = document.getElementById('imageBack');
            if (fileInputFront && fileInputFront.files.length > 0) {
                formData.append("fileFront", fileInputFront.files[0]);
            }
            if (fileInputBack && fileInputBack.files.length > 0) {
                formData.append("fileBack", fileInputBack.files[0]);
            }
            // Gß╗¡i dß╗» liß╗çu tß╗¢i servlet bß║▒ng AJAX
            $.ajax({
                type: "POST",
                url: "bookinghandler", // Thay ─æß╗òi URL tß╗¢i servlet cß╗ºa bß║ín
//                data: JSON.stringify(data),              
//                contentType: "application/json",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    console.log("Data sent successfully:", response);
                },
                error: function(xhr, status, error) {
                    console.error("Error sending data:", error);
                }
            });
            window.location.href = 'home';
        }

        // Nß║┐u dß╗» liß╗çu ─æ├ú c├│ sß║╡n trong LocalStorage khi trang ─æ╞░ß╗úc tß║úi lß║íi
        var existingStatus = localStorage.getItem('payment_status');
        if (existingStatus) {
            handlePaymentStatus(JSON.parse(existingStatus));
            localStorage.removeItem('payment_status');
        }
        
        
       

        // ===== VOUCHER FUNCTIONS =====
        function applyVoucher() {
            const code = document.getElementById('voucher-code-input').value.trim();
            const msgEl = document.getElementById('voucher-msg');
            if (!code) {
                msgEl.style.color = '#dc2626';
                msgEl.textContent = 'Vui l├▓ng nhß║¡p m├ú voucher';
                return;
            }
            msgEl.style.color = '#6b7280';
            msgEl.textContent = '─Éang kiß╗âm tra...';

            fetch('applyVoucher', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'code=' + encodeURIComponent(code)
            })
            .then(r => r.json())
            .then(data => {
                if (data.valid) {
                    document.getElementById('applied-voucher-id').value = data.voucherId;
                    document.getElementById('applied-discount').value = data.discount;
                    msgEl.style.color = '#16a34a';
                    msgEl.textContent = 'Γ£ô ├üp dß╗Ñng th├ánh c├┤ng! Giß║úm Γé½' + Number(data.discount).toLocaleString('vi-VN')
                        + (data.description ? ' ΓÇö ' + data.description : '');
                    document.getElementById('apply-voucher-btn').textContent = '─É├ú ├íp dß╗Ñng';
                    document.getElementById('apply-voucher-btn').style.background = '#16a34a';
                    // Refresh total display
                    const formBoxTotal = document.getElementById('form-box-total');
                    if (formBoxTotal) { formBoxTotal.dispatchEvent(new Event('refresh')); }
                    // Re-trigger total calculation by re-rendering
                    const event4 = new CustomEvent('recalcTotal');
                    document.dispatchEvent(event4);
                } else {
                    msgEl.style.color = '#dc2626';
                    msgEl.textContent = 'Γ£ù ' + data.message;
                    resetVoucher();
                }
            })
            .catch(() => {
                msgEl.style.color = '#dc2626';
                msgEl.textContent = 'Lß╗ùi kß║┐t nß╗æi, vui l├▓ng thß╗¡ lß║íi';
            });
        }

        function resetVoucher() {
            document.getElementById('applied-voucher-id').value = '0';
            document.getElementById('applied-discount').value = '0';
            const btn = document.getElementById('apply-voucher-btn');
            if (btn) {
                btn.textContent = '├üp dß╗Ñng';
                btn.style.background = 'linear-gradient(135deg, #02b8af, #046fd4)';
            }
        }
        

// Script block 9


// Script block 10

        (function() {
            try {
                var startDate = sessionStorage.getItem('hs_startDate');
                var endDate   = sessionStorage.getItem('hs_endDate');
                var pickup    = sessionStorage.getItem('hs_pickup');
                var returnL   = sessionStorage.getItem('hs_returnLoc');
                if (!startDate) return;

                // Fill date fields (split datetime-local ΓåÆ date + time)
                function splitDT(dtStr) {
                    if (!dtStr) return {date:'', time:''};
                    var parts = dtStr.split('T');
                    return { date: parts[0] || '', time: parts[1] ? parts[1].substring(0,5) : '' };
                }
                var sd = splitDT(startDate);
                var ed = splitDT(endDate);

                var pickupDateEl  = document.getElementById('pickupdate');
                var pickupTimeEl  = document.getElementById('pickuptime');
                var returnDateEl  = document.getElementById('returndate');
                var returnTimeEl  = document.getElementById('returntime');
                var pickupLocEl   = document.getElementById('pickuplocation');
                var returnLocEl   = document.getElementById('returnlocation');

                if (pickupDateEl && sd.date) pickupDateEl.value = sd.date;
                if (pickupTimeEl && sd.time) pickupTimeEl.value = sd.time;
                if (returnDateEl && ed.date) returnDateEl.value = ed.date;
                if (returnTimeEl && ed.time) returnTimeEl.value = ed.time;

                // Set location selects (match value or fallback to last option)
                function setSelectValue(sel, val) {
                    if (!sel || !val) return;
                    for (var i = 0; i < sel.options.length; i++) {
                        if (sel.options[i].value.toLowerCase().indexOf(val.substring(0,8).toLowerCase()) >= 0) {
                            sel.selectedIndex = i; return;
                        }
                    }
                }
                setSelectValue(pickupLocEl, pickup);
                setSelectValue(returnLocEl, returnL);

                // Clear so it doesn't re-apply on back navigation
                sessionStorage.removeItem('hs_startDate');
                sessionStorage.removeItem('hs_endDate');
                sessionStorage.removeItem('hs_pickup');
                sessionStorage.removeItem('hs_returnLoc');

                // Auto-advance logic has been removed as per user request
                // setTimeout(function() {
                //     var nextBtn = document.querySelector('a[href="#next"]') ||
                //                   document.querySelector('.actions a[href*="next"]') ||
                //                   document.querySelector('.wizard-next-btn') ||
                //                   document.querySelector('[data-action="next"]');
                //     if (nextBtn) nextBtn.click();
                // }, 800);

            } catch(ex) {}
        })();
        

