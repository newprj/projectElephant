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

	@Transactional
	@Override
	public boolean update(QnaVO vo) {
		log.info("2) 서비스에서 qna 수정"+vo);
		attachMapper.deleteAll(vo.getQno());
		
		boolean modifyResult=mapper.update(vo)==1;
		if(modifyResult && vo.getAttachList() !=null && vo.getAttachList().size()>0) {
			vo.getAttachList().forEach(i->{
				i.setQno(vo.getQno());
				attachMapper.insert(i);
			});
		}
		return modifyResult;
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

	


	
}
