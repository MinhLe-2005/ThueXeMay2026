# 🎨 Loading Screen - SmartRide

## Giới thiệu

Loading screen với logo SmartRide nhảy nhảy (bounce animation) giống RoomieMatch, tạo trải nghiệm người dùng mượt mà và chuyên nghiệp.

## ✨ Tính năng

- **Logo bounce animation** - Logo nhảy lên xuống mượt mà
- **Glow effect** - Hiệu ứng phát sáng xung quanh logo
- **Spinner** - Vòng xoay loading
- **Auto hide** - Tự động ẩn khi trang load xong
- **Responsive** - Hoạt động tốt trên mọi thiết bị
- **Timeout fallback** - Tự động ẩn sau 10 giây nếu trang load chậm

## 📦 Cài đặt

### 1. File đã tạo:
```
includes/loading.jsp
```

### 2. Đã thêm vào các trang:
- ✅ `manageBooking.jsp` (Staff)
- ✅ `homeStaff.jsp` (Staff)
- ✅ `home.jsp` (Customer)

### 3. Để thêm vào trang khác:

Thêm dòng này ngay sau thẻ `<body>`:

```jsp
<body>
    <!-- Loading Screen -->
    <jsp:include page="/includes/loading.jsp" />
    
    <!-- Nội dung trang của bạn -->
</body>
```

## 🎬 Animations

### 1. **Bounce Animation**
Logo nhảy lên xuống:
```css
@keyframes bounce {
    0%, 100% { transform: translateY(0) scale(1); }
    50% { transform: translateY(-20px) scale(1.05); }
}
```

### 2. **Pulse Animation**
Vòng tròn xung quanh logo:
```css
@keyframes pulse {
    0%, 100% { opacity: 0.3; transform: scale(1); }
    50% { opacity: 0.6; transform: scale(1.1); }
}
```

### 3. **Spin Animation**
Vòng xoay loading:
```css
@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
```

### 4. **Glow Animation**
Hiệu ứng phát sáng text:
```css
@keyframes glow {
    0%, 100% { text-shadow: 0 0 30px rgba(184, 146, 40, 0.5); }
    50% { text-shadow: 0 0 50px rgba(184, 146, 40, 0.8); }
}
```

## ⚙️ Tuỳ chỉnh

### Thay đổi thời gian bounce:
```css
animation: bounce 1.5s ease-in-out infinite;
                   ^^^^ thay đổi giá trị này
```

### Thay đổi màu sắc:
```css
--sr-gold: #b89228;  /* Màu vàng chủ đạo */
```

### Thay đổi thời gian auto-hide:
```javascript
setTimeout(function() {
    // Code ẩn loading
}, 300);  // 300ms - thay đổi giá trị này
```

### Thay đổi timeout fallback:
```javascript
setTimeout(function() {
    // Code ẩn loading nếu quá lâu
}, 10000);  // 10 seconds - thay đổi giá trị này
```

## 🎨 Màu sắc sử dụng

- **Background**: `linear-gradient(135deg, #0f1115 0%, #1a1d24 100%)`
- **Gold Primary**: `#b89228`
- **Gold Glow**: `rgba(184, 146, 40, 0.6)`
- **White**: `#ffffff`
- **Text Muted**: `rgba(255, 255, 255, 0.6)`

## 📱 Responsive

### Desktop:
- Logo size: `120px x 120px`
- Brand name: `32px`
- Spinner: `60px x 60px`

### Mobile (<768px):
- Logo size: `100px x 100px`
- Brand name: `28px`
- Spinner: `50px x 50px`

## 🚀 Tối ưu hoá

### 1. Giảm thời gian loading:
- Optimize images
- Minify CSS/JS
- Enable gzip compression
- Use CDN

### 2. Lazy loading:
- Load resources theo nhu cầu
- Defer non-critical CSS/JS

### 3. Preload quan trọng:
```html
<link rel="preload" href="images/newlogo_transparent.png" as="image">
```

## 🐛 Troubleshooting

### Loading không ẩn:
1. Kiểm tra Console (F12) xem có lỗi JS không
2. Verify file `loading.jsp` đã được include đúng
3. Check network tab xem các resources có load đủ không

### Animation không mượt:
1. Enable hardware acceleration:
```css
transform: translateZ(0);
will-change: transform;
```

### Logo không hiển thị:
1. Check đường dẫn: `images/newlogo_transparent.png`
2. Verify file tồn tại
3. Check browser console

## 💡 Tips

1. **Thêm loading cho AJAX**: Dùng JavaScript để show/hide loading khi gọi AJAX
2. **Custom cho từng trang**: Có thể tạo variants khác nhau của loading
3. **Add progress bar**: Có thể thêm progress bar để hiển thị % loading
4. **Sound effects**: Có thể thêm âm thanh nhẹ khi loading

## 📝 Example Usage

### Thêm vào trang staff:
```jsp
<body>
    <jsp:include page="/includes/loading.jsp" />
    <jsp:include page="/includes/staff/header-staff.jsp" />
    <jsp:include page="/includes/staff/sidebar.jsp" />
    <!-- Content -->
</body>
```

### Thêm vào trang customer:
```jsp
<body>
    <jsp:include page="/includes/loading.jsp" />
    <jsp:include page="/includes/customer/navbar.jsp" />
    <!-- Content -->
</body>
```

## 🎯 Browser Support

- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+
- ✅ Mobile browsers

## 📄 License

Part of SmartRide Motorcycle Booking System

---

**Made with ❤️ for SmartRide**
