# -*- coding: utf-8 -*-
import re

with open('src/main/webapp/manageBooking.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. Add imports
content = re.sub(
    r'(<%@page import="com\.smartride\.dto\.Account"%>)',
    r'\1\n<%@page import="com.smartride.dao.CustomerDAO"%>\n<%@page import="com.smartride.dto.Customer"%>',
    content
)

# 2. Add customer fetch
acc_fetch = """com.smartride.dto.Account acc = com.smartride.dao.AccountDAO.getInstance().getAccountbyCustomerId(b.getCustomerID());
                                                        pageContext.setAttribute("acc", acc);"""
cus_fetch = """com.smartride.dto.Account acc = com.smartride.dao.AccountDAO.getInstance().getAccountbyCustomerId(b.getCustomerID());
                                                        pageContext.setAttribute("acc", acc);
                                                        com.smartride.dto.Customer cus = com.smartride.dao.CustomerDAO.getInstance().getCustomerById(b.getCustomerID());
                                                        pageContext.setAttribute("cus", cus);"""
content = content.replace(acc_fetch, cus_fetch)

# 3. Add data attributes to row button
content = content.replace(
    'data-cusEmail="${acc.email}"',
    'data-cusEmail="${acc.email}"\n                                                                            data-cusIdCard="${cus.identityCardImage}"'
)

# 4. Add data attribute parsing in showDetail
content = content.replace(
    "modal.find('#modal-customerId').attr('data-cusEmail', button.getAttribute('data-cusEmail'));",
    "modal.find('#modal-customerId').attr('data-cusEmail', button.getAttribute('data-cusEmail'));\n            modal.find('#modal-customerId').attr('data-cusIdCard', button.getAttribute('data-cusIdCard'));"
)

# 5. Add UI to customer modal
modal_html = """                                  <div style="margin-bottom: 0px;"><strong style="color: #64748b; font-weight: 600;">Email:</strong> <span id="cinfo-email" style="color: #0f172a; font-weight: 600;"></span></div>
                              </div>"""
new_modal_html = """                                  <div style="margin-bottom: 12px;"><strong style="color: #64748b; font-weight: 600;">Email:</strong> <span id="cinfo-email" style="color: #0f172a; font-weight: 600;"></span></div>
                                  <div>
                                      <strong style="color: #64748b; font-weight: 600; display: block; margin-bottom: 8px;">Căn cước / Giấy tờ:</strong>
                                      <div id="cinfo-idcards" style="display: flex; gap: 8px; justify-content: center;">
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>

                  <!-- Image Viewer Modal -->
                  <div class="modal fade" id="image-viewer-modal" tabindex="-1" role="dialog" aria-hidden="true" style="z-index: 1060;">
                      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                          <div class="modal-content" style="background: transparent; border: none; box-shadow: none;">
                              <div class="modal-body text-center p-0" style="position: relative;">
                                  <button type="button" class="close" onclick="$('#image-viewer-modal').modal('hide')" style="position: absolute; top: -30px; right: 0; background: transparent; border: none; font-size: 30px; color: #fff; text-shadow: 0 2px 4px rgba(0,0,0,0.5); z-index: 10;">
                                      <span aria-hidden="true">&times;</span>
                                  </button>
                                  <img id="image-viewer-modal-img" src="" style="max-width: 100%; max-height: 85vh; border-radius: 8px; box-shadow: 0 10px 25px rgba(0,0,0,0.2);">
                              </div>"""
content = content.replace(modal_html, new_modal_html)

# 6. Update openCustomerModal JS
old_js = """        function openCustomerModal() {
            var cusName = $('#modal-customerId').attr('data-cusName');
            var cusPhone = $('#modal-customerId').attr('data-cusPhone');
            var cusEmail = $('#modal-customerId').attr('data-cusEmail');
            $('#cinfo-name').text(cusName);
            $('#cinfo-phone').text(cusPhone);
            $('#cinfo-email').text(cusEmail);
            $('#customer-info-modal').modal('show');
        }"""
new_js = """        function viewImageFull(src) {
            $('#image-viewer-modal-img').attr('src', src);
            $('#image-viewer-modal').modal('show');
        }

        function openCustomerModal() {
            var cusName = $('#modal-customerId').attr('data-cusName');
            var cusPhone = $('#modal-customerId').attr('data-cusPhone');
            var cusEmail = $('#modal-customerId').attr('data-cusEmail');
            var cusIdCard = $('#modal-customerId').attr('data-cusIdCard');
            $('#cinfo-name').text(cusName);
            $('#cinfo-phone').text(cusPhone);
            $('#cinfo-email').text(cusEmail);
            
            var idCardHtml = '';
            if (cusIdCard && cusIdCard.trim() !== '') {
                var images = cusIdCard.split(',');
                images.forEach(function(img) {
                    if(img.trim() !== '') {
                        var imgSrc = "upload/" + img.trim();
                        idCardHtml += `<div style="flex: 1; text-align: center; cursor: pointer; border-radius: 8px; overflow: hidden; border: 1px solid #e2e8f0; margin: 0 4px;" onclick="viewImageFull('${imgSrc}')">
                                           <img src="${imgSrc}" style="width: 100%; height: 100px; object-fit: cover; transition: transform 0.2s;" onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'">
                                       </div>`;
                    }
                });
            } else {
                idCardHtml = '<span style="color: #94a3b8; font-style: italic; font-size: 13px;">Chưa có ảnh xác thực</span>';
            }
            $('#cinfo-idcards').html(idCardHtml);
            
            $('#customer-info-modal').modal('show');
        }"""
content = content.replace(old_js, new_js)

with open('src/main/webapp/manageBooking.jsp', 'w', encoding='utf-8') as f:
    f.write(content)

print("Updated manageBooking.jsp")
