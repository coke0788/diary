package com.gd.diary.controller;

import com.gd.diary.service.DiaryService;
import com.gd.diary.vo.Todo;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class DiaryController {
  private static final Logger log = LoggerFactory.getLogger(com.gd.diary.controller.DiaryController.class);
  
  @Autowired
  DiaryService diaryService;
  
  @GetMapping({"/diary"})
  public String getDiary(Model model, @RequestParam(value = "memberNo", required = true) int memberNo, @RequestParam(value = "targetYear", defaultValue = "") String targetYear, @RequestParam(value = "targetMonth", defaultValue = "") String targetMonth) {
    Map<String, Object> map = new HashMap<>();
    Calendar target = Calendar.getInstance();
    log.debug("===================memberNo:" + memberNo);
    if (!targetYear.equals(""))
      target.set(1, Integer.parseInt(targetYear)); 
    if (!targetMonth.equals(""))
      target.set(2, Integer.parseInt(targetMonth)); 
    target.set(5, 1);
    int startBlank = target.get(7) - 1;
    int endDay = target.getActualMaximum(5);
    int endBlank = 0;
    if ((startBlank + endDay) % 7 != 0)
      endBlank = 7 - (startBlank + endDay) % 7; 
    map.put("targetYear", Integer.valueOf(target.get(1)));
    map.put("targetMonth", Integer.valueOf(target.get(2) + 1));
    map.put("startBlank", Integer.valueOf(startBlank));
    map.put("endDay", Integer.valueOf(endDay));
    map.put("endBlank", Integer.valueOf(endBlank));
    map.put("memberNo", Integer.valueOf(memberNo));
    List<Todo> todoList = this.diaryService.todoList(map);
    List<Map<String, Object>> ddayList = this.diaryService.ddayList(memberNo);
    map.put("targetMonth", Integer.valueOf(target.get(2)));
    model.addAttribute("todoList", todoList);
    model.addAttribute("ddayList", ddayList);
    model.addAttribute("memberNo", Integer.valueOf(memberNo));
    model.addAttribute("diaryMap", map);
    log.debug("=================todoList:" + todoList);
    log.debug("=================ddayList:" + ddayList);
    return "diary";
  }
  
  @GetMapping({"/todoOne"})
  public String todoOne(Model model, @RequestParam(value = "memberNo", required = true) int memberNo, @RequestParam(value = "todoNo", required = true) int todoNo) {
    log.debug("=================todoNo:" + todoNo);
    Map<String, Object> map = this.diaryService.getTodoOne(todoNo);
    model.addAttribute("todo", map);
    model.addAttribute("memberNo", Integer.valueOf(memberNo));
    model.addAttribute("todoNo", Integer.valueOf(todoNo));
    log.debug("=================todoList:" + map);
    return "todoOne";
  }
  
  @GetMapping({"/addTodo"})
  public String addTodo(Model model, @RequestParam(value = "memberNo", required = true) int memberNo,
		  							@RequestParam(value = "year", required = true) int year,
		  							@RequestParam(value = "month", required = true) int month,
		  							@RequestParam(value = "day", required = true) int day) {
	String todoDate = year+"-"+month+"-"+day;
	model.addAttribute("todoDate", todoDate);
	model.addAttribute("memberNo", memberNo);
    return "addTodo";
  }
  
  @PostMapping({"/addTodo"})
  public String addTodo(@RequestParam(value = "memberNo", required = true) int memberNo, @RequestParam(value = "todoDate", required = true) String todoDate, @RequestParam(value = "todoTitle", required = true) String todoTitle, @RequestParam(value = "todoContent", required = true) String todoContent, @RequestParam(value = "todoFontColor", required = true) String todoFontColor) {
    Todo todo = new Todo();
    todo.setMemberNo(memberNo);
    todo.setTodoContent(todoContent);
    todo.setTodoDate(todoDate);
    todo.setTodoFontColor(todoFontColor);
    todo.setTodoTitle(todoTitle);
    this.diaryService.addTodo(todo);
    log.debug("=================todo"+ todo);
    return "redirect:/auth/diary?memberNo=" + memberNo;
  }
}
