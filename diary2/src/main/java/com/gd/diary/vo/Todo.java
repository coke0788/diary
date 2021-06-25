package com.gd.diary.vo;

import lombok.Data;

@Data
public class Todo {
	  private int todoNo;
	  private int memberNo;
	  private String todoDate;
	  private String todoTitle;
	  private String todoContent;
	  private String todoFontColor;
	  private String todoAddDate;
}
