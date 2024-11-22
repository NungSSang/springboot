package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Reply;
import com.example.demo.dto.Rq;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Util;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrReplyController {
	
	private ReplyService replyService;
	
	public UsrReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}
	public List<Reply> showReplies(int relId) {
		return replyService.getReplyByRelId(relId); 
	}
	
	public void modifyReply(String body, String type ,int memberId) {
		replyService.modifyReply(body, type ,memberId);
	}
	
	@PostMapping("/usr/reply/writereply")
	@ResponseBody
	public String writereply(HttpServletRequest req, String relTypeCode, int relId, String body) {
		Rq rq = (Rq) req.getAttribute("rq");
		replyService.getWriteReply(rq.getLoginedMemberId() , relTypeCode, relId, body);
		
		return Util.jsReturn("댓글을 작성했습니다.","/");
	}
}
