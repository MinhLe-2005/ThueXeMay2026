package com.smartride.controller;

import com.smartride.constant.SendEmail;
import com.smartride.dao.AccessoryDetailDAO;
import com.smartride.dao.AccountDAO;
import com.smartride.dao.BookingDAO;
import com.smartride.dao.BookingDetailDAO;
import com.smartride.dao.CustomerDAO;
import com.smartride.dao.MotorcycleDetailDAO;
import com.smartride.dao.MotorcycleDAO;
import com.smartride.dao.MotorcycleStatusDAO;
import com.smartride.dao.PaymentDAO;
import com.smartride.dao.PriceListDAO;
import com.smartride.dto.AccessoryDetail;
import com.smartride.dto.Customer;
import com.smartride.util.IdCardVerifier;
import com.smartride.dto.Event;
import com.smartride.dto.Motorcycle;
import com.smartride.dto.PriceList;
import com.smartride.dao.EventDAO;
import com.smartride.util.RentalPricingUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

@WebServlet(name = "BookingInforHander", urlPatterns = {"/bookinghandler"})
@MultipartConfig
public class BookingInforHander extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           HttpSession session = request.getSession();
            String a = (String) session.getAttribute("pickup");
             out.print(a);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    private static final long serialVersionUID = 1L; 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HashMap<String, Object> dataMap = new HashMap<>();
        Part fileFrontPart = null;
        Part fileBackPart = null;
        
        
        
       

         //Initialize FileUploaded with upload directory
//        String uploadPath = getServletContext().getRealPath("/upload");
        FileUploaded fileUploaded = new FileUploaded(getServletContext().getRealPath("/upload"));
        // Initialize FileUploaded with a relative directory path
