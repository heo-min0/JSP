package bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.AbstractDocument.Content;

import dao.BbsDao;
import dto.BbsDto;
import dto.MemberDto;

public class BbsController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("BbsController doProcess");
		String param = req.getParameter("param");
		BbsDao bbs = BbsDao.getInstancs();
		MemberDto mem = (MemberDto)req.getSession().getAttribute("mem");
		
		if(param.equals("bbs")) {
			resp.sendRedirect("bbslist.jsp");
		}
		else if(param.equals("seq")) {
			String seq = req.getParameter("seq");
			BbsDto dto = bbs.getBbsseq(seq);
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("bbsdetail.jsp").forward(req, resp);
		}
		else if(param.equals("write")) {
			resp.sendRedirect("bbswrite.jsp");
		}
		else if(param.equals("writeAF")) {
			String id = mem.getId();
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			boolean b = bbs.addBbs(new BbsDto(id, title, content));
			resp.sendRedirect("message.jsp?w="+b);
		}
		else if(param.equals("dell")) {
			String seq = req.getParameter("seq");
			boolean b = bbs.delBbs(seq);
			resp.sendRedirect("message.jsp?d="+b);
		}
		else if(param.equals("search")) {
			
		}
		
		
	}
	
}
