package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dao.ReplyDao;
import com.example.demo.dto.Reply;

@Service
public class ReplyService {

	private ReplyDao replyDao;
	
	public ReplyService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}
	

	public List<Reply> getReplyByRelId(int relId) {
		return replyDao.getReplyByRelId(relId);
	}


	public void modifyReply(String body,String type, int memberId) {
		replyDao.modifyReply(body, type, memberId);
	}


	public void getWriteReply(int loginedMemberId, String relTypeCode, int relId, String body) {
		replyDao.getWriteReply(loginedMemberId, relTypeCode, relId, body);
	}
	

}
