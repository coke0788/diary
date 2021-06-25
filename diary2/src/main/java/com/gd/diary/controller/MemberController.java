package com.gd.diary.controller;

import com.gd.diary.service.MemberService;
import com.gd.diary.vo.Member;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Transactional
@RequestMapping({"/auth"})
public class MemberController {
  
  @Autowired
  MemberService memberService;
  
  @GetMapping({"/modifyMember"})
  public String modifyMember(Model model, @RequestParam("memberNo") int memberNo) {
    model.addAttribute("memberNo", Integer.valueOf(memberNo));
    return "modifyMember";
  }
  
  @PostMapping({"/modifyMember"})
  public String modifyMember(@RequestParam("memberNo") int memberNo, @RequestParam("memberPw") String memberPw) {
    Member member = new Member();
    member.setMemberNo(memberNo);
    member.setMemberPw(memberPw);
    this.memberService.modifyMember(member);
    return "redirect:/login";
  }
  
  @GetMapping({"/removeMember"})
  public String removeMember(Model model, @RequestParam("memberNo") int memberNo) {
    model.addAttribute("memberNo", Integer.valueOf(memberNo));
    return "removeMember";
  }
  
  @PostMapping({"/removeMember"})
  public String removeMember(HttpSession session, @RequestParam("memberNo") int memberNo, @RequestParam("memberPw") String memberPw) {
    Member member = new Member();
    member.setMemberNo(memberNo);
    member.setMemberPw(memberPw);
    session.invalidate();
    this.memberService.removeMember(member);
    return "redirect:/login";
  }
}
