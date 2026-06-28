<%@page import="com.smartride.dao.AccountDAO"%>
<%@page import="com.smartride.dto.Account"%>
<%
    AccountDAO dao = AccountDAO.getInstance();
    Account acc = dao.getAccountbyID(2); // assuming there's an account 2
    if(acc != null) {
        out.print("Account 2 found: " + acc.getRoleID() + "<br>");
    } else {
        out.print("Account 2 is null<br>");
    }

    Account accSession = (Account) session.getAttribute("account");
    if(accSession != null) {
        out.print("Session account: " + accSession.getAccountId() + " - role: " + accSession.getRoleID() + "<br>");
        Account check = dao.getAccountbyID(accSession.getAccountId());
        out.print("Re-fetch from DB: " + (check != null ? "Found" : "Null") + "<br>");
    } else {
        out.print("Session account is null<br>");
    }
%>
