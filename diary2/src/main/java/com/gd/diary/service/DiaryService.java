package com.gd.diary.service;

import com.gd.diary.mapper.DiaryMapper;
import com.gd.diary.vo.Todo;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DiaryService {
  private static final Logger log = LoggerFactory.getLogger(com.gd.diary.service.DiaryService.class);
  
  @Autowired
  DiaryMapper diaryMapper;
  
  public List<Todo> todoList(Map<String, Object> map) {
    List<Todo> list = this.diaryMapper.selectTodoByDate(map);
    log.debug("===================map:" + map);
    log.debug("===================todo list:" + list);
    return list;
  }
  
  public List<Map<String, Object>> ddayList(int memberNo) {
    List<Map<String, Object>> list = this.diaryMapper.selectTodoDdayList(memberNo);
    return list;
  }
  
  public Map<String, Object> getTodoOne(int todoNo) {
    Map<String, Object> map = this.diaryMapper.selectTodoOne(todoNo);
    log.debug("==================todoNo:" + todoNo);
    log.debug("==================todo상세보기"+ map);
    return map;
  }
  
  public void addTodo(Todo todo) {
    this.diaryMapper.insertTodo(todo);
  }
}
