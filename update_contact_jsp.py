import re

with open('src/main/webapp/contact.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

old_form_start = """                            <div class="contact-form-container">
                                <form action="contact" method="post" class="contact-form">
                                    <div class="row">"""

new_form_start = """                            <div class="contact-form-container">
                                <c:if test="${not empty errorMsg}">
                                    <div class="alert alert-danger" style="border-radius: 10px; background-color: #fdf2f2; color: #d9534f; border: 1px solid #f2dede; padding: 15px; margin-bottom: 25px; font-size: 0.95rem;">
                                        <i class="fas fa-exclamation-triangle" style="margin-right: 8px;"></i> ${errorMsg}
                                    </div>
                                </c:if>
                                <form action="contact" method="post" class="contact-form">
                                    <!-- Honeypot field for spam prevention -->
                                    <div style="display:none; visibility:hidden;">
                                        <input type="text" name="website_url_honeypot" value="" autocomplete="off" tabindex="-1">
                                    </div>
                                    
                                    <div class="row">"""

content = content.replace(old_form_start, new_form_start)

with open('src/main/webapp/contact.jsp', 'w', encoding='utf-8') as f:
    f.write(content)
