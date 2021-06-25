package com.gd.diary.mapper;

import com.gd.diary.vo.Todo;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DiaryMapper {
  List<Todo> selectTodoByDate(Map<String, Object> paramMap);
  Map<String, Object> selectTodoOne(int paramInt);
  List<Map<String, Object>> selectTodoDdayList(int paramInt);
  int deleteTodoByMember(int paramInt);
  int deleteTodoOne(Map<String, Object> paramMap);
  int insertTodo(Todo paramTodo);
  int updateTodoOne(Map<String, Object> paramMap);
}
