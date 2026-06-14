<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thanh Toán VNPAY</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        body {
            background-color: transparent;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
        }
        .payment-container {
            max-width: 850px;
            margin: 0 auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            overflow: hidden;
            display: flex;
            flex-wrap: wrap;
            border: 1px solid #eef0f4;
        }
        .payment-summary {
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
            padding: 40px 30px;
            flex: 1;
            min-width: 300px;
            border-right: 1px solid #eef0f4;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .payment-form {
            padding: 40px 30px;
            flex: 1.5;
            min-width: 350px;
        }
        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            font-size: 16px;
            color: #475569;
        }
        .summary-total {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 2px dashed #cbd5e1;
            font-size: 18px;
            font-weight: bold;
            color: #0f172a;
        }
        .total-amount {
            color: #b59349;
            font-size: 24px;
        }
        
        /* Custom Radio Card */
        .radio-card {
            position: relative;
            display: block;
            margin-bottom: 15px;
        }
        .radio-card input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }
        .radio-card .card-content {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: #fff;
        }
        .radio-card .card-content:hover {
            border-color: #94a3b8;
            background: #f8fafc;
        }
        .radio-card input:checked ~ .card-content {
            border-color: #b59349;
            background: #fffbeb;
            box-shadow: 0 4px 10px rgba(181, 147, 73, 0.15);
        }
        .radio-card .icon-wrapper {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            background: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            color: #64748b;
            font-size: 20px;
        }
        .radio-card input:checked ~ .card-content .icon-wrapper {
            background: #b59349;
            color: #fff;
        }
        .radio-card .method-name {
            font-weight: 600;
            color: #334155;
            font-size: 16px;
            margin: 0;
        }
        .radio-card .method-desc {
            font-size: 13px;
            color: #64748b;
            margin: 0;
        }
        .radio-card .check-icon {
            margin-left: auto;
            color: #b59349;
            opacity: 0;
            transition: opacity 0.3s;
            font-size: 20px;
        }
        .radio-card input:checked ~ .card-content .check-icon {
            opacity: 1;
        }

        .btn-pay {
            background: linear-gradient(135deg, #b59349 0%, #8c6f32 100%);
            color: white;
            font-weight: bold;
            padding: 14px 20px;
            border-radius: 12px;
            border: none;
            width: 100%;
            font-size: 18px;
            transition: all 0.3s;
            margin-top: 10px;
            box-shadow: 0 4px 15px rgba(181, 147, 73, 0.3);
        }
        .btn-pay:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(181, 147, 73, 0.4);
            color: white;
        }
    </style>
