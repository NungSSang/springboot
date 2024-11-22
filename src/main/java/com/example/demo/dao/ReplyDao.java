package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.demo.dto.Reply;

@Mapper
public interface ReplyDao {

	@Select("""
			SELECT * , m.loginId
				FROM reply AS r
				INNER JOIN article AS a
				ON r.relId = a.id
				INNER JOIN `member` as m
				ON r.memberId = m.id
				WHERE r.relId = #{relId}	
			""")
	List<Reply> getReplyByRelId(int relId);

	
	@Update("""
			UPDATE reply
					SET `body` = #{body}
						,updateDate = now()
						,relType = #{type}
					WHERE memberId = #{memberId};
			""")
	void modifyReply(String body, String type, int memberId);


	@Insert("""
			INSERT INTO reply
					SET regDate = NOW()
				        , updateDate = NOW()
				        , memberId = #{loginedMemberId}
				        , relTypeCode = #{relTypeCode}
				        , relId = #{relId}
				        , `body` = #{body}; 
			""")
	void getWriteReply(int loginedMemberId, String relTypeCode, int relId, String body);
}
