<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="WebProject.AudioDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ASMR Player</title>
</head>
<body>
	<%
		//AudioDTO forID = (AudioDTO) request.getServletContext().getAttribute("dto");
		AudioDTO forID = (AudioDTO) request.getSession().getAttribute("dto");
		boolean isloggedin = false;
		if (forID != null) {
			isloggedin = true;
			System.out.print("로그인 O");
		} else
			System.out.print("로그인 X");
	%>

	<jsp:include page="Layout.jsp" flush="true" />
	<jsp:include page="Web_Audio_new.jsp" flush="true" />



	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.1.0.min.js"></script>
	<script type="text/javascript">
	logincheck();
	
	function logincheck(){
		var id = "<%=isloggedin%>";
			if (id == "true") {
				var form = document.getElementById('logout');
				form.style.display = "";
			} else {
				var form = document.getElementById('login');
				form.style.display = "";

			}
		}
	</script>
</body>
</html>