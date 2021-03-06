package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.mapper.QnaAttachMapper;
import com.green.mapper.QnaMapper;
import com.green.mapper.QnaReplyMapper;
import com.green.vo.QnaVO;
import com.green.vo.Criteria;
import com.green.vo.QnaAttachDTO;
import com.green.vo.QnaReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService{

	@Setter(onMethod_=@Autowired)
	private QnaMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private QnaReplyMapper replyMapper;
	
	@Setter(onMethod_=@Autowired)
	private QnaAttachMapper attachMapper;
	
	@Override
	public List<QnaVO> list() {
		log.info("2) 서비스에서 리스트 가져오기 ");
		return mapper.listqna();
	}
	
	@Transactional
	@Override
	public void insertQna(QnaVO vo) {
		log.info("2) 서비스에서 insert 하기 "+vo);
		mapper.insertQnaKey(vo);
		
		if(vo.getAttachList()==null || vo.getAttachList().size()<=0) {
			return;
		}
		vo.getAttachList().forEach(attach->{
			attach.setQno(vo.getQno());
			attachMapper.insert(attach);
		});
	
	}

	@Override
	public QnaVO get(Long qno) {
		log.info("2) 서비스에서 1개 get ");
		return mapper.get(qno);
	}

	
	@Override
	public int register(QnaReplyVO vo) {
		log.info("2) 서비스에서 reply insert ");
		return replyMapper.register(vo);
	}

	@Override
	public List<QnaReplyVO> replyList(Long qno) {
		log.info("2) 서비스에서 reply 목록 ");
		return replyMapper.replyList(qno);
	}

	
	@Override
	public int update(QnaVO vo) {

		return mapper.update(vo);
	}

	@Override
	public int deleteByQno(Long qno) {
		log.info("2) 서비스에서 qna 삭제");
		return mapper.deleteByQno(qno);
		
	}

	@Override
	public int replyDelete(Long rno) {
		log.info("2) 서비스에서 reply 삭제");
		return replyMapper.replyDelete(rno);
	}

	@Override
	public int replyUpdate(QnaReplyVO vo) {
		log.info("2) 서비스에서 reply 수정");
		return replyMapper.replyUpdate(vo);
	}

	@Override
	public int totalCount(Criteria cri) {
		log.info("2) 서비스에서 전체 게시물 갯수 조회");
		return mapper.totalCount(cri);
	}

	@Override
	public List<QnaVO> listqnaWithPaging(Criteria cri) {
		log.info("2) 서비스에서 전체 게시물 조회");
		return mapper.listqnaWithPaging(cri);
	}

	@Override
	public List<QnaAttachDTO> getAttachList(Long qno) {
		log.info("2) 서비스에서 첨부파일 조회");
		return attachMapper.findByQno(qno);
	}

	@Override
	public int replyCount(Long qno) {
		log.info("2) 서비스에서 댓글 갯수 조회");
		return replyMapper.count(qno);
	}

	@Override
	public int attachCount(Long qno) {
		log.info("2) 서비스에서 댓글 갯수 조회");
		return attachMapper.cnt(qno);
	}

	@Override
	public List<QnaReplyVO> myReply(String r_writer) {
		// TODO Auto-generated method stub
		return replyMapper.myReply(r_writer);
	}

	@Override
	public List<QnaVO> myQna(String writer) {
		// TODO Auto-generated method stub
		return mapper.myQna(writer);
	}


	@Override
	public int updateHit(Long qno, Long hit) {
		// TODO Auto-generated method stub
		return mapper.updateHit(qno, hit);
	}

	@Override
	public int Qnatotal(Criteria cri, String writer) {
		// TODO Auto-generated method stub
		return mapper.Qnatotal(cri, writer);
	}

	@Override
	public int replyTotal(Criteria cri, String r_writer) {
		// TODO Auto-generated method stub
		return replyMapper.replyTotal(cri, r_writer);
	}

	@Override
	public void insert(QnaAttachDTO dto) {
		// TODO Auto-generated method stub
		attachMapper.insert(dto);
	}

	@Override
	public void delete(String uuid) {
		// TODO Auto-generated method stub
		attachMapper.delete(uuid);
	}

	@Override
	public List<QnaAttachDTO> findByQno(Long Qno) {
		// TODO Auto-generated method stub
		return attachMapper.findByQno(Qno);
	}

	@Override
	public void deleteAll(Long Qno) {
		// TODO Auto-generated method stub
		attachMapper.deleteAll(Qno);
	}

	@Override
	public int cnt(Long Qno) {
		// TODO Auto-generated method stub
		return attachMapper.cnt(Qno);
	}

	


	
}
