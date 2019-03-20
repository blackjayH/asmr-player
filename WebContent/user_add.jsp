<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet'
	href='http://fonts.googleapis.com/earlyaccess/nanumpenscript.css'>
<link rel="stylesheet" type="text/css" href="login.css">

<title>회원가입</title>

</head>
<body>
	<form class="login" id="loginForm">
		<h1 class="loginTitle">회 원 가 입</h1>
		<input type="text" class="loginInput" placeholder="아이디 입력" name="id"
			autofocus required> <a href="#.html">
			<div class="checkButton" onclick="check()">아이디 중복확인</div>
		</a> <input type="password" class="loginInput" placeholder="비밀번호 입력"
			name="pw" required> <input type="password" class="loginInput"
			placeholder="비밀번호 확인" name="pwhint" required>

		<btn> <input type="button" value="회원 가입" class="submitButton"
			onclick="submits()"> </btn>
	</form>

	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.1.0.min.js"></script>
	<script type="text/javascript">
		var flag = false;
		// 아이디 중복확인
		function check() {
			var id = $('[name="id"]').val();
			if (id != null && id != "") {
				var ArrayData = new Array();
				var Data = new Object();
				Data.Id = id;
				ArrayData.push(Data);
				var json_data = {
					jsondata : JSON.stringify(ArrayData)
				}
				$
						.ajax({
							url : '/WebProject/WebControl?action=checkID',
							type : 'POST',
							data : json_data,
							datatype : "json",
							success : function(data) {
								var boo = data;
								if (boo == "true") {
									alert("중복되는 아이디가 없습니다.");
									flag = true;

								} else {
									alert("이미 사용되고 있는 ID입니다.");
									flag = false;
								}
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("로그인 에러 발생 \n" + textStatus + " : "
										+ errorThrown);
								// self.close();
							}
						});
			} else {
				alert("아이디를 입력해주세요.");
			}

		}
		// 회원가입
		function submits() {
			var id = $('[name="id"]').val();
			var pass = $('[name="pw"]').val();
			var pass2 = $('[name="pwhint"]').val();

			if (id == null || id == "") {
				alert("ID를 입력해주세요.");
			} else if (pass == null || pass == "") {
				alert("패스워드를 입력해주세요.");
			} else if (pass2 == null || pass2 == "") {
				alert("패스워드 확인을 입력해주세요.");
			} else if (pass != pass2) {
				alert("패스워드가 다릅니다.");
			} else if (flag == false) {
				alert("중복 확인을 해주세요.");
			} else {
				var obj1 = document.getElementsByName('id')[0].value;
				var obj2 = document.getElementsByName('pw')[0].value;
				var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post");
				form.setAttribute("action",
						"/WebProject/WebControl?action=add_user");

				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "Id");
				hiddenField.setAttribute("value", obj1);
				form.appendChild(hiddenField);
				hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "pass");
				hiddenField.setAttribute("value", obj2);
				form.appendChild(hiddenField);

				document.body.appendChild(form);

				form.submit();

			}
		}
	</script>
</body>
</html>