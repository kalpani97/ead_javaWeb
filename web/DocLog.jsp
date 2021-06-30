

<%@page import="com.util.Validate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
        <% 
        String did = request.getParameter("id");
        String dpassword = request.getParameter("password");
        
        boolean IsValid = Validate.ValidateUser(did, dpassword);
        
        if(IsValid)
        { 
        %>
        
        <jsp:forward page="DUpdateIndex.jsp">
        <jsp:param name="uname" value="<%=did%>" />
        </jsp:forward>
        
        <%
         }else{
        %>
       
        <%="<h3>User ID or Password Incorrect. Please Try Again!</h3>"%>
        <jsp:include page="DLog.jsp"/>
        <% 
            }
        
        %>  
</html>