</head>
<body>

    <div class="payment-container">
        <!-- Phần Tóm tắt -->
        <div class="payment-summary">
                          <div class="mb-4 text-center" style="background: #fff0f0; padding: 15px; border-radius: 8px; border: 1px solid #ffcaca;">
                  <h5 style="color: #d32f2f; margin: 0; font-weight: 700; font-size: 16px;">Thời gian thanh toán còn lại</h5>
                  <div id="countdown-timer" style="font-size: 28px; font-weight: 800; color: #d32f2f; margin-top: 5px;">10:00</div>
              </div>
              
              <h4 class="mb-4" style="color: #1e293b; font-weight: 800;">Tóm tắt thanh toán</h4>
            
            <div class="summary-item">
                <span>Tổng tiền xe</span>
                <span id="totalprice" style="font-weight: 600;">0 VND</span>
            </div>
            
            <div class="summary-item">
                <span>Phần trăm cọc</span>
                <span class="badge bg-primary text-white" style="font-size: 14px; padding: 6px 10px; border-radius: 6px;">50%</span>
            </div>

            <div id="container-price">
                <!-- Chỗ cho JS append thêm phần tử nếu cần -->
            </div>
            
            <div class="summary-total">
                <span>Số tiền trả trước (Cọc)</span>
                <span class="total-amount" id="halftotal">0 VND</span>
            </div>
            
            <div class="mt-4 text-center">
                <i class="fas fa-shield-alt" style="color: #10b981; font-size: 24px; margin-bottom: 10px;"></i>
                <p style="font-size: 13px; color: #64748b; margin: 0;">Thanh toán an toàn & bảo mật qua hệ thống VNPAY</p>
            </div>
        </div>

        <!-- Phần Form Chọn Phương Thức -->
        <div class="payment-form">
            <h4 class="mb-4" style="color: #1e293b; font-weight: 800;">Phương thức thanh toán</h4>
            
            <form id="frmCreateOrder">
                <!-- Input ẩn truyền amount -->
                <input id="amount" name="amount" type="number" value="0" style="display: none"/>

                <!-- Phương thức thanh toán -->
                <label class="radio-card">
                    <input type="radio" name="bankCode" value="" checked>
                    <div class="card-content">
                        <div class="icon-wrapper">
                            <i class="fas fa-qrcode"></i>
                        </div>
                        <div>
                            <p class="method-name">Ứng dụng Mobile Banking (VNPAY QR)</p>
                            <p class="method-desc">Quét mã QR qua app ngân hàng</p>
                        </div>
                        <i class="fas fa-check-circle check-icon"></i>
                    </div>
                </label>

                <label class="radio-card">
                    <input type="radio" name="bankCode" value="VNBANK">
                    <div class="card-content">
                        <div class="icon-wrapper">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div>
                            <p class="method-name">Thẻ ATM / Tài khoản nội địa</p>
                            <p class="method-desc">Thanh toán bằng thẻ ngân hàng nội địa</p>
                        </div>
                        <i class="fas fa-check-circle check-icon"></i>
                    </div>
                </label>

                <!-- Ngôn ngữ -->
                <h5 class="mt-4 mb-3" style="color: #334155; font-size: 16px; font-weight: 600;">Ngôn ngữ cổng thanh toán</h5>
                <div class="d-flex gap-3 mb-4">
                    <label class="radio-card flex-fill" style="margin-bottom: 0;">
                        <input type="radio" name="language" value="vn" checked>
                        <div class="card-content" style="padding: 10px 15px;">
                            <img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Flag_of_Vietnam.svg" alt="VN" style="width: 24px; height: 16px; object-fit: cover; border-radius: 2px; margin-right: 10px;">
                            <p class="method-name" style="font-size: 15px;">Tiếng Việt</p>
                        </div>
                    </label>
                    <label class="radio-card flex-fill" style="margin-bottom: 0;">
                        <input type="radio" name="language" value="en">
                        <div class="card-content" style="padding: 10px 15px;">
                            <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" alt="EN" style="width: 24px; height: 16px; object-fit: cover; border-radius: 2px; margin-right: 10px;">
                            <p class="method-name" style="font-size: 15px;">English</p>
                        </div>
                    </label>
                </div>

                <button id="submitBtn" type="submit" class="btn btn-pay">Tiến hành Thanh toán <i class="fas fa-arrow-right ms-2"></i></button>
            </form>
        </div>
    </div>

    <!-- Giữ nguyên Script logic của hệ thống -->
    <script type="text/javascript">
        $("#frmCreateOrder").submit(function () {
            var postData = $("#frmCreateOrder").serialize();
            var submitUrl = "vnpayajax";
            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (x) {
                    if (x.code === '00') {
                        var popUpWidth = 768;
                        var popUpHeight = 600;
                        var popUpLeft = (screen.width - popUpWidth) / 2;
                        var popUpTop = (screen.height - popUpHeight) / 2;
                        var newWindow = window.open(x.data, '_blank', 'width=' + popUpWidth + ',height=' + popUpHeight + ',top=' + popUpTop + ',left=' + popUpLeft);
                        if (newWindow) {
                            newWindow.focus();
                            // Kim tra trng thAi c a c-a s  pop-up
                            var checkPopupClosed = setInterval(function() {
                                if (newWindow.closed) {
                                    clearInterval(checkPopupClosed);
                                    parent.postMessage('stopOverlay', '*');
                                }
                            }, 500); //Kiem tra moi 500ms
                        } else {
                            alert('Trình duyệt của bạn đã chặn pop-up. Vui lòng tắt chặn pop-up và thử lại.');
                        }
                    } else {
                        alert(x.Message);
                    }
                }
            });
            return false;
        });
        
        // Nh-n d_ liu t trang chca iframe
        window.addEventListener('message', (event) => {
            // GAn d_ liu nh-n `c vAo th input
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
                const newDiv = document.createElement('div');
                newDiv.className = 'summary-item';
                const spanLabel = document.createElement('span');
                spanLabel.textContent = 'Đã cọc:';
                newDiv.appendChild(spanLabel);

                listPayment.forEach(amount =>{
                    const spanContent = document.createElement('span');
                    spanContent.className = 'ps-1 font-a';
                    const num = parseFloat(amount)*100;
                    total -= num;
                    spanContent.textContent = "- " + formatCurrency(num);
                    newDiv.appendChild(spanContent);
                });
              
                container.appendChild(newDiv);
                
                const newDivTotal = document.createElement('div');
                newDivTotal.className = 'summary-item';
                
                const spanLabelTotal = document.createElement('span');
                spanLabelTotal.textContent = 'Phần cọc mới:';
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

      <!-- Overlay khi hết hạn -->
      <div id="timeout-overlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.85); z-index: 9999; flex-direction: column; justify-content: center; align-items: center; text-align: center; color: white;">
          <i class="fas fa-clock" style="font-size: 60px; color: #ff4d4f; margin-bottom: 20px;"></i>
          <h2 style="font-weight: 800; margin-bottom: 15px;">Phiên thanh toán đã hết hạn</h2>
          <p style="font-size: 16px; margin-bottom: 30px;">Bạn đã quá 10 phút để thực hiện giao dịch. Vui lòng đặt lại đơn hàng mới.</p>
          <button onclick="parent.location.href='home.jsp'" style="background: #b59349; color: white; border: none; padding: 12px 30px; font-size: 16px; font-weight: bold; border-radius: 8px; cursor: pointer; transition: 0.3s;">Đặt lại từ đầu</button>
      </div>

      <script type="text/javascript">
          // 10 minutes countdown
          var timeInSecs = 10 * 60;
          var ticker = setInterval(function() {
              timeInSecs--;
              var m = Math.floor(timeInSecs / 60);
              var s = timeInSecs % 60;
              document.getElementById("countdown-timer").innerText = 
                  (m < 10 ? "0" : "") + m + ":" + (s < 10 ? "0" : "") + s;
              
              if (timeInSecs <= 0) {
                  clearInterval(ticker);
                  document.getElementById("timeout-overlay").style.display = "flex";
              }
          }, 1000);
      </script>

</body>
</html>
