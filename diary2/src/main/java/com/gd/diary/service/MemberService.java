package com.gd.diary.service;

import com.gd.diary.mapper.MemberMapper;
import com.gd.diary.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberService {
  private static final Logger log = LoggerFactory.getLogger(com.gd.diary.service.MemberService.class);
  
  @Autowired
  MemberMapper memberMapper;
  
  public Member login(Member member) {
    return this.memberMapper.selectMemberByKey(member);
  }
  
  public void removeMember(Member member) {
    int row = this.memberMapper.deleteMemberByKey(member);
    log.debug("======================회원 삭제:"+ row);
  }
  
  public int getMember(Member member) {
    int row = this.memberMapper.selectMember(member.getMemberId());
    log.debug("====================회원 중복체크"+ row);
    return row;
  }
  
  public void insertMember(Member member) {
    this.memberMapper.insertMember(member);
    log.debug("======================회원 등록"+member);
  }
  
  public void modifyMember(Member member) {
    this.memberMapper.updateMemberByKey(member);
    log.debug("======================회원 수정"+ member);
  }
}
