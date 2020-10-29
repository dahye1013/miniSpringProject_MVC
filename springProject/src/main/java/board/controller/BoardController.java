package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.service.BoardService;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(Model model, @RequestParam(required = false, defaultValue = "1") String pg) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardList.jsp");
		return "/main/index";
	}

	@RequestMapping(value = "getBoardList", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView getBoardList(HttpServletResponse response, Model model, @RequestParam String pg,
			HttpSession session) {

		// 쿠키 생성
		String hit = "hit";
		Cookie cookie = new Cookie("hit", hit);
		cookie.setMaxAge(30 * 60); // 초 단위, 30분
		response.addCookie(cookie); // 클라언트에게 보내기

		String memId = (String) session.getAttribute("memId");

		int endNum = Integer.parseInt(pg) * 5;
		int startNum = endNum - 4;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		List<BoardDTO> list = boardService.boardList(map);

		// 페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(pg);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("memId", memId);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value = "searchList", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ModelAndView boardSearch(Model model, @RequestParam Map<String, Object> map) {
		int pg = Integer.parseInt((String) map.get("pg"));
		int endNum = pg * 5;
		int startNum = endNum - 4;
		map.put("endNum", endNum);
		map.put("startNum", startNum);

		List<BoardDTO> list = boardService.searchList(map);
		// 페이징 처리
		BoardPaging boardPaging = boardService.boardPaging(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");

		return mav;
	}

	@RequestMapping(value = "boardWriteForm", method = RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("display", "/board/boardWriteForm.jsp");
		return "/main/index";
	}

	@RequestMapping(value = "boardWrite", method = RequestMethod.POST)
	public @ResponseBody void boardWrite(@RequestParam Map<String, String> map) {

		boardService.boardWrite(map);	
	}

	@RequestMapping(value = "boardView", method = RequestMethod.GET)
	public String boardView(@RequestParam String seq, @RequestParam String pg, Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardView.jsp");
		return "/main/index";
	}

	@RequestMapping(value = "getBoardView", method = RequestMethod.POST)
	public ModelAndView getBoardView(@RequestParam String seq, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		String memId = (String) session.getAttribute("memId");

		// 쿠키
		String hit = null;
		Cookie[] ar = request.getCookies();
		if (ar != null) {
			for (int i = 0; i < ar.length; i++) {
				// 잘들어오는지 확인
				String cookieName = ar[i].getName(); // 쿠키명
				String cookieValue = ar[i].getValue(); // 쿠키값
				if (ar[i].getName().equals("hit")) {
					// 조회수 올리기
					boardService.updateHit(seq);
					// 쿠키 삭제
					ar[i].setMaxAge(0);
					response.addCookie(ar[i]);
				}
			}
		}

		BoardDTO boardDTO = boardService.getBoard(seq);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("memId", memId);
		mav.setViewName("jsonView");// view resolver로 보내서 받아야하기때문에 꼭 이 이름을 사용해야함. xml확인할것.
		return mav;
	}

	@RequestMapping(value = "boardReplyForm", method = RequestMethod.POST)
	public String boardReplyForm(@RequestParam String seq, @RequestParam String pg, Model model) {
		model.addAttribute("pseq", seq); // pseq는 원글번호
		model.addAttribute("pg", pg); // 원글이 있는 페이지 번호
		model.addAttribute("display", "/board/boardReplyForm.jsp");

		return "/main/index";
	}

	@RequestMapping(value = "boardReply", method = RequestMethod.POST)
	public String boardReply(@RequestParam Map<String, String> map, Model model) {
		System.out.println("boardReply controller");
		boardService.boardReply(map);
//		-------------------

		model.addAttribute("display", "/board/boardReply.jsp");
		return "/main/index";

	}

	@RequestMapping(value = "boardModifyForm", method = RequestMethod.POST)
	public String boardModifyForm(@RequestParam String seq, @RequestParam String pg, Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardModifyForm.jsp");
		return "/main/index";
	}

	@RequestMapping(value = "boardModify", method = RequestMethod.POST)
	@ResponseBody
	public void boardModify(@RequestParam Map<String, Object> map) {
		boardService.boardModify(map);

	}

	@RequestMapping(value = "boardDelete", method = RequestMethod.POST)
	public String boardDelete(@RequestParam String seq, Model model) {
		boardService.boardDelete(seq);
		model.addAttribute("display", "/board/boardDelete.jsp");
		return "/main/index";
	}

}
