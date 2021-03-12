package hello;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.CustDto;
import net.sf.json.JSONObject;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("doGet");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println(id + ", " +pwd);
		
		String str = "World";
		JSONObject jObj = new JSONObject();
		//jObj.put("str", str);
		/*HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("title", "제목");
		map.put("content", "내용");
		jObj.put("map", map);*/
		
		List<CustDto> list = new ArrayList<CustDto>();
		list.add(new CustDto("abc", "홍길동"));
		list.add(new CustDto("bcd", "성춘향"));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("custlist",list);
		jObj.put("map", map);
		
		
		resp.setContentType("application/x-json; charset=UTF-8");
		resp.getWriter().print(jObj);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost");
	}

}
