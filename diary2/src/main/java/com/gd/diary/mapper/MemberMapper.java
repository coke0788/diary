package com.gd.diary.mapper;

import com.gd.diary.vo.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
  Member selectMemberByKey(Member paramMember);
  int selectMember(String paramString);
  int insertMember(Member paramMember);
  int deleteMemberByKey(Member paramMember);
  int updateMemberByKey(Member paramMember);
}
