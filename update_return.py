import os

filepath = "src/main/webapp/vnpay_return.jsp"
with open(filepath, 'r', encoding='utf-8') as f:
    content = f.read()

old_script = """                         <script>
                            window.localStorage.setItem('payment_status', JSON.stringify({
                                status: 'success',
                                time: '<%=request.getParameter("vnp_PayDate")%>',
                                txnRef: '<%= request.getParameter("vnp_TxnRef") %>',
                                amount: '<%= request.getParameter("vnp_Amount") %>',
                                orderInfo: '<%= request.getParameter("vnp_OrderInfo") %>'
                            }));
                        </script>"""

new_script = """                         <script>
                            window.localStorage.setItem('payment_status', JSON.stringify({
                                status: 'success',
                                time: '<%=request.getParameter("vnp_PayDate")%>',
                                txnRef: '<%= request.getParameter("vnp_TxnRef") %>',
                                amount: '<%= request.getParameter("vnp_Amount") %>',
                                orderInfo: '<%= request.getParameter("vnp_OrderInfo") %>'
                            }));
                            setTimeout(function() {
                                window.close();
                            }, 3000);
                        </script>"""

content = content.replace(old_script, new_script)

with open(filepath, 'w', encoding='utf-8') as f:
    f.write(content)
print("Updated vnpay_return.jsp")
