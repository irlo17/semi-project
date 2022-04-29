<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	
	<style type="text/css">
	head,body {
	background: black;
	
	}
	
	img {
 	display: block;
    margin-top: 24%;
    width: 5rem;
    z-index: 10;
    margin-left: 48%;
	}
	
	</style>
	

</head>
<body>

	<%
			int shopNumber= Integer.valueOf(request.getParameter("shopNumber"));
		
	//response.sendRedirect("listingDetails.do?shopNumber="+shopNumber	);
	response.addHeader("Refresh", "4; url = listingDetails.do?shopNumber="+shopNumber);
	
	%> 
		<%--  <jsp:forward page="listingDetails.do"/> --%>
	
		
		<img alt="" src="resources/pageSpinner/realSpinner.gif"/>
		
</body>
</html>