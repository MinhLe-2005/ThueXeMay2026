<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link href="assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="assets/jumbotron-narrow.css" rel="stylesheet"> 
        
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet"> 
        <link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" rel="stylesheet"> 
       
        <script src="assets/jquery-1.11.3.min.js"></script>
        <style>
            .table-responsive{
                width: 52%;
                background: #F9F9F9;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
                padding: 27px;
                /*                margin: 20px auto;*/
            }
            .box{
                display: flex;
                justify-content: center;
                padding: 0 3px;
            }
            .form-control-plaintext {
                /*            margin-bottom: 10px;*/
                font-size: 20px;
                color: #555;
                font-weight: bold;

            }


            .btn-default {
                background: linear-gradient(243.4deg, rgb(0, 132, 255) 13%, rgb(8, 126, 120) 98%);
                color: white;
                border: none;
                width: 100%;
                padding: 10px;
            }
            .btn-default:hover {
                background-color: #0056b3;
            }
            .form-section {
                margin-bottom: 20px;
                display: flex;
                width: 100%;
                justify-content: space-between;
                font-size: 25px;
            }
            .form-radio{
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #f9f9f9;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                width: 100%;
                height: 45px;
                margin-bottom: 15px;
            }

            .container {
                margin: 20px auto;
                width: 800px;
                padding: 30px;
                background-color: white !important;
            }

            .card.box1 {
                width: 350px;
                height: 445px;
                background-color: #effaf4;
                color: #001973;
                border-radius: 0;
            }

            .card.box2 {
                width: 450px;
                height: 500px;
                background-color: #ffffff;
                border-radius: 0
            }

            .text {
                font-size: 13px
            }

            .box2 .btn.btn-primary.bar {
                width: 20px;
                background-color: transparent;
                border: none;
                color: #3ecc6d
            }

            .box2 .btn.btn-primary.bar:hover {
                color: #baf0c3
            }

            .box1 .btn.btn-primary {
                background-color: #57c97d;
                width: 45px;
                height: 45px;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 1px solid #ddd
            }

            .box1 .btn.btn-primary:hover {
                background-color: #f6f8f7;
                color: #57c97d
            }

            .btn.btn-success {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #ddd;
                color: black;
                display: flex;
                justify-content: center;
                align-items: center;
                border: none
            }

            .nav.nav-tabs {
                border: none;
                border-bottom: 2px solid #ddd
            }

            .nav.nav-tabs .nav-item .nav-link {
                border: none;
                color: black;
                border-bottom: 2px solid transparent;
                font-size: 14px
            }

            .nav.nav-tabs .nav-item .nav-link:hover {
                border-bottom: 2px solid #3ecc6d;
                color: #05cf48
            }

            .nav.nav-tabs .nav-item .nav-link.active {
                border: none;
                border-bottom: 2px solid #3ecc6d
            }

            .form-control {
                border: none;
                border-bottom: 1px solid #ddd;
                box-shadow: none;
                height: 20px;
                font-weight: 600;
                font-size: 14px;
                padding: 15px 0px;
                letter-spacing: 1.5px;
                border-radius: 0
            }

            .inputWithIcon {
                position: relative
            }

            img {
                width: 50px;
                height: 20px;
                object-fit: cover
            }

            .inputWithIcon span {
                position: absolute;
                right: 0px;
                bottom: 9px;
                color: #57c97d;
                cursor: pointer;
                transition: 0.3s;
                font-size: 14px
            }

            .form-control:focus {
                box-shadow: none;
                border-bottom: 1px solid #ddd
            }

            .btn-outline-primary {
                color: black;
                background-color: #ddd;
                border: 1px solid #ddd
            }

            .btn-outline-primary:hover {
                background-color: #05cf48;
                border: 1px solid #ddd
            }

            .btn-check:active+.btn-outline-primary,
            .btn-check:checked+.btn-outline-primary,
            .btn-outline-primary.active,
            .btn-outline-primary.dropdown-toggle.show,
            .btn-outline-primary:active {
                color: #baf0c3;
                background-color: #3ecc6d;
                box-shadow: none;
                border: 1px solid #ddd
            }

            .btn-group>.btn-group:not(:last-child)>.btn,
            .btn-group>.btn:not(:last-child):not(.dropdown-toggle),
            .btn-group>.btn-group:not(:first-child)>.btn,
            .btn-group>.btn:nth-child(n+3),
            .btn-group>:not(.btn-check)+.btn {
                border-radius: 50px;
                margin-right: 20px
            }

            form {
                font-size: 14px
            }
            
            .font-text {
                font-size: 14px
            }

            form .btn.btn-primary {
                width: 100%;
                height: 45px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                background-color: #3ecc6d;
                border: 1px solid #ddd
            }

            form .btn.btn-primary:hover {
                background-color: #05cf48
            }

            @media (max-width:750px) {
                .container {
                    padding: 10px;
                    width: 100%
                }

                .text-green {
                    font-size: 14px
                }

                .card.box1,
                .card.box2 {
                    width: 100%
                }

                .nav.nav-tabs .nav-item .nav-link {
                    font-size: 12px
                }
                
                
            }
            .font-a{
                    font-size: 18px;
            }

            .container{
                margin: 0px auto;
                width: 800px;
                padding: 0px;
            }
        </style>
    </head>

    <body style="background: white;">
        <div class="container bg-light d-md-flex align-items-center">
            <div class="card box1 shadow-sm p-md-5 p-4">
                <div class="fw-bolder mb-4">
                    <span class="ps-1 font-a" id="totalprice">₫1,000,000 VND</span>
                </div>
                <div class="d-flex flex-column" >
                    <div class="d-flex align-items-center justify-content-between text">
                        <span class="">% cọc:</span>
                        <span class="ps-1 font-a">50%</span></span>
                    </div>
                    <div class="d-flex align-items-center justify-content-between text mb-4" style="border-top: solid; margin-top: 5px; padding-top: 5px;">
                        <span>Trả trước:</span>
                        <span class="ps-1 font-a" id="halftotal">₫500,000 VND</span></span>
                    </div>
                    <div id="container-price">
                        
                    </div>
                </div>
            </div>
            <div class="card box2 shadow-sm">
                <div class="d-flex align-items-center justify-content-between p-md-5 p-4">
                    <span class="font-text h5 fw-bold m-0">Thanh toán</span>
                    <div class="btn btn-primary bar"><span class="fas fa-bars"></span></div>
                </div>
                
                <form style="padding: 0 20px" id="frmCreateOrder">        


                    <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="10000"  style="display: none"/>



                    <h4>Chọn phương thức thanh toán</h4>
                    <div class="form-group">
                        <!--                        <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>-->
                        <div class="form-radio">
                            <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                            <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>
                        </div>


                        <!--                       <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>-->
                      
                        <div class="form-radio">
                            <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                            <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>
                        </div>
                        <!--                       <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                                               <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>-->

                    </div>
                    <div class="form-group">
                        <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                        <div class="form-radio">
                            <input type="radio" id="language" Checked="True" name="language" value="vn">
                            <label for="language">Tiếng Việt</label><br>
                        </div>
                        <div class="form-radio">
                            <input type="radio" id="language" name="language" value="en">
                            <label for="language">Tiếng Anh</label><br>
                        </div>

                    </div>
                    <button id="submitBtn" type="submit" class="font-text btn btn-default">Thanh toán</button>
                </form>
            </div>
        </div>
