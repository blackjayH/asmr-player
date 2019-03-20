<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="WebProject.AudioDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="black">

	<!--  이하 각 재생 버튼 아이콘들   -->
	<!--  play(x)로 이벤트 연결 x가 10의 배수인 이유는 나중에 벌레소리(10) 벌레소리2(11)등으로 분류하기 위해 -->

	<!-- 각 소리당 재생은 1개씩만 하므로 볼륨슬라이더는 10개만 할당  -->
	<!-- /1.비 /10.벌레 /20.바람 /30.번개 /40.끓는소리 /50.새 /60.불 /70.파도 /80.사람 /90.TV -->


	<audio id="audio0" loop="loop" preload="auto"> <source
		src='Audio\main-rain.ogg' type="audio/ogg" /> <source
		src='Audio\main-rain.mp4' type="audio/mpeg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>


	<audio id="audio1" loop="loop" preload="auto"> <source
		src='Audio\main-crickets.mp4' type="audio/mpeg" /> <source
		src='Audio\main-crickets.ogg' type="audio/ogg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>

	<audio id="audio2" loop="loop" preload="auto"> <source
		src='Audio\main-wind.mp4' type="audio/mpeg" /> <source
		src='Audio\main-wind.ogg' type="audio/ogg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>

	<audio id="audio3" loop="loop" preload="auto"> <source
		src='Audio\main-thunder.mp4' type="audio/mpeg" /> <source
		src='Audio\main-thunder.ogg' type="audio/ogg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>

	<audio id="audio4" loop="loop" preload="auto"> <source
		src='Audio\main-sbowl.mp4' type="audio/mpeg" /> <source
		src='Audio\main-sbowl.ogg' type="audio/ogg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>

	<audio id="audio5" loop="loop" preload="auto"> <source
		src='Audio\main-birds.mp4' type="audio/mpeg" /> <source
		src='Audio\main-birds.ogg' type="audio/ogg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>

	<audio id="audio6" loop="loop" preload="auto"> <source
		src='Audio\main-fire.mp4' type="audio/mpeg" /> <source
		src='Audio\main-fire.ogg' type="audio/ogg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>

	<audio id="audio7" loop="loop" preload="auto"> <source
		src='Audio\main-waves.mp4' type="audio/mpeg" /> <source
		src='Audio\main-waves.ogg' type="audio/ogg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>

	<audio id="audio8" loop="loop" preload="auto"> <source
		src='Audio\main-people.mp4' type="audio/mpeg" /> <source
		src='Audio\main-people.ogg' type="audio/ogg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>

	<audio id="audio9" loop="loop" preload="auto"> <source
		src='Audio\main-tv.mp4' type="audio/mpeg" /> <source
		src='Audio\main-tv.ogg' type="audio/ogg" />
	<p>죄송합니다. 지금 사용하고 계신 브라우저가 audio 태그를 지원하지 않습니다.</p>
	</audio>

	</div>

	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.1.0.min.js"></script>
	<script type="text/javascript">
		var AudioFlag = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]; //11번째는 AllPlay제어용 음원을 분류하여 나중에 Ajax로 보냄
		var playnum = 0; // 현재 재생되고 있는 음원 수
		var timerID; // 타이머용 전역변수
		var sec =0; // 타이머용 초
	
		function testing() {
			var aud = document.getElementById("audio1");
			alert(aud.src);
			aud.pause();
			aud.src = 'Audio/main-tv.mp4'; /// 나중에 소리 바꾸기용 테스트
			alert(aud.src);
			aud.load();
			aud.play();
		}
		// 해당 mp4파일 재생
		function play(num,menu) {   //////// num에 해당하는 mp4파일을 가져와서 재생.
			var audio_num = parseInt(num / 10);
			var aud = document.getElementById("audio" + audio_num);
			var src=null;
			
			src = "Audio/"+num+".mp4";
			aud.src = src;
			if (AudioFlag[audio_num]!=num) {
				if (AudioFlag[audio_num] == 0)
					playnum++;
				if (AudioFlag[10] == 0)
					playall();
				aud.pause();
				aud.load();
				aud.play();
				AudioFlag[audio_num] = num;
				add(menu);
			} else {
				remove(menu);
				aud.pause();
				playnum--;
				if (playnum == 0) {
					var all = document.getElementById("play_icon");
					all.src = 'Img/play.png';
					AudioFlag[10] = 0;
				}
				AudioFlag[audio_num] = 0;
			}
		}
		// 음량 선택
		function setvolume(num) {
			var aud = document.getElementById("audio" + num);
			var vol = document.getElementById("volumeslider" + num);
			aud.volume = vol.value / 10;
		}
		// 전체 재생
		function playall() {
			if (AudioFlag[10] == 0 && playnum != 0) {
				AudioFlag[10] = 1;
				var all = document.getElementById("play_icon");
				all.src = 'Img/pause.png';
				for (var i = 0; i < 10; i++) {
					if (AudioFlag[i] != 0) {
						var aud = document.getElementById("audio" + i);
						aud.play();
					}
				}
			} else {
				AudioFlag[10] = 0;
				var all = document.getElementById("play_icon");
				all.src = 'Img/play.png';
				for (var i = 0; i < 10; i++) {
					var aud = document.getElementById("audio" + i);
					aud.pause();
				}
			}
		}
		
		function sleep(seconds){
		    var waitUntil = new Date().getTime() + seconds;
		    while(new Date().getTime() < waitUntil) true;
		}

		function reset() {
			for (var i = 0; i < 10; i++) {
				var aud = document.getElementById("audio" + i);
				var vol = document.getElementById("volumeslider" + i);
				aud.pause();
				aud.volume = 1;
				AudioFlag[i] = 0;
				remove(".menu"+(i+1));
				vol.value = 100;
			}
			//alert("리셋");
			var all = document.getElementById("play_icon");
			all.src = 'Img/play.png';
			AudioFlag[10] = 0;
			playnum = 0;
		}

		function ajaxSave() {
	<%//AudioDTO forID = (AudioDTO) request.getServletContext().getAttribute("dto");
			AudioDTO forID = (AudioDTO) request.getSession().getAttribute("dto");
			String userid = null;
			if (forID != null)
				userid = forID.getId(); //ID식별 TEST용%>
			
			var id = "<%=userid%>";
			//alert(id +"/");
			if(id != null && id != "null"){
				var ArrayData = new Array();
				var slot = $('[name="Slot"]').val();
				if(slot==1||slot==2||slot==3){
					for (var i = 0; i < 10; i++) {
						var aud = document.getElementById("audio" + i);
						var Data = new Object();
						Data.AudioNum = AudioFlag[i];
						Data.volume = aud.volume;
						Data.slot = slot;
						ArrayData.push(Data);
					}
					var json_data = {
						jsondata : JSON.stringify(ArrayData)
					}
					$.ajax({
						url : '/WebProject/WebControl?action=save',
						type : 'POST',
						data : json_data,
						datatype : "json",
						success : function(data) {
							alert(slot + "번째 슬롯에 저장되었습니다.");
							//window.opener.location.reload();
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("save 에러 발생 \n" + textStatus + " : " + errorThrown);
							// self.close();
						}
					});
				}
				
			}
			else{
				alert("로그인 해주세요.");
			}
			
		}

		function ajaxLoad() {
			<%//forID = (AudioDTO) request.getServletContext().getAttribute("dto");
			forID = (AudioDTO) request.getSession().getAttribute("dto");
			userid = null;
			if (forID != null)
				userid = forID.getId(); //ID식별 TEST용%>
			
			var id = "<%=userid%>";
			if (id != null && id != "null") {
				var ArrayData = new Array();
				var slot = $('[name="Slot"]').val();
				if (slot == 1 || slot == 2 || slot == 3) {
					var Data = new Object();
					Data.slot = slot
					ArrayData.push(Data);
					var json_data = {
						jsondata : JSON.stringify(ArrayData)
					}
					$
							.ajax({
								url : '/WebProject/WebControl?action=load',
								type : 'POST',
								data : json_data,
								datatype : "json",
								success : function(result) {
									var ar = result;
									if (ar.length > 0) {
										reset();
										for (var i = 0; i < ar.length; i++) {
											if (ar[i].track != 0) {
												var track = parseInt(ar[i].track / 10);
												var aud = document
														.getElementById("audio"
																+ track);
												var vol = document
														.getElementById("volumeslider"
																+ track);
												var volume = ar[i].volume;
												play(ar[i].track,
														(".menu" + (i + 1)));
												aud.volume = volume;
												vol.value = volume * 10;
											}
										}
										 
										
										//	window.opener.location.reload();
									} else {
										alert("저장된 데이터가 없습니다.");
									}

								},
								error : function(jqXHR, textStatus, errorThrown) {
									alert("load 에러 발생 \n" + textStatus + " : "
											+ errorThrown);
									// self.close();
								}
							});
				}

			} else {
				alert("로그인 해주세요.");
			}

		}
		/*사이드바 플레이목록 추가 삭제*/
		function add(menu) {
			$(menu).show("slow");
		}

		function remove(menu) {
			$(menu).hide("slow");
		}

		/*아이콘에 마우스 오버 시 오디오 리스트 보임 */
		function hide_list(sub_list) {
			var sublist = $(sub_list);
			if (sublist.is(":visible")) {
				sublist.slideUp();
			} else {
				sublist.slideDown();
			}
		}
		/*전체화면이 아닐때 로그인 버튼 숨기기*/
		$(window).resize(function() {
			var windowWidth_ = $(window).width();
			if (windowWidth_ / screen.width < 0.95) {
				$('login').hide("slow");
			} else {
				$('login').show("slow");
			}
		});

		function logout() {
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post");
			form.setAttribute("action", "/WebProject/WebControl?action=logout");
			document.body.appendChild(form);
			form.submit();
		}
		// 타이머 세팅
		function timer() {
			timerID = setInterval("decrementTime()", 1000);
			var form = document.getElementById('t_field');
			form.style.display = "";
			var form2 = document.getElementById('t_setting');
			form2.style.display = "none";

		}
		// 타이머 시작
		function decrementTime() {
			var x1 = document.getElementById("t_time");
			var x2 = document.getElementById("t_min");
			if (sec == 0) {
				if (x2.value == 0) {
					if (x1.value == 0) {
						if (AudioFlag[10] != 0)
							playall()
						resettimer();
					} else {
						x1.value = x1.value - 1;
						x2.value = 59;
					}
				} else {
					x2.value = x2.value - 1;
					sec = 59;
				}
			} else
				sec--;
			$('.t_field').text(x1.value + "시간 " + x2.value + "분 " + sec);
		}
		// 타이머 정지
		function stoptimer() {
			clearInterval(timerID);

		}
		// 타이머 리셋
		function resettimer() {
			clearInterval(timerID);
			var x1 = document.getElementById("t_time");
			var x2 = document.getElementById("t_min");
			var form = document.getElementById('t_field');
			form.style.display = "none";
			var form2 = document.getElementById('t_setting');
			form2.style.display = "";
			x1.value = "";
			x2.value = "";
			sec = 0;
		}
	</script>
</body>
</html>