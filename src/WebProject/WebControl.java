package WebProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import WebProject.AudioDTO;
import org.json.*;

/**
 * Servlet implementation class WebControl
 */
@WebServlet("/WebControl")
public class WebControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static PrintWriter out = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WebControl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AudioDAO dao = new AudioDAO();
		String address = null;
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		if (action.equals("login")) {
			login_check(request, response);
		} else if (action.equals("login2")) {
			// AudioDTO forID = (AudioDTO)
			// request.getServletContext().getAttribute("dto_temp");
			AudioDTO forID = (AudioDTO) request.getSession().getAttribute("dto_temp");
			request.getSession().setAttribute("dto", forID);
			request.getSession().removeAttribute("dto_temp");
			// request.getServletContext().setAttribute("dto", forID);
			// request.getServletContext().removeAttribute("dto_temp");
			address = "MainFS.jsp";
			response.sendRedirect(address);
		} else if (action.equals("checkID")) {
			Id_check(request, response);
		} else if (action.equals("add_user")) {
			AudioDTO data = new AudioDTO();
			data.setId(request.getParameter("Id"));
			data.setPass(request.getParameter("pass"));
			dao.addID(data);
			address = "MainFS.jsp";
			response.sendRedirect(address);
		} else if (action.equals("logout")) {
			// request.getServletContext().removeAttribute("dto");
			request.getSession().removeAttribute("dto");
			request.getSession().invalidate();
			address = "MainFS.jsp";
			response.sendRedirect(address);
		} else if (action.equals("save")) {
			save(request, response);
		} else if (action.equals("load")) {
			response.setContentType("text/json;charset=utf-8");
			response.setHeader("cache-control", "no-cache");
			String jsonSt = load(request, response);
			try {
				PrintWriter out = response.getWriter();
				out.print(jsonSt);
				out.flush();
			} catch (Exception e) {
			}
		}
	}

	// ID 중복확인(회원가입)
	private void Id_check(HttpServletRequest request, HttpServletResponse response) {
		String eventArray = null;
		eventArray = request.getParameter("jsondata");
		AudioDAO dao = new AudioDAO();
		try {
			JSONArray array = new JSONArray(eventArray);
			int list_cnt = array.length();

			JSONObject jsonObject = array.getJSONObject(0);
			if (dao.CheckID(jsonObject.getString("Id"))) {
				PrintWriter out = response.getWriter();
				// System.out.println("true");
				out.print("true");
				out.flush();
			} else {
				PrintWriter out = response.getWriter();
				// System.out.println("false");
				out.print("false");
				out.flush();
			}
		} catch (Exception e) {
		}

	}

	// 로그인 확인(ID / PW)
	public void login_check(HttpServletRequest request, HttpServletResponse response) {
		String eventArray = null;
		eventArray = request.getParameter("jsondata");
		AudioDAO dao = new AudioDAO();

		try {
			JSONArray array = new JSONArray(eventArray);
			int list_cnt = array.length();
			out = response.getWriter();
			JSONObject jsonObject = array.getJSONObject(0);
			System.out.println("id : " + jsonObject.getString("Id"));
			if (dao.CheckLogin(jsonObject.getString("Id"), jsonObject.getString("ps"))) {
				AudioDTO data = new AudioDTO();
				data.setId(jsonObject.getString("Id"));
				data.setPass(jsonObject.getString("ps"));
				request.getSession().setAttribute("dto_temp", data);
				// request.getServletContext().setAttribute("dto_temp", data);
				// System.out.println("true");
				out.print("true");
				out.flush();
			} else {
				// System.out.println("false");
				out.print("false");
				out.flush();
			}
		} catch (Exception e) {
		}

	}

	public void save(HttpServletRequest request, HttpServletResponse response) {
		String eventArray = null;
		eventArray = request.getParameter("jsondata");
		AudioDAO dao = new AudioDAO();
		System.out.println("result save");
		// AudioDTO forId = (AudioDTO)
		// request.getServletContext().getAttribute("dto");
		AudioDTO forId = (AudioDTO) request.getSession().getAttribute("dto");
		try {
			System.out.println("����� : " + eventArray);
			JSONArray array = new JSONArray(eventArray);
			int list_cnt = array.length();

			JSONObject jsonObject = array.getJSONObject(0);
			int Slot = jsonObject.getInt("slot");

			String id = forId.getId();
			System.out.println(jsonObject.getInt("slot") + id + " " + list_cnt);
			dao.removeAudio(id, Slot);
			for (int i = 0; i < list_cnt; i++) {
				jsonObject = array.getJSONObject(i);
				AudioDTO data = new AudioDTO();
				data.setId(id);
				data.setSlot(Slot);
				data.setAudioNum(jsonObject.getInt("AudioNum"));
				data.setVolume((float) jsonObject.getDouble("volume"));
				dao.addAudio(data);

				System.out.println(jsonObject.getInt("AudioNum") + " " + data.getVolume());

			}
		} catch (Exception e) {
		}

	}

	public String load(HttpServletRequest request, HttpServletResponse response) {
		String eventArray = request.getParameter("jsondata");
		// System.out.println(eventArray);
		int Slot = 0;
		try {
			JSONArray array = new JSONArray(eventArray);
			JSONObject jsonObject = array.getJSONObject(0);
			Slot = jsonObject.getInt("slot");
		} catch (Exception e) {
		}
		ArrayList<AudioDTO> list = new ArrayList<AudioDTO>();
		AudioDAO dao = new AudioDAO();
		// AudioDTO forId = (AudioDTO)
		// request.getServletContext().getAttribute("dto");
		AudioDTO forId = (AudioDTO) request.getSession().getAttribute("dto");
		String id = forId.getId();
		list = dao.getAllData(id, Slot);
		JSONArray jArray = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("track", list.get(i).getAudioNum());
			jsonObj.put("volume", list.get(i).getVolume());
			jArray.put(jsonObj);
		}
		String jsonSt = jArray.toString();
		// System.out.println(jsonSt);
		return jsonSt;
	}

}
