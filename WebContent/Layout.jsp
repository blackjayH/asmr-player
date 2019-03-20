<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta http-equiv="Content-Type" Content="text/html; charset=utf-8" />

<link rel='stylesheet'
	href='http://fonts.googleapis.com/earlyaccess/nanumpenscript.css'>
<link rel="stylesheet" type="text/css" href="main.css">


<!--[if !ie]>-->
<link rel="stylesheet" type="text/css" href="mainIE.css">
<!--[endif]-->

<title>main</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>


</head>
</head>
<body>
<body>
	<div class="timer">
		<P>타이머</P>
		<nav class="timer_set">
		<p id="t_setting">
			<input type="number" min="0" max="24" name="t_time" id="t_time">
			시간 <input type="number" min="0" max="59" name="t_minute" id="t_min">
			분 뒤 종료
		</p>
		<p class="t_field" name="t_field" id="t_field" style="display: none;">0시
			0분 0</p>
		<ul>
			<li><a href="#"><img class="timer" src="Img/timer.png"
					width="80px" height="auto" align="center"> </a>
				<ul>
					<li><a href="javascript:timer()">시작</a></li>
					<li><a href="javascript:stoptimer()">정지</a></li>
					<li><a href="javascript:resettimer()">리셋</a></li>
				</ul></li>
		</ul>
		</nav>
	</div>

	<a href="login.jsp" id="login" style="display: none;"> <login
			class="login">로그인</login>
	</a>

	<a href="javascript:logout();" id="logout" style="display: none;">
		<login class="login">로그아웃</login>
	</a>


	<div class="wrapper1">
		<div class="wrapper2">

			<div class="header">
				<a><img id="play_icon" onclick='playall()' src="Img/play.png"
					width="150px" height="auto" align="center"></a>

				<hBtn class="button"> <select name="Slot">
					<option selected>저장 슬롯</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
				</select>
				<ul>
					<li><a href="javascript:reset()">리셋</a></li>
					<li><a href="javascript:ajaxLoad()">불러오기</a></li>
					<li><a href="javascript:ajaxSave()">저장</a></li>
				</ul>
				</hBtn>

			</div>
			<div class="sidebar">

				<div class="menu1" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a href="javascript:play(1,'.menu1');"><label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/rain.png" width="70%" height="auto" align="center">
						</a>

					</div>
				</div>
				<div class="menu2" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a
							href="javascript:play(10,'.menu2');"> <label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/grass.png" width="70%" height="auto" align="center">
						</a>

					</div>
				</div>
				<div class="menu3" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a
							href="javascript:play(20,'.menu3');"> <label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/wind.png" width="70%" height="auto" align="center">
						</a>

					</div>
				</div>
				<div class="menu4" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a
							href="javascript:play(30,'.menu4');"> <label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/storm.png" width="70%" height="auto" align="center">
						</a>

					</div>
				</div>
				<div class="menu5" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a
							href="javascript:play(40,'.menu5');"> <label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/singing-bowl.png" width="70%" height="auto"
							align="center"> </a>

					</div>
				</div>
				<div class="menu6" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a
							href="javascript:play(50,'.menu6');"> <label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/dove.png" width="70%" height="auto" align="center">
						</a>

					</div>
				</div>
				<div class="menu7" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a
							href="javascript:play(60,'.menu7');"> <label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/bonfire.png" width="70%" height="auto"
							align="center"> </a>

					</div>
				</div>
				<div class="menu8" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a
							href="javascript:play(70,'.menu8');"> <label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/wave.png" width="70%" height="auto" align="center">
						</a>

					</div>
				</div>
				<div class="menu9" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a
							href="javascript:play(80,'.menu9');"> <label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/coffee-cup.png" width="70%" height="auto"
							align="center"> </a>

					</div>
				</div>
				<div class="menu10" id="sidebar" style="display: none;">
					<div class="outer">
						<div1 class="inner"> <a
							href="javascript:play(90,'.menu10');"> <label>remove</label>
						</a> </div1>
					</div>
					<div id="side">
						<img src="Img/television.png" width="70%" height="auto"
							align="center"> </a>

					</div>
				</div>

			</div>
		</div>


		<div class="wrapper">

			<div class="panel">
				<img id="icon0" src="Img\rain.png" width="100" height="100"
					onclick="play(1,'.menu1')" onmouseenter="hide_list('.hide1')">
				<input class="slider" id="volumeslider0" type="range" min="0"
					max="10" value="100" step="1" onclick="setvolume(0)">
				<ul class="hide1">
					<li><a href="javascript:play(1,'.menu1');"> #1</a></li>
					<li><a href="javascript:play(2,'.menu1');"> #2</a></li>
					<li><a href="javascript:play(3,'.menu1');"> #3</a></li>
					<li><a href="javascript:play(4,'.menu1');"> #4</a></li>
				</ul>
			</div>

			<div class="panel">
				<img id="icon10" src="Img\grass.png" width="100" height="100"
					onclick="play(10,'.menu2')" onmouseenter="hide_list('.hide2')">
				<input class="slider" id="volumeslider1" type="range" min="0"
					max="10" value="100" step="1" onclick="setvolume(1)">

				<ul class="hide2">
					<li><a href="javascript:play(11,'.menu2');"> #1</a></li>
					<li><a href="javascript:play(12,'.menu2');"> #2</a></li>
					<li><a href="javascript:play(13,'.menu2');"> #3</a></li>
					<li><a href="javascript:play(14,'.menu2');"> #4</a></li>
				</ul>
			</div>
			<div class="panel">
				<img id="icon20" src="Img\wind.png" width="100" height="100"
					onclick="play(20,'.menu3')" onmouseenter="hide_list('.hide3')">
				<input class="slider" id="volumeslider2" type="range" min="0"
					max="10" value="100" step="1" onclick="setvolume(2)">
				<ul class="hide3">
					<li><a href="javascript:play(21,'.menu3');"> #1</a></li>
					<li><a href="javascript:play(22,'.menu3');"> #2</a></li>
					<li><a href="javascript:play(23,'.menu3');"> #3</a></li>
					<li><a href="javascript:play(24,'.menu3');"> #4</a></li>
				</ul>

			</div>
			<div class="panel">
				<img id="icon30" src="Img\storm.png" width="100" height="100"
					onclick="play(30,'.menu4')" onmouseenter="hide_list('.hide4')">
				<input class="slider" id="volumeslider3" type="range" min="0"
					max="10" value="100" step="1" onclick="setvolume(3)">
				<ul class="hide4">
					<li><a href="javascript:play(31,'.menu4');"> #1</a></li>
					<li><a href="javascript:play(32,'.menu4');"> #2</a></li>
					<li><a href="javascript:play(33,'.menu4');"> #3</a></li>
					<li><a href="javascript:play(34,'.menu4');"> #4</a></li>
				</ul>

			</div>
			<div class="panel">
				<img id="icon40" src="Img/singing-bowl.png" width="100" height="100"
					onclick="play(40,'.menu5')" onmouseenter="hide_list('.hide5')">
				<input class="slider" id="volumeslider4" type="range" min="0"
					max="10" value="100" step="1" onclick="setvolume(4)">
				<ul class="hide5">
					<li><a href="javascript:play(41,'.menu5');"> #1</a></li>
					<li><a href="javascript:play(42,'.menu5');"> #2</a></li>
					<li><a href="javascript:play(43,'.menu5');"> #3</a></li>
					<li><a href="javascript:play(44,'.menu5');"> #4</a></li>
				</ul>

			</div>
			<div class="panel">
				<img id="icon50" src="Img\dove.png" width="100" height="100"
					onclick="play(50,'.menu6')" onmouseenter="hide_list('.hide6')">
				<input class="slider" id="volumeslider5" type="range" min="0"
					max="10" value="100" step="1" onclick="setvolume(5)">
				<ul class="hide6">
					<li><a href="javascript:play(51,'.menu6');"> #1</a></li>
					<li><a href="javascript:play(52,'.menu6');"> #2</a></li>
					<li><a href="javascript:play(53,'.menu6');"> #3</a></li>
					<li><a href="javascript:play(54,'.menu6');"> #4</a></li>
				</ul>

			</div>
			<div class="panel">
				<img id="icon60" src="Img\bonfire.png" width="100" height="100"
					onclick="play(60,'.menu7')" onmouseenter="hide_list('.hide7')">
				<input class="slider" id="volumeslider6" type="range" min="0"
					max="10" value="100" step="1" onclick="setvolume(6)">
				<ul class="hide7">
					<li><a href="javascript:play(61,'.menu7');"> #1</a></li>
					<li><a href="javascript:play(62,'.menu7');"> #2</a></li>
					<li><a href="javascript:play(63,'.menu7');"> #3</a></li>
					<li><a href="javascript:play(64,'.menu7');"> #4</a></li>
				</ul>

			</div>
			<div class="panel">
				<img id="icon70" src="Img\wave.png" style="cursor: pointer"
					width="100" height="100" onclick="play(70,'.menu8')"
					onmouseenter="hide_list('.hide8')"> <input class="slider"
					id="volumeslider7" type="range" min="0" max="10" value="100"
					step="1" onclick="setvolume(7)">
				<ul class="hide8">
					<li><a href="javascript:play(71,'.menu8');"> #1</a></li>
					<li><a href="javascript:play(72,'.menu8');"> #2</a></li>
					<li><a href="javascript:play(73,'.menu8');"> #3</a></li>
					<li><a href="javascript:play(74,'.menu8');"> #4</a></li>
				</ul>

			</div>
			<div class="panel">
				<img id="icon80" src="Img\coffee-cup.png" width="100" height="100"
					onclick="play(80,'.menu9')" onmouseenter="hide_list('.hide9')">
				<input class="slider" id="volumeslider8" type="range" min="0"
					max="10" value="100" step="1" onclick="setvolume(8)">
				<ul class="hide9">
					<li><a href="javascript:play(81,'.menu9');"> #1</a></li>
					<li><a href="javascript:play(82,'.menu9');"> #2</a></li>
					<li><a href="javascript:play(83,'.menu9');"> #3</a></li>
					<li><a href="javascript:play(84,'.menu9');"> #4</a></li>
				</ul>

			</div>
			<div class="panel">
				<img id="icon90" src="Img\television.png" width="100" height="100"
					onclick="play(90,'.menu10')" onmouseenter="hide_list('.hide10')">
				<input class="slider" id="volumeslider9" type="range" min="0"
					max="10" value="100" step="1" onclick="setvolume(9)">
				<ul class="hide10">
					<li><a href="javascript:play(91,'.menu10');"> #1</a></li>
					<li><a href="javascript:play(92,'.menu10');"> #2</a></li>
					<li><a href="javascript:play(93,'.menu10');"> #3</a></li>
					<li><a href="javascript:play(94,'.menu10');"> #4</a></li>
				</ul>

			</div>

			<div class="panel"></div>
			<div class="panel"></div>
			<div class="panel"></div>
			<div class="panel"></div>

		</div>
		<footer class="footer"> WEB Project -워낭소리</footer>



	</div>


</body>
</html>