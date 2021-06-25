package com.gd.diary.controller;

import com.gd.diary.service.MemberService;
import com.gd.diary.vo.Member;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Transactional
public class HomeController {
  private static final Logger log = LoggerFactory.getLogger(com.gd.diary.controller.HomeController.class);
  
  @Autowired
  MemberService memberService;
  
  @GetMapping({"/", "/login"})
  public String home() {
    log.debug("home");
    return "login";
  }
  
  @GetMapping({"/auth/logout"})
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/login";
  }
  
  @PostMapping({"/login"})
  public String login(HttpSession session, Member member) {
    log.debug("=========== member : " + member.toString());
    Member sessionMember = this.memberService.login(member);
    log.debug("=========== loginmember : " + sessionMember);
    if (sessionMember != null)
      session.setAttribute("sessionMember", sessionMember); 
    return "redirect:/login";
  }
  
  @GetMapping({"/insert"})
  public String insert() {
    return "insert";
  }
  
  @PostMapping({"/insert"})
  public String insertCheck(@RequestParam("memberId") String memberId, @RequestParam("memberPw") String memberPw) {
    Member member = new Member();
    member.setMemberId(memberId);
    member.setMemberPw(memberPw);
    int row = this.memberService.getMember(member);
    log.debug("====================row"+ row);
    if (row == 1)
      return "redirect:/insert"; 
    this.memberService.insertMember(member);
    return "redirect:/login";
  }
}
