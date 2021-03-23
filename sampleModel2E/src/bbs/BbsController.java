package bbs;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
			String choice = req.getParameter("sort");
			String search = req.getParameter("ser");
			String spage =  req.getParameter("index");
			System.out.println("초이스:"+choice);
			int page = 0;
			if(choice == null) choice = "";
			if(search == null) {search = ""; choice = "";}
			if(spage != null) page = Integer.parseInt(spage);
			System.out.println("확인:"+choice+search+page);
			
			List<BbsDto> list = new ArrayList<BbsDto>();
			list = bbs.getBbsPagingList(choice, search, page);

			int pageNum = bbs.getAllBbs(choice, search);
			req.setAttribute("list", list);
			req.setAttribute("choice", choice);
			req.setAttribute("search", search);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("page", page);
			req.getRequestDispatcher("bbslist.jsp").forward(req, resp);
		}
		else if(param.equals("seq")) {
			String seq = req.getParameter("seq");
			BbsDto dto = bbs.getBbsseq(seq);
			bbs.readcount(Integer.parseInt(seq));
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
		else if(param.equals("del")) {
			String seq = req.getParameter("seq");
			System.out.println(seq);
			boolean b = bbs.delBbs(seq);
			System.out.println(b);
			resp.sendRedirect("message.jsp?d="+b);
		}
		else if(param.equals("answer")) {
			String seq = req.getParameter("seq");
			BbsDto dto = bbs.getBbsseq(seq);
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("answer.jsp").forward(req, resp);
		}
		else if(param.equals("answerAF")) {
			String seq = req.getParameter("seq");
			String id = mem.getId();
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			bbs.answer(Integer.parseInt(seq), new BbsDto(id, title, content));
			resp.sendRedirect("bbs?param=bbs");
		}
		else if(param.equals("update")) {
			String seq = req.getParameter("seq");
			BbsDto dto = bbs.getBbsseq(seq);
			System.out.println(dto.toString());
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("bbsupdate.jsp").forward(req, resp);
		}
		else if(param.equals("updateAF")) {
			String seq = req.getParameter("seq");
			String id = req.getParameter("id");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			bbs.setBbs(new BbsDto(id, title, content), seq);
			resp.sendRedirect("bbs?param=bbs");
		}
	}
	
}
