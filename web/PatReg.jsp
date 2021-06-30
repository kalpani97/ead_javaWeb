

<%@page import="com.util.Validate2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>  
    <%
        String pid = request.getParameter("nic");
        String ppassword = request.getParameter("password");

        boolean IsValid = Validate2.ValidateUser(pid, ppassword);

        if (IsValid) {
    %>

    <jsp:forward page="PUpdateIndex.jsp">
        <jsp:param name="uname" value="<%=pid%>" />
    </jsp:forward>

    <%
    } else {
    %>

    <%="<h3>User ID or Password Incorrect. Please Try Again!</h3>"%>
    <jsp:include page="PLog.jsp"/>
    <%
        }

    %>  
</html>
