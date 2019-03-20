<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta http-equiv="Content-Type" Content="text/html; charset=utf-8" />

<link rel='stylesheet'
	href='http://fonts.googleapis.com/earlyaccess/nanumpenscript.css'>
<link rel="stylesheet" type="text/css" href="login.css">
<title>로그인</title>
</head>

<body>

	<form class="login" id="loginForm">
		<h1 class="loginTitle">로 그 인</h1>
		<input type="text" class="loginInput" placeholder="아이디 입력" name="id"
			autofocus required> <input type="password" class="loginInput"
			placeholder="비밀번호 입력" name="pw" required>
		<btn> <input type="submit" value="로 그 인" class="submitButton"
			onclick="login()"> <a href="user_add.jsp"> <join
				class="linkButton">회원가입</join>
		</a> </btn>
	</form>

	</form>
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.1.0.min.js"></script>
	<script type="text/javascript">
		setting();
		function setting() {
			$.ajax({
				url : '/WebProject/WebControl',
				type : 'POST',
				data : json_data,
				datatype : "json",
				success : function(data) {
					alert(data);

				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("로그인 에러 발생 \n" + textStatus + " : " + errorThrown);
					// self.close();
				}
			});
		}
		// 로그인 확인
		function login() { 
			var id = $('[name="id"]').val();
			var ps = $('[name="pw"]').val();

			if (id != null && id != "" && ps != null && ps != "") {
				var ArrayData = new Array();
				var Data = new Object();
				Data.Id = id;
				Data.ps = ps;
				ArrayData.push(Data);
				var json_data = {
					jsondata : JSON.stringify(ArrayData)
				}
				$
						.ajax({
							url : '/WebProject/WebControl?action=login',
							type : 'POST',
							data : json_data,
							datatype : "json",
							success : function(data) {
								var boo = data;
								if (boo == "true") {
									next();
								} else {
									alert("ID나 비밀번호를 확인해주세요.");
								}
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("로그인 에러 발생 \n" + textStatus + " : "
										+ errorThrown);
								// self.close();
							}
						});
			} else {
				alert("아이디나 패스워드를 입력해주세요.");
			}
		}
		// 로그인 확인후 메인 화면으로
		function next() {
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");
			form.setAttribute("action", "/WebProject/WebControl?action=login2");
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</body>
</html>