package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.dto.Member;
import com.example.demo.dto.ResultData;
import com.example.demo.dto.Rq;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {
	
	private MemberService memberService;
	
	public UsrMemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	@GetMapping("/usr/member/join")
	public String join() {
		return  "usr/member/join";
	}
	
	@PostMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String loginPwChk, String name) {
		memberService.joinMember(loginId, loginPw, name);
		
		int id = memberService.getLastInsertId();
		memberService.getMemberById(id);
		return Util.jsReturn(String.format("%s 님이 가입되었습니다." ,loginId) ,"login" );
	}
	@GetMapping("/usr/member/joinDuplication")
	@ResponseBody
	public ResultData joinDuplication(String loginId) {
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member != null) {
			return ResultData.from("F-1", String.format("[ %s ]은(는) 이미 사용중인 아이디입니다", loginId));
		}
		
		return ResultData.from("S-1", String.format("[ %s ]은(는) 사용가능한 아이디입니다", loginId));
	}
	
	@GetMapping("/usr/member/login")
	public String login() {
		return "usr/member/login";
	}
	
	@PostMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member == null) {
			return Util.jsReturn(String.format("[ %s ] 은(는) 존재하지 않는 아이디입니다", loginId), null);
		}
		
		if (member.getLoginPw().equals(loginPw) == false) {
			return Util.jsReturn("비밀번호를 확인해주세요", null);
		}
		
		rq.login(member.getId());
		
		return Util.jsReturn(String.format("%s님 환영합니다~", member.getName()), "/");
	}
	@GetMapping("/usr/member/myPage")
	public String myPage(Model model, HttpServletRequest req) {
		Rq rq = (Rq) req.getAttribute("rq");
		
		Member member = memberService.getMemberById(rq.getLoginedMemberId());
		
		model.addAttribute("member", member);
		return "usr/member/myPage";
	}
	@GetMapping("/usr/member/checkPassword")
	public String checkPassword(Model model, int id) {
		
		Member member = memberService.getMemberById(id);
		
		model.addAttribute("member", member);
		
		return "usr/member/checkPassword";
	}
	
	@PostMapping("/usr/member/modifyPassword")
	public String modifyPassword(Model model, int id) {
		Member member = memberService.getMemberById(id);
		model.addAttribute("member", member);
		return "usr/member/modifyPassword";
	}
	
	@PostMapping("/usr/member/doModifyPassword")
	@ResponseBody
	public String doModifyPassword(Model model, String loginId, String loginPw, String name, int id) {
		
		Member member = memberService.getMemberById(id);
		
		model.addAttribute("member", member);
		
		memberService.modifyMemberInfo(loginId, loginPw, name, id);

		return Util.jsReturn(String.format("%s님의 정보를 수정했습니다.", memberService.getMemberById(id).getName()), "/");
	}
	
	@GetMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(HttpServletRequest req) {
		Rq rq = (Rq) req.getAttribute("rq");
		
		rq.logout();
		
		return Util.jsReturn("정상적으로 로그아웃 되었습니다", "/");
	}
	

}