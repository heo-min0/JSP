package member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import db.DBClose;
import db.DBConnection;
import dto.MemberDto;
import net.sf.json.JSONObject;

public class MemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MemberController doProcess");
		String param = req.getParameter("param");
		
		if(param.equals("login")) {
			resp.sendRedirect("mylogin.jsp");
		}
		else if (param.equals("regi")) {
			resp.sendRedirect("regi.jsp");
		}
		else if (param.equals("idchk")) {
			String id = req.getParameter("id");
			System.out.println("id : " + id);
			
			//Dao > DB 확인
			MemberDao dao = MemberDao.getInstance();
			boolean b = dao.getID(id);
			System.out.println("t/f : "+b);
			
			//데이터 전송
			JSONObject obj = new JSONObject();
			String data = "NO";
			if(b) {data = "YES";};
			obj.put("chk", data);
			System.out.println(data);
			
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(obj);
		}
		else if (param.equals("regiAF")) {
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			MemberDao dao = MemberDao.getInstance();
			MemberDto dto = new MemberDto(id, pwd, name, email, 1);
			boolean isS = dao.addMember(dto);
			resp.sendRedirect("message.jsp?is="+isS);
		}
		else if (param.equals("loginAF")) {
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			MemberDao dao = MemberDao.getInstance();
			boolean b = dao.getPwd(id, pwd);
			String ok = "NO"; 
			if(b) {ok = "YES"; };
			resp.sendRedirect("message.jsp?ok="+ok);
		}
		else if (param.equals("bbslist")) {
			resp.sendRedirect("bbslist.jsp");
		}
	}
}
