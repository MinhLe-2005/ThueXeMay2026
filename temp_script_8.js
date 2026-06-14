
            // Unused navbar fetch commented out to prevent console error
            /*
            fetch('includes/navbar2.jsp')  // Sử dụng đường dẫn tương đối
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(html => {
                const container = document.getElementById('navbar-container');
                const shadowRoot = container.attachShadow({ mode: 'open' });

                // Thêm liên kết tới thư viện Bootstrap Icons
                const link = document.createElement('link');
                link.rel = 'stylesheet';
                link.href = 'https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css';
                shadowRoot.appendChild(link);

                const template = document.createElement('template');
                template.innerHTML = html;

                // Copy các thẻ link và script từ template vào shadow DOM
                const linksAndScripts = template.content.querySelectorAll('link, script');
                linksAndScripts.forEach(element => {
                    shadowRoot.appendChild(element.cloneNode(true));
                });

                // Copy nội dung chính vào shadow DOM
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
                    
                    return pickupDateTime >= minTime;
                }, "Giờ nhận xe không được ở trong quá khứ");

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
                }, "Chỉ nhận/trả xe trong giờ hoạt động (07:00 - 23:00)");

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
                // Prevent accidental exit on browser back button
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
                    titleTemplate: '<div class="title"><span class="step-number">#index#</span><span class="step-text">#title#</span></div>',
                    labels: {
                        previous: 'Lùi lại',
                        next: 'Tiếp theo',
                        finish: 'Kết thúc',
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

                        // Chuyển các chuỗi ngày thành đối tượng Date
                        const pickupDate = new Date(pickupDateText);
                        const returnDate = new Date(returnDateText);

                        // Tính số ngày chênh lệch
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
                updateSelectedBikesBanner();
                            changePrice();
                           
                       }
                                              if(currentIndex === 5){
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

                            // Lặp qua từng select box và lấy thông tin nếu giá trị lớn hơn 0
                            selectBoxes.forEach(selectBox => {
                                const quantity = parseInt(selectBox.value);
                                if (quantity > 0) {
                                   sum += quantity;
                                }
                            });
                            
                            if(sum !== totalI){
                                totalI = sum;
                                const checkboxContainer = document.getElementById('protection');
                                // Đặt max và min cho các input có class 'form-check-select'
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
                            // Hàm tạo các tùy chọn cho thẻ <select>
                            function createOptions(selectElement, min, max) {
                                selectElement.innerHTML = ''; // Xóa các tùy chọn cũ nếu có
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
                        
                        if (currentIndex === 4) { // Bước thứ tư (index bắt đầu từ 0)
                            const checkbox = document.getElementById('daily-checkbox-term');
                            nextButton.style.pointerEvents = 'none';
                            nextButton.style.background = ''; nextButton.style.opacity = '0.5';
                            nextButton.style.color = '';
                            
                            // Function to toggle the next button based on the checkbox state
                            checkbox.addEventListener('change', toggleNextButton);
                            // Initial check
                            toggleNextButton();
                            changePrice();
                            // Lấy dữ liệu đã lưu từ localStorage và thêm lại vào savedItemsContainer
                            
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

                            //tất cả các select box trong div
                            const selectBoxes = checkboxMotorContainer.querySelectorAll('.form-check-select');

                            // Lặp qua từng select box và lấy thông tin nếu giá trị lớn hơn 0
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

                             // Hiển thị các giá trị đã lưu trong numberMotorStates
                            if (numberMotorStates) {
                                Object.keys(numberMotorStates).forEach(numberId => {
                                    const numberSelect = document.querySelector(`#savedBikeContainer #` + numberId);
                                    if (numberSelect) {
                                        numberSelect.value = numberMotorStates[numberId];
                                        numberSelect.disabled = true;  // Nếu bạn muốn vô hiệu hóa các select box đã được lưu
                                    }
                                });
                            }
                            
                            //Add assecc item have chosen
                            const savedItemsContainer = document.getElementById('savedItemsContainer');
                            savedItemsContainer.innerHTML = ''; // Clear any previous 

                            const numberAccessStates = {};


                            const checkboxContainer = document.getElementById('protection');

                            // Lấy tất cả các checkbox trong div
                            const checkboxes = checkboxContainer.querySelectorAll('.form-check-select');

                            // Lặp qua từng checkbox và lấy thông tin
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
                                        numberSelect.disabled = true;  // Nếu bạn muốn vô hiệu hóa các select box đã được lưu
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
                            
                           
                            
                            // Thêm tiêu đề h4 và dữ liệu số lượng với giá tiền vào div cụ thể trong item-container
                            const formBoxTotal = document.getElementById('form-box-total');
                            formBoxTotal.innerHTML = '';
                            let totalAmount = 0;
                            //calculator motorcycles
                            const  savedBikeCal = document.querySelectorAll('#savedBikeContainer .form-box');
                            savedBikeCal.forEach(formBox => { 
                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4') ? formBox.querySelector('h4').textContent : 'Xe';
                                const priceLabelElement = formBox.querySelector('.price-current') || formBox.querySelector('.main-price');
                                const priceLabel = priceLabelElement ? priceLabelElement.textContent : '0';
                                const quantity = parseInt(selects.value, 10) || 0;
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    price = parseInt(priceLabel.replace(/\D/g, ''), 10) || 0;
                                }

                                // Quantity là số ngày chênh lệch giữa ngày trả và ngày pickup
                                const quantityDay = Math.max(1, Math.ceil(differenceInDays)); // Đảm bảo quantity ít nhất là 1

                                // Tính tổng giá
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
                                        x` + quantityDay + ` Ngày
                                    </div>
                                    <div style="flex: 1; text-align: center; color: #666; font-size: 14px;">
                                        x` + quantity + ` Xe
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        ₫` + price.toLocaleString() + `/Ngày
                                    </div>
                                    <div style="flex: 1.5; text-align: right;">
                                        <h4 style="margin: 0; font-size: 18px; color: #b59349;">₫` + totalPrice.toLocaleString() + `</h4>
                                    </div>
                                `;

                                formBoxTotal.appendChild(itemContainer);                                  
                            });
                            
                            // Calculator items
                            const  savedAsseccCal = document.querySelectorAll('#savedItemsContainer .form-box');
                            savedAsseccCal.forEach(formBox => {                              
                                // Lấy nội dung từ thẻ h4 và label
                                const selects = formBox.querySelector('.form-check-select');
                                const title = formBox.querySelector('h4') ? formBox.querySelector('h4').textContent : 'Phụ kiện';
                                const priceLabelElement = formBox.querySelector('label[for="daily-checkbox"]');
                                const priceLabel = priceLabelElement ? priceLabelElement.textContent : '0';
                                const quantity = parseInt(selects.value, 10) || 0;
                                let price = 0;

                                if (priceLabel.trim().toLowerCase() !== 'free') {
                                    price = parseInt(priceLabel.replace(/\D/g, ''), 10) || 0;
                                }

                                // Tính tổng giá
                                const totalPrice = quantity * price;
                                totalAmount += totalPrice;

                                // Tạo các thẻ div mới
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
                                        x` + quantity + ` Cái
                                    </div>
                                    <div style="flex: 1; text-align: right; color: #666; font-size: 14px;">
                                        ` + priceLabel + `
                                    </div>
                                    <div style="flex: 1.5; text-align: right;">
                                        <h4 style="margin: 0; font-size: 18px; color: #b59349;">₫` + totalPrice.toLocaleString() + `</h4>
                                    </div>
                                `;

                                formBoxTotal.appendChild(itemContainer);
                                
                            });
                            // Tạo thẻ div item-total và thêm vào cuối savedItemsContainer
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
                                    <span>🎉 Giảm giá voucher:</span>
                                    <span>-₫${appliedDiscount.toLocaleString()}</span>
                                </div>`;
                            }

                            itemTotalContainer.innerHTML = discountHtml +
                                `<div style="display:flex; justify-content:space-between; width: 100%; align-items: center;">
                                    <h4 style="margin: 0; font-size: 18px; color: #333;">Tổng thanh toán:</h4>
                                    <h2 id="dataInput" style="margin: 0; font-size: 26px; color: #b59349; font-weight: 700;">₫`+ finalAmount.toLocaleString() +`</h2>
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

                    if (new Date(returndate.value) <= new Date(pickupdate.value)) {
                        returndate.value = formatDate(pickupdateValue);
                        // Update max of pickupdate based on new returndate
                        const newReturn = new Date(returndate.value);
                        newReturn.setDate(newReturn.getDate() - 1);
                        pickupdate.max = formatDate(newReturn);
                    } else {
                        // Update max of pickupdate based on existing returndate
                        const existingReturn = new Date(returndate.value);
                        existingReturn.setDate(existingReturn.getDate() - 1);
                        pickupdate.max = formatDate(existingReturn);
                    }
                });
                
                returndate.addEventListener('change', () => {
                    const returndateValue = new Date(returndate.value);
                    returndateValue.setDate(returndateValue.getDate() - 1); // Minimum return date is one day after pick-up date
                    pickupdate.max = formatDate(returndateValue);

                    if (new Date(returndate.value) <= new Date(pickupdate.value)) {
                        pickupdate.value = formatDate(returndateValue);
                        // Update min of returndate based on new pickupdate
                        const newPickup = new Date(pickupdate.value);
                        newPickup.setDate(newPickup.getDate() + 1);
                        returndate.min = formatDate(newPickup);
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
                            if (cardTitle) cardTitle.textContent = '✓ Đã chọn: ' + file.name.substring(0, 20) + (file.name.length > 20 ? '...' : '');
                            if (cardSubtitle) cardSubtitle.textContent = 'Nhấn để thay đổi ảnh';

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
                                        clearBtn.title = 'Xóa ảnh';
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
                
                
                // Chuyển các chuỗi ngày thành đối tượng Date
                const pickupDate = new Date(pickupDateText);
                const returnDate = new Date(returnDateText);
                
                console.log(pickupDate);
                console.log(returnDateText);
                
                // Tính số ngày chênh lệch
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
                updateSelectedBikesBanner();
            });
            
           

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
            }


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
            }

            function toggleBikeNextButton() {
                var nextButton = document.querySelector('.wizard .actions a[href="#next"]');
                // Kiểm tra nếu có bất kỳ select box nào có giá trị lớn hơn 0
                var anySelected = $(".form-check-select", "#motorcyclelist").toArray().some(function(select) {
                    return parseInt($(select).val()) > 0;
                });

                // Nếu có ít nhất một select box đã chọn, kích hoạt nút "Next"
                if (anySelected) {
                    nextButton.style.pointerEvents = 'auto';
                    nextButton.style.color = '';
                    nextButton.style.background = ''; nextButton.style.opacity = '1';
                    const checkboxContainer = document.getElementById('protection');
                    // Lấy tất cả các checkbox trong div
                    const checkboxes = checkboxContainer.querySelectorAll('.form-check-select');
                    // Lặp qua từng checkbox và lấy thông tin
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
                updateSelectedBikesBanner();
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
                updateSelectedBikesBanner();

            }
            
            function clearQuantity(motorcycleId) {
                var checkbox = document.getElementById('daily-checkbox-' + motorcycleId);
                var quantityInput = document.getElementById('daily-quantity-' + motorcycleId);              
                checkbox.checked = false;
                checkbox.parentElement.style.borderColor = '';
                quantityInput.value = 0;   
                toggleBikeNextButton();
                updateSelectedBikesBanner();
            }
            
           

        window.addEventListener('message', (event) => {
            if (event.data === 'activateOverlay') {
                const overlay = document.getElementById('overlay');
                overlay.classList.add('active');
//                
//                // Thực hiện các hành động cần thiết tại đây, ví dụ: tắt overlay sau 3 giây
//                setTimeout(() => {
//                    overlay.classList.remove('active');
//                }, 30000000);
            }
            if(event.data === 'stopOverlay') {
                const overlay = document.getElementById('overlay');
                overlay.classList.remove('active');
            }
        });
           // Kiểm tra nếu có dữ liệu nào được gửi từ servlet
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
            // Lặp qua tất cả các phần tử có class "form-box"
            savedItemsContainer.querySelectorAll('.form-box').forEach(box => {
                const select = box.querySelector('.form-check-select');
                const quantity = parseInt(select.value);
                const id = select.id.split('-').pop();  // Lấy accessoryId từ id của select box
                const priceLabel = box.querySelector('.form-check .checkbox-container label');
                const priceText = priceLabel ? priceLabel.textContent : '0';
                let price = 0;
                if (!priceText.includes('Free')) {
                    price = parseInt(priceText.replace(/\D/g, ''), 10);
                }
                // Nếu số lượng lớn hơn 0, thêm vào danh sách
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
        function BookingHandler(dataReturn) {
            var formData = new FormData();
            
//            alert("Thanh toán thành công với mã giao dịch: " + data.txnRef);
             // Lấy các giá trị từ các thẻ <p>
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
            
            
            // Chuyển các chuỗi ngày thành đối tượng Date
            const pickupD = new Date(pickupDate);
            const returnD = new Date(returnDate);

            // Tính số ngày chênh lệch
            const differenceInTime = returnD.getTime() - pickupD.getTime();
            const differenceInDays = differenceInTime / (1000 * 3600 * 24);
            
             // Quantity là số ngày chênh lệch giữa ngày trả và ngày pickup
            const quantityDay = Math.max(1, Math.ceil(differenceInDays));
            
                                        const bikeDetails = [];

            const checkboxMotorContainer = document.getElementById('savedBikeContainer');

            // tất cả các select box trong div
            const selectBoxes = checkboxMotorContainer.querySelectorAll('.form-check-select');

            // Lặp qua từng select box và lấy thông tin nếu giá trị lớn hơn 0
            selectBoxes.forEach(selectBox => {
                const quantity = parseInt(selectBox.value);
                if (quantity > 0) {
                    const formMotorBox = selectBox.closest('.form-box');
                    if (formMotorBox) {
                        const bikeName = formMotorBox.querySelector('.motor-name').textContent;
                        const bikePrice = formMotorBox.querySelector('.price-current').textContent;
                        
                        const priceLabel = selectBox.closest('.form-box').querySelector('.price-current');
                        if (priceLabel) {
                            const dataPrice = priceLabel.getAttribute('data-price');
                            const price = dataPrice ? parseInt(dataPrice) : 0;
                            const totalPrice = quantityDay * price;
                            for (let i = 0; i < quantity; i++) {
                                bikeDetails.push({ name: bikeName, price: totalPrice.toString() });
                            }
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
                amount: dataReturn.amount,
                paymenttime: dataReturn.time,
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
            // Gửi dữ liệu tới servlet bằng AJAX
            $.ajax({
                type: "POST",
                url: "bookinghandler", // Thay đổi URL tới servlet của bạn
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

        // Nếu dữ liệu đã có sẵn trong LocalStorage khi trang được tải lại
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
                msgEl.textContent = 'Vui lòng nhập mã voucher';
                return;
            }
            msgEl.style.color = '#6b7280';
            msgEl.textContent = 'Đang kiểm tra...';

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
                    msgEl.textContent = '✓ Áp dụng thành công! Giảm ₫' + Number(data.discount).toLocaleString('vi-VN')
                        + (data.description ? ' — ' + data.description : '');
                    document.getElementById('apply-voucher-btn').textContent = 'Đã áp dụng';
                    document.getElementById('apply-voucher-btn').style.background = '#16a34a';
                    // Refresh total display
                    const formBoxTotal = document.getElementById('form-box-total');
                    if (formBoxTotal) { formBoxTotal.dispatchEvent(new Event('refresh')); }
                    // Re-trigger total calculation by re-rendering
                    const event4 = new CustomEvent('recalcTotal');
                    document.dispatchEvent(event4);
                } else {
                    msgEl.style.color = '#dc2626';
                    msgEl.textContent = '✗ ' + data.message;
                    resetVoucher();
                }
            })
            .catch(() => {
                msgEl.style.color = '#dc2626';
                msgEl.textContent = 'Lỗi kết nối, vui lòng thử lại';
            });
        }

        function resetVoucher() {
            document.getElementById('applied-voucher-id').value = '0';
            document.getElementById('applied-discount').value = '0';
            const btn = document.getElementById('apply-voucher-btn');
            if (btn) {
                btn.textContent = 'Áp dụng';
                btn.style.background = '#b59349';
            }
        }
        