//        String uploadPath = getServletContext().getInitParameter("UPLOAD_DIRECTORY");
//        String absoluteUploadPath = getServletContext().getRealPath(File.separator + uploadPath);
//        FileUploaded fileUploaded = new FileUploaded(absoluteUploadPath);

        // Process request parts
        for (Part part : request.getParts()) {
            String fieldName = part.getName();
            if (fieldName.equals("fileFront")) {
                fileFrontPart = part;
            } else if (fieldName.equals("fileBack")) {
                fileBackPart = part;
            } else if (fieldName.equals("file")) {
                fileFrontPart = part;
            } else {
                InputStream inputStream = part.getInputStream();
                String value = new BufferedReader(new InputStreamReader(inputStream))
                        .lines().collect(java.util.stream.Collectors.joining("\n"));
                dataMap.put(fieldName, value);
            }
        }
        
        

        // Convert JSON data to HashMap
        Gson gson = new Gson();
         try {
             Type type = new TypeToken<HashMap<String, Object>>() {}.getType();
             dataMap.putAll(gson.fromJson((String) dataMap.get("jsonData"), type));
         } catch (Exception e) {
             e.printStackTrace();
             response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid JSON format");
             return;
         }
         
          //Create or Update Customer
        CustomerDAO daoC = CustomerDAO.getInstance();
        String customerId = (String) dataMap.get("customerId");
        String identityCard = (String) dataMap.get("identityCard");
        String issuedon = (String) dataMap.get("issuedon");
        String expdate = (String) dataMap.get("expdate");
        int accountId = Integer.parseInt((String) dataMap.get("accountId"));
        
        // Save front and back files if present
        String uploadedFilePath = null;
        String custIdStr = customerId.equalsIgnoreCase("Not") ? "Temp" : customerId;
        String filenameFront = "imageIdC" + custIdStr + "_front.jpg";
        String filenameBack = "imageIdC" + custIdStr + "_back.jpg";
        
        String uploadedFrontPath = null;
        String uploadedBackPath = null;
        
        if (fileFrontPart != null) {
            uploadedFrontPath = fileUploaded.handleFileUpload(fileFrontPart, filenameFront);
        }
        if (fileBackPart != null) {
            uploadedBackPath = fileUploaded.handleFileUpload(fileBackPart, filenameBack);
        }
        
        if (uploadedFrontPath != null || uploadedBackPath != null) {
            String fPath = (uploadedFrontPath != null) ? uploadedFrontPath : "";
            String bPath = (uploadedBackPath != null) ? uploadedBackPath : "";
            uploadedFilePath = fPath + "," + bPath;
        }

        if (customerId.equalsIgnoreCase("Not")) {
            if (uploadedFilePath == null) {
                uploadedFilePath = filenameFront + "," + filenameBack;
            }
            daoC.createNewCustomer(identityCard, uploadedFilePath, issuedon, expdate, "CMND/CCCD", 1, accountId);
            int newCustomerId = daoC.getCustomerbyAccountID(accountId).getCustomerId();
            
            String finalFilenameFront = "imageIdC" + newCustomerId + "_front.jpg";
            String finalFilenameBack = "imageIdC" + newCustomerId + "_back.jpg";
            String finalFrontPath = null;
            String finalBackPath = null;
            
            if (fileFrontPart != null) {
                finalFrontPath = fileUploaded.handleFileUpload(fileFrontPart, finalFilenameFront);
            } else {
                finalFrontPath = finalFilenameFront;
            }
            
            if (fileBackPart != null) {
                finalBackPath = fileUploaded.handleFileUpload(fileBackPart, finalFilenameBack);
            } else {
                finalBackPath = finalFilenameBack;
            }
            
            uploadedFilePath = finalFrontPath + "," + finalBackPath;
            daoC.updateCustomer(identityCard, uploadedFilePath, issuedon, expdate, "CMND/CCCD", newCustomerId);
        } else {
            int existingCustomerId = Integer.parseInt(customerId);
            if (uploadedFilePath == null) {
                Customer oldCust = daoC.getCustomerbyAccountID(accountId);
                if (oldCust != null && oldCust.getIdentityCardImage() != null) {
                    uploadedFilePath = oldCust.getIdentityCardImage();
                } else {
                    uploadedFilePath = filenameFront + "," + filenameBack;
                }
            } else {
                Customer oldCust = daoC.getCustomerbyAccountID(accountId);
                String[] oldPaths = (oldCust != null && oldCust.getIdentityCardImage() != null) 
                                    ? oldCust.getIdentityCardImage().split(",") 
                                    : new String[]{"", ""};
                String oldFront = oldPaths.length > 0 ? oldPaths[0] : "";
                String oldBack = oldPaths.length > 1 ? oldPaths[1] : "";
                
                String newFront = (uploadedFrontPath != null) ? uploadedFrontPath : oldFront;
                String newBack = (uploadedBackPath != null) ? uploadedBackPath : oldBack;
                uploadedFilePath = newFront + "," + newBack;
            }
            daoC.updateCustomer(identityCard, uploadedFilePath, issuedon, expdate, "CMND/CCCD", existingCustomerId);
        }
        

        // Process other data from dataMap
        String pickupDate = (String) dataMap.get("pickupDate");
        String pickupLocation = (String) dataMap.get("pickupLocation");
        String returnLocation = (String) dataMap.get("returnLocation");
        String returnDate = (String) dataMap.get("returnDate");
        
        String firstname = (String) dataMap.get("fistname");
        String lastname = (String) dataMap.get("lastname");
        String phone = (String) dataMap.get("phone");
        String email = (String) dataMap.get("email");
        String address = (String) dataMap.get("address");
        String dob = (String) dataMap.get("dob");
        String gender = (String) dataMap.get("gender");
        String total = (String) dataMap.get("total");
        String paymentDate = dataMap.containsKey("paymenttime") ? (String) dataMap.get("paymenttime") : "";
        int amount = dataMap.containsKey("amount") ? Integer.parseInt((String) dataMap.get("amount")) : 0;

        // Get current date and time
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);
        
        //Update Account
        AccountDAO daoA = AccountDAO.getInstance();      
        daoA.update(firstname, lastname, gender, dob, address, phone, email, daoA.getAccountbyID(accountId).getUserName(), accountId);
        
        System.out.println(accountId);
        
        // Generate booking ID
        String bookingid = (String) dataMap.get("bookingId");
        if (bookingid == null || bookingid.isEmpty() || "undefined".equals(bookingid)) {
            bookingid = generateBookingCode();
        }

        // Read voucherID (0 = no voucher)
        int voucherId = 0;
        try {
            String voucherIdStr = (String) dataMap.get("voucherId");
            if (voucherIdStr != null && !voucherIdStr.trim().isEmpty()) {
                voucherId = Integer.parseInt(voucherIdStr.trim());
            }
        } catch (NumberFormatException ignored) {}

        if (voucherId > 0) {
            if (!com.smartride.dao.VoucherDAO.getInstance().isValidVoucher(voucherId)) {
                voucherId = 0;
            }
        }

        // ── AI Auto-verify CCCD (Hard Gatekeeper) ──────────
        try {
            Customer customer = daoC.getCustomerbyAccountID(accountId);
            com.smartride.dto.Account account = AccountDAO.getInstance().getAccountbyID(accountId);
            if (customer != null && account != null) {
                String idCardImages = customer.getIdentityCardImage();
                String firstImage = (idCardImages != null && !idCardImages.trim().isEmpty())
                        ? idCardImages.split(",")[0].trim() : null;
                String storedId   = customer.getIdentityCard();
                String storedName = account.getLastName() + " " + account.getFirstName();
                String webRoot = getServletContext().getRealPath("/");

                IdCardVerifier.VerifyResult vr = IdCardVerifier.verify(
                        firstImage, webRoot, storedId, storedName);

                if (vr.configured && !vr.valid) {
                    // Chặn đứng: Lỗi AI không hợp lệ — trả về chi tiết từng trường
                    StringBuilder errJson = new StringBuilder();
                    errJson.append("{\"status\":\"ai_error\",\"message\":\"Thông tin không khớp với ảnh CCCD/CMND. Vui lòng kiểm tra lại.\",\"fieldErrors\":[");
                    for (int i = 0; i < vr.fieldErrors.size(); i++) {
                        errJson.append("\"").append(vr.fieldErrors.get(i).replace("\"", "\\\"").replace("\\n", " ")).append("\"");
                        if (i < vr.fieldErrors.size() - 1) errJson.append(",");
                    }
                    errJson.append("],");
                    errJson.append("\"ocrId\":\"").append(vr.ocrId != null ? vr.ocrId : "").append("\",");
                    errJson.append("\"ocrName\":\"").append(vr.ocrName != null ? vr.ocrName : "").append("\",");
                    errJson.append("\"ocrDoe\":\"").append(vr.ocrDoe != null ? vr.ocrDoe : "").append("\",");
                    errJson.append("\"idMatch\":").append(vr.idMatch).append(",");
                    errJson.append("\"nameMatch\":").append(vr.nameMatch).append(",");
                    errJson.append("\"doeValid\":").append(vr.doeValid);
                    errJson.append("}");
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().write(errJson.toString());
                    return; // Dừng luồng, không lưu đơn
                }
            }
        } catch (Exception aiEx) {
            System.err.println("[IdCardVerifier] Lỗi khi gọi AI: " + aiEx.getMessage());
        }
        // ───────────────────────────────────────────────────

        // Save booking data to database
        BookingDAO dao = BookingDAO.getInstance();
        dao.addBooking(bookingid, formattedDateTime, pickupDate, returnDate, pickupLocation, returnLocation, voucherId == 0 ? 0 : voucherId, daoC.getCustomerbyAccountID(accountId).getCustomerId());
        
        // Vì AI đã vượt qua (hoặc chưa cấu hình), đơn hàng hợp lệ để được lưu.
        // Trạng thái được set là "Chờ xác nhận" để Admin review và duyệt thủ công.
        dao.updateBookingStatus(bookingid, "Chờ xác nhận");

        // Mark voucher as used
        if (voucherId > 0) {
            com.smartride.dao.VoucherDAO.getInstance().markVoucherUsed(voucherId);
        }



        // Process bike details
        Type bikeListType = new TypeToken<ArrayList<HashMap<String, String>>>() {}.getType();
        ArrayList<HashMap<String, String>> bikeDetails = gson.fromJson(gson.toJson(dataMap.get("bikeDetails")), bikeListType);

        DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String formattedDateString = currentDateTime.format(formatterDate);

        MotorcycleDetailDAO daoMD = MotorcycleDetailDAO.getInstance();
        MotorcycleDAO daoM = MotorcycleDAO.getInstance();
        PriceListDAO daoPrice = PriceListDAO.getInstance();
        MotorcycleStatusDAO daoMS = MotorcycleStatusDAO.getInstance();
        BookingDetailDAO daoBD = BookingDetailDAO.getInstance();
        Event activeEvent = EventDAO.getInstance().getActiveEvent();
        int rentalDays = RentalPricingUtil.calculateRentalDays(pickupDate, returnDate);
        Random random = new Random();
        
        // Map Ä‘á»ƒ lÆ°u sá»‘ lÆ°á»£ng xe theo tÃªn
        LinkedHashMap<String, Integer> bikeCounts = new LinkedHashMap<>();

        for (HashMap<String, String> bikeDetail : bikeDetails) {
            String bikeName = bikeDetail.get("name");
            String motorcycleId = bikeDetail.get("motorcycleId");
            int bikePrice = Integer.parseInt(bikeDetail.get("price"));

            Motorcycle motorcycle = motorcycleId == null ? null : daoM.getMotorcycleByid(motorcycleId);
            if (motorcycle != null) {
                PriceList priceList = daoPrice.getPricingByid(String.valueOf(motorcycle.getPriceListID()));
                if (priceList != null) {
                    double dailyRate = RentalPricingUtil.selectDailyRate(priceList, rentalDays);
                    double eventMultiplier = activeEvent != null && activeEvent.getDiscount() > 0
                            ? 1 - activeEvent.getDiscount() : 1;
                    bikePrice = (int) Math.round(dailyRate * eventMultiplier * rentalDays);
                }
            }

            bikeCounts.put(bikeName, bikeCounts.getOrDefault(bikeName, 0) + 1);
            List<Integer> list = daoMD.getListAvailableMotorcycleDetailIdByMotorcycleName(bikeName);
            int randomElement = list.get(random.nextInt(list.size()));
            daoMS.insertMotorcycleStatus(randomElement, "STAFF00001", "KhÃ´ng cÃ³ sáºµn", formattedDateString, "Chá» nhÃ¢n viÃªn xÃ¡c nháº­n");
            daoBD.addBookingDetail(randomElement, bookingid, bikePrice);
        }

        // Process accessory details
        Type accessoryListType = new TypeToken<ArrayList<HashMap<String, Object>>>() {}.getType();
        ArrayList<HashMap<String, Object>> accessoryDetails = gson.fromJson(gson.toJson(dataMap.get("accessories")), accessoryListType);

        AccessoryDetailDAO daoAD = AccessoryDetailDAO.getInstance();

        for (HashMap<String, Object> accessoryDetail : accessoryDetails) {
            int accessoryId = Integer.parseInt((String) accessoryDetail.get("id"));
            int quantity = Integer.parseInt((String) accessoryDetail.get("quantity"));
            double price = (double) accessoryDetail.get("price");
            daoAD.insert(new AccessoryDetail(bookingid, accessoryId, quantity, price));
        }
        
        // Check if this is just order creation
        String action = request.getParameter("action");
        if ("create_only".equals(action)) {
            String jsonResponse = "{\"status\":\"success\", \"bookingId\":\"" + bookingid + "\"}";
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(jsonResponse);
            return;
        }

        //Payment
        // Äá»‹nh dáº¡ng chuá»—i Ä‘áº§u vÃ o
        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        
        // Chuyá»ƒn Ä‘á»•i chuá»—i thÃ nh LocalDateTime
        LocalDateTime dateTime = LocalDateTime.parse(paymentDate, inputFormatter);
        
        // Ä á»‹nh dáº¡ng chuá»—i Ä‘áº§u ra
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        // Chuyển đổi LocalDateTime thành chuỗi định dạng mới
        String paymentDateText = dateTime.format(outputFormatter);
        PaymentDAO daoP = PaymentDAO.getInstance();
        daoP.addPayment(bookingid, "Ngân hàng", paymentDateText, amount, "Giao dịch thành công");
        
        // Send confirmation email
       StringBuilder emailContent = new StringBuilder();
        emailContent.append("<!DOCTYPE html>\n");
        emailContent.append("<html lang=\"vi\">\n");
        emailContent.append("<head>\n");
        emailContent.append("    <meta charset=\"UTF-8\">\n");
        emailContent.append("    <title>ThÃ´ng tin Ä‘áº·t xe</title>\n");
        emailContent.append("    <style>\n");
        emailContent.append("        body {\n");
        emailContent.append("            font-family: Arial, sans-serif;\n");
        emailContent.append("        }\n");
        emailContent.append("        .container {\n");
        emailContent.append("            max-width: 600px;\n");
        emailContent.append("            margin: 0 auto;\n");
        emailContent.append("            padding: 20px;\n");
        emailContent.append("            border: 1px solid #ddd;\n");
        emailContent.append("            border-radius: 10px;\n");
        emailContent.append("        }\n");
        emailContent.append("        .header {\n");
        emailContent.append("            font-size: 18px;\n");
        emailContent.append("            font-weight: bold;\n");
        emailContent.append("            margin-bottom: 20px;\n");
        emailContent.append("        }\n");
        emailContent.append("        .info, .vehicle-info, .note {\n");
        emailContent.append("            margin-bottom: 20px;\n");
        emailContent.append("        }\n");
        emailContent.append("        .info div, .vehicle-info div {\n");
        emailContent.append("            margin-bottom: 10px;\n");
        emailContent.append("        }\n");
        emailContent.append("        .info div span, .vehicle-info div span {\n");
        emailContent.append("            font-weight: bold;\n");
        emailContent.append("        }\n");
        emailContent.append("        .note ul {\n");
        emailContent.append("            list-style: none;\n");
        emailContent.append("            padding: 0;\n");
        emailContent.append("        }\n");
        emailContent.append("        .note ul li {\n");
        emailContent.append("            margin-bottom: 10px;\n");
        emailContent.append("        }\n");
        emailContent.append("    </style>\n");
        emailContent.append("</head>\n");
        emailContent.append("<body>\n");
        emailContent.append("<div class=\"container\">\n");
        emailContent.append("    <div class=\"header\">ThÃ´ng tin Ä‘áº·t xe cá»§a báº¡n</div>\n");
        emailContent.append("    <div class=\"info\">\n");
        emailContent.append("        <div><span>Há» tÃªn:</span> ").append(firstname).append(" ").append(lastname).append("</div>\n");
        emailContent.append("        <div><span>Sá»‘ Ä‘iá»‡n thoáº¡i:</span> ").append(phone).append("</div>\n");
        emailContent.append("        <div><span>Email:</span> ").append(email).append("</div>\n");
        emailContent.append("        <div><span>NgÃ y nháº­n xe:</span> ").append(pickupDate).append("</div>\n");
        emailContent.append("        <div><span>NgÃ y tráº£ xe:</span> ").append(returnDate).append("</div>\n");
        emailContent.append("        <div><span>Äá»‹a Ä‘iá»ƒm nháº­n xe:</span> ").append(pickupLocation).append("</div>\n");
        emailContent.append("        <div><span>Äá»‹a Ä‘iá»ƒm tráº£ xe:</span> ").append(returnLocation).append("</div>\n");
        emailContent.append("    </div>\n");
        emailContent.append("    <div class=\"vehicle-info\">\n");
        emailContent.append("        <div class=\"header\">ThÃ´ng tin xe:</div>\n");

        // Láº·p qua danh sÃ¡ch xe vÃ  thÃªm thÃ´ng tin vÃ o email
        for (Map.Entry<String, Integer> entry : bikeCounts.entrySet()) {
            String bikeName = entry.getKey();
            int quantity = entry.getValue();
            emailContent.append("        <div><span>TÃªn xe:</span> ").append(bikeName).append("             x").append(quantity).append("</div>\n");
//            emailContent.append("        <div><span>Sá»‘ lÆ°á»£ng:</span> x").append(quantity).append(" VND</div>\n");
        }
        emailContent.append("<div><span>PhÃ­ thuÃª xe dá»± tÃ­nh:</span> ").append(total).append(" VND</div>");
        emailContent.append("    </div>\n");
        emailContent.append("    <div class=\"note\">\n");
        emailContent.append("        <div class=\"header\">LÆ°u Ã½:</div>\n");
        emailContent.append("        <ul>\n");
        emailContent.append("            <li>Vui lÃ²ng mang theo giáº¥y tá» tÃ¹y thÃ¢n khi nháº­n xe.</li>\n");
        emailContent.append("            <li>Kiá»ƒm tra ká»¹ thÃ´ng tin xe trÆ°á»›c khi nháº­n.</li>\n");
        emailContent.append("            <li>LiÃªn há»‡ vá»›i chÃºng tÃ´i náº¿u cÃ³ báº¥t ká»³ tháº¯c máº¯c nÃ o.</li>\n");
        emailContent.append("        </ul>\n");
        emailContent.append("    </div>\n");
        emailContent.append("</div>\n");
        emailContent.append("</body>\n");
        emailContent.append("</html>\n");
        SendEmail.sendVerificationEmail(email, emailContent.toString());

        // Set the response content type
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(gson.toJson(dataMap));
//        response.sendRedirect("index.jsp");
    }

    private String generateBookingCode() {
          //Khá»Ÿi táº¡o má»™t Ä‘á»‘i tÆ°á»£ng Random
        Random random = new Random();

        // Sinh ra 6 sá»‘ ngáº«u nhiÃªn tá»« 0 Ä‘áº¿n 999999
        int randomNumber = random.nextInt(1000000);

        // Format sá»‘ ngáº«u nhiÃªn thÃ nh chuá»—i, thÃªm vÃ o "BOOK"
        String bookingCode = "BOOK" + String.format("%06d", randomNumber);

        return bookingCode;
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
