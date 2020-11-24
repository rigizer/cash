package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Comment;

@Mapper
public interface CommentMapper {
	// 댓글 입력
	int insertComment(Comment comment);
	
	// 댓글 삭제
	int deleteComment(int commentId);
}