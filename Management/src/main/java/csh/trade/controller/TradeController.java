package csh.trade.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import csh.trade.dto.BoardDTO;
import csh.trade.dto.MemberDTO;
import csh.trade.service.TradeService;

@Controller
public class TradeController {

	@Autowired
	private TradeService tradeService;
	
	private int startrow = 0;
	private int endrow = 0;
	private int page = 1;
	private int limit = 10;
	
	@RequestMapping(value = "/MemberList.do", method = RequestMethod.GET)
	public String memberList(HttpServletRequest request, HttpServletResponse response) {

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		int listcount = tradeService.listCount();
		List<?> list = tradeService.list();
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("memberList", list);
		return "./adminmember/memberlist";
	}
	@RequestMapping(value = "/MemberDetail.do")
	public String memberDetail(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", tradeService.detail(memberDTO));
		return "./adminmember/memberselect";
	}
	
	@RequestMapping(value = "/MemberSearch.do")
	public String memberSearch(HttpServletRequest request, HttpServletResponse response) {
		String keyword = (String) request.getParameter("keyword");
		HttpSession session = request.getSession();
		session.setAttribute("keyword", keyword);
		System.out.println(keyword);
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int searchlistcount = tradeService.searchListCount(keyword);
		List<?> searchMemberlist = tradeService.searchList(keyword, page, limit);
		int maxpage = (int) ((double) searchlistcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("searchlistcount", searchlistcount);
		request.setAttribute("searchMemberlist", searchMemberlist);
		request.setAttribute("keyword", keyword);
		
		return "./adminmember/memberlist_search";
	}
		
	@RequestMapping(value = "/MemberInsertm.do", method = RequestMethod.GET)
	public String insertm() {
		return "./adminmember/memberinsert";
	}
	@RequestMapping(value = "/MemberInsert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute("MemberDTO") MemberDTO memberDTO, Model model) {
		model.addAttribute("id", memberDTO.getId());
		tradeService.insert(memberDTO);
		return "./adminmember/memberinsert_view";
	}
	//신규가입
	@RequestMapping(value = "/MemberNewInsertm.do", method = RequestMethod.GET)
	public String newInsertm() {
		return "./adminmember/membernewinsert";
	}
	
	@RequestMapping(value = "/MemberNewInsert.do", method = RequestMethod.POST)
	public String newInsert(@ModelAttribute("MemberDTO") MemberDTO memberDTO, Model model) {
		model.addAttribute("id", memberDTO.getId());
		tradeService.newinsert(memberDTO);
		return "./adminmember/membernewinsert_view";
	}
	
	@RequestMapping(value = "/MemberUpdatem.do", method = RequestMethod.GET)
	public String updatem(MemberDTO memberDTO, Model model) {
		model.addAttribute("memberDTO", tradeService.detail(memberDTO));
		return "./adminmember/memberupdate";
	}
	
	@RequestMapping(value = "/MemberUpdate.do", method = RequestMethod.POST)
	public String update(@ModelAttribute("MemberDTO") MemberDTO memberDTO, Model model) {
		model.addAttribute("memberDTO", memberDTO);
		tradeService.update(memberDTO);
		return "./adminmember/memberupdate_view";
	}
	
	@RequestMapping(value = "/MemberDelete.do")
	public String delete(String id) {
		tradeService.delete(id);
		return "redirect:MemberList.do";
	}
	
	@RequestMapping(value = "/HomeMain.do")
	public String homemain() {
		return "./adminview/homemain";		
	}
	
	@RequestMapping(value = "/MemberLoginm.do")
	public String memberLogin() {
		return "./adminlogin/adminlogin";		
	}
	
	@RequestMapping(value = "/MemberMain.do")
	public String memberMain() {
		return "./adminview/membermain";		
	}
	
	@RequestMapping(value = "/MemberLoginCheck.do")
	public String memberLoginCheck(HttpServletRequest request, HttpServletResponse response) {
		MemberDTO memberDTO = new MemberDTO();
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		memberDTO.setId(id);
		request.setAttribute("passwd", passwd);
		memberDTO = tradeService.detail(memberDTO);	
		request.setAttribute("memberDTO", memberDTO);
		if (id.equals(memberDTO.getId()) & passwd.equals(memberDTO.getPasswd())) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("id", id);
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		return "./adminlogin/adminlogin_view";
	}
	
	@RequestMapping(value = "/MemberLogOut.do")
	public String memberLogOut(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
		return "./adminlogin/adminlogout";	
	}
	
	@RequestMapping(value = "/BoardMain.do")
	public String boardMain() {
		return "./adminview/boardmain";
	}
	
	@RequestMapping(value = "/BoardInsert.do", method = RequestMethod.POST)
	public String boardInsert(@ModelAttribute("BoardDTO")BoardDTO boardDTO, MultipartHttpServletRequest request) {	
		String origName = boardDTO.getFilename().getOriginalFilename();
		String fileName = new Date().getTime() + boardDTO.getFilename().getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("./resources/files") + "\\";
		
		MultipartFile multipartFile = boardDTO.getFilename();
		File uploadFile = new File(uploadPath + fileName);
		File uploadDir = new File(uploadPath);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		if (uploadFile.exists()) {
			fileName = new Date().getTime() + origName;
			uploadFile = new File(uploadPath + fileName); 
		}
		try {
			multipartFile.transferTo(uploadFile);
			boardDTO.setAttachedfile(fileName);
		} catch (Exception e) {
		}
		String content = boardDTO.getBoardcontent().replaceAll("\r\n", "<br />");
		boardDTO.setBoardcontent(content);
		tradeService.boardInsert(boardDTO);		
		return "./adminboard/boardinsert_view";
	}
	@RequestMapping(value = "/BoardInsertm.do", method = RequestMethod.GET)
	public String boardInsertm() {
		return "./adminboard/boardinsert";
	}
	
	@RequestMapping(value = "/BoardUpdate.do", method = RequestMethod.POST)
	public String boardUpdate(BoardDTO boardDTO, MultipartHttpServletRequest request) {
		String origName = boardDTO.getFilename().getOriginalFilename();
		String fileName = new Date().getTime() + boardDTO.getFilename().getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("./resources/files") + "\\";

		MultipartFile multipartFile = boardDTO.getFilename();
		File uploadFile = new File(uploadPath + fileName);
		File uploadDir = new File(uploadPath);
		
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		if (uploadFile.exists()) {
			fileName = new Date().getTime() + origName;
			uploadFile = new File(uploadPath + fileName); 
		}
		try {
			multipartFile.transferTo(uploadFile);
			boardDTO.setAttachedfile(fileName);
		} catch (Exception e) {
		}
		String content = boardDTO.getBoardcontent().replaceAll("\r\n", "<br />");
		boardDTO.setBoardcontent(content);
		tradeService.boardUpdate(boardDTO);
		return "./adminboard/boardupdate_view";
	}
	@RequestMapping(value = "/BoardUpdatem.do", method = RequestMethod.GET)
	public String boardUpdatem(BoardDTO boardDTO, Model model) {
		model.addAttribute("boardDTO", tradeService.boardDetail(boardDTO));
		return "./adminboard/boardupdate";
	}
	@RequestMapping(value = "/BoardDelete.do")
	public String boardDelete(int boardno) {
		tradeService.boardDelete(boardno);
		return "redirect:BoardListService.do";
	}
	@RequestMapping(value = "/BoardSelect.do")
	public String boardSelect(int boardno, Model model, BoardDTO boardDTO) {
		model.addAttribute("boardDTO", tradeService.boardDetail(boardDTO));
		System.out.println(tradeService.boardDetail(boardDTO));
		return "./adminboard/boardselect";
	}
	@RequestMapping(value = "/BoardListService.do")
	public String boardListService(HttpServletRequest request, HttpServletResponse response) {

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (request.getParameter("limit") != null) {
			limit = Integer.parseInt(request.getParameter("limit"));
		}
		int listcount = tradeService.boardListCount();
		List<?> list = tradeService.getBoardList(page, limit);
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("boardList", list);
		return "./adminboard/boardlist";
	}
	@RequestMapping(value = "/BoardSearch.do")
	public String boardSearch(HttpServletRequest request, HttpServletResponse response) {
		String keyword = (String) request.getParameter("keyword");
		HttpSession session = request.getSession();
		session.setAttribute("keyword", keyword);
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int searchlistcount = tradeService.boardSearchListCount(keyword);
		List<?> searchBoardlist = tradeService.boardSearchList(keyword, page, limit);
		int maxpage = (int) ((double) searchlistcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = startpage + 10 - 1;
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("searchlistcount", searchlistcount);
		request.setAttribute("searchBoardlist", searchBoardlist);
		request.setAttribute("keyword", keyword);
		return "./adminboard/boardlist_search";
	}	
	@RequestMapping(value = "/BoardDownload.do")
	public String boardDownload(@RequestParam(value = "attachedfile", required = true) String attachedfile, HttpServletResponse response) throws Exception {
		String fileName = URLEncoder.encode(attachedfile, "UTF-8").replace("\\+", "%20");
		response.setContentType("application/octet-stream");
		return "redirect:/resources/file/" + fileName;
	}
	
}