<!--        <div class="box" >
            <div>

            </div>
            <div class="table-responsive" >
                <form id="frmCreateOrder">        


                    <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." data-val-required="The Amount field is required." id="amount" max="100000000" min="1" name="amount" type="number" value="10000"  style="display: none"/>



                    <h4>Chọn phương thức thanh toán</h4>
                    <div class="form-group">
                                                <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                        <div class="form-radio">
                            <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                            <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>
                        </div>


                                               <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                        <div class="form-radio">
                            <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                            <label for="bankCode">Thanh toán bằng mã VNPAYQR</label><br>
                        </div>
                        <div class="form-radio">
                            <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                            <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>
                        </div>
                                               <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                                               <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>

                    </div>
                    <div class="form-group">
                        <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                        <div class="form-radio">
                            <input type="radio" id="language" Checked="True" name="language" value="vn">
                            <label for="language">Tiếng Việt</label><br>
                        </div>
                        <div class="form-radio">
                            <input type="radio" id="language" name="language" value="en">
                            <label for="language">Tiếng Anh</label><br>
                        </div>

                    </div>
                    <button type="submit" class="btn btn-default">Thanh toán</button>
                </form>
            </div>
            <div class="" style="width: 40%; margin: 50px 0;" >
                <div class="form-group form-section">
                    <span>Cọc 50%</span>
                    <h1 id="amount" class="form-control-plaintext">2,000,000 VND</h1>
                </div>


                <div class="form-group form-section">

                    <a id="finalAmount" class="form-control-plaintext">1,000,000 VND</a>
                </div>

            </div>
        </div>-->

        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
            $("#frmCreateOrder").submit(function () {
                var postData = $("#frmCreateOrder").serialize();
//                var submitUrl = $("#frmCreateOrder").attr("action");
                var submitUrl = "vnpayajax";
                $.ajax({
                    type: "POST",
                    url: submitUrl,
                    data: postData,
                    dataType: 'JSON',
                    success: function (x) {
                        if (x.code === '00') {
//                            var newWindow = window.open(x.data, '_blank');
//                            if (newWindow) {
//                                newWindow.focus();
//                            } else {
//                                alert('Trình duyệt của bạn đã chặn pop-up. Vui lòng tắt trình chặn pop-up và thử lại.');
//                            }
                            
                           

                            var popUpWidth = 768;
                            var popUpHeight = 600;
                            var popUpLeft = (screen.width - popUpWidth) / 2;
                            var popUpTop = (screen.height - popUpHeight) / 2;
                            var newWindow = window.open(x.data, '_blank', 'width=' + popUpWidth + ',height=' + popUpHeight + ',top=' + popUpTop + ',left=' + popUpLeft);
                            if (newWindow) {
                                newWindow.focus();
                                // Kiểm tra trạng thái của cửa sổ pop-up
                                var checkPopupClosed = setInterval(function() {
                                    if (newWindow.closed) {
                                        clearInterval(checkPopupClosed);
                                        parent.postMessage('stopOverlay', '*');
                                    }
                                }, 500); //Kiem tra moi 500ms
                            } else {
                                alert('Trình duyệt của bạn đã chặn pop-up. Vui lòng tắt trình chặn pop-up và thử lại.');
                            }
                        } else {
                            alert(x.Message);
                        }
                    }
                });
                return false;
            });
            // Nhận dữ liệu từ trang chứa iframe
            window.addEventListener('message', (event) => {
                // Gán dữ liệu nhận được vào thẻ input
                const receivedDataInput = document.getElementById('amount');
                const data = parseFloat(event.data.dataTotal);
                document.getElementById("totalprice").textContent = "₫" + data.toLocaleString() + " VND";
                
                let total;
                if (!isNaN(data)) {
                    const halfAmount = Math.round(data / 2);
                    receivedDataInput.value = halfAmount;
                    total = halfAmount;
                    document.getElementById("halftotal").textContent = "₫" + halfAmount.toLocaleString() + " VND";
                }
                
                const formatCurrency = (number) => {
                    return '₫' + number.toLocaleString() + ' VND';
                };
                const container = document.getElementById('container-price');
                container.innerHTML = '';
                const listPayment = event.data.dataPayment;
                
                if(listPayment){
                    // Tạo thẻ div mới
                    const newDiv = document.createElement('div');
                    newDiv.className = 'd-flex align-items-center justify-content-between text';


                    const spanLabel = document.createElement('span');
                    spanLabel.textContent = 'Đã cọc:';
                    newDiv.appendChild(spanLabel);

                    listPayment.forEach(amount =>{
                          // Tạo thẻ span đầu tiên
                   
                    // Tạo thẻ span thứ hai
                        const spanContent = document.createElement('span');
                        spanContent.className = 'ps-1 font-a';
                        const num = parseFloat(amount)*100;
                        total -= num;
                        spanContent.textContent = "- " + formatCurrency(num);
                        
                        // Thêm các thẻ span vào thẻ div mới

                        newDiv.appendChild(spanContent);
                        
                    });
                  

                    // Thêm thẻ div mới vào container
                    container.appendChild(newDiv);
                    
                    const newDivTotal = document.createElement('div');
                    newDivTotal.className = 'd-flex align-items-center justify-content-between text mb-4';
                    newDivTotal.style.borderTop = 'solid';
                    newDivTotal.style.marginTop = '5px';
                    newDivTotal.style.paddingTop = '5px';
                    
                    const spanLabelTotal = document.createElement('span');
                    spanLabelTotal.textContent = 'Phí cọc mới:';
                    newDivTotal.appendChild(spanLabelTotal);
                    
                    const spanContentTotal = document.createElement('span');
                    spanContentTotal.className = 'ps-1 font-a';
                    spanContentTotal.textContent = formatCurrency(total);
                    
                    newDivTotal.appendChild(spanContentTotal);
                    
                    container.appendChild(newDivTotal);
                    receivedDataInput.value = total;
                }
                
            });
            
            document.getElementById('submitBtn').addEventListener('click', function() {
               parent.postMessage('activateOverlay', '*');
            });
        </script>       
    </body>
</html>
