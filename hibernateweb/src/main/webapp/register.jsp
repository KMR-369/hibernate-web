<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" 
	import="com.wipro.velocity.bookstore.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Success</title>
</head>
<body>
	<jsp:useBean id="r" class="w com.wipro.velocity.bookstore.Us"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />

	<%    
    int i=UserDAO.register(u);
    if(i>0)
    {
        out.print("Successfully Registered");
    }
%>
</body>
</html>