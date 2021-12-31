package cn.ffcs.dcl.utils;


import java.io.Serializable;

import javax.swing.border.Border;


public class ExportCell implements Serializable{
	private static final long serialVersionUID = 8242475693727091019L;

	public static final String BOTTOM="bottom";
	public static final String CENTER= "center";
	public static final String TOP="top";
	public static final String LEFT="left";
	public static final String RIGHT="right";
	private int col;//列
	private int row;//行
	private String content;//内容
	private Integer sheet=0;//工作表
	private String horizontal;//水平
	private String vertical;//垂直
	private boolean setHV = false;//除列/行/内容 外是否设置其他参数
	private boolean setCellFormat = true;//单元格样式
	private Border borderLine = null;
	
	public ExportCell(int col, int row, String content, Integer sheet,
			String horizontal, String vertical,Border borderLine) {
		super();
		this.col = col;
		this.row = row;
		this.content = content;
		this.sheet = sheet;
		this.horizontal = horizontal;
		this.vertical = vertical;
		this.setHV = true;
		this.borderLine = borderLine;
	}
	public ExportCell(int col, int row, String content,Border borderLine) {
		super();
		this.col = col;
		this.row = row;this.setHV = true;
		this.content = content;this.borderLine = borderLine;
	}
	
	
	public ExportCell(int col, int row, String content, boolean setCellFormat,Border borderLine) {
		super();
		this.col = col;
		this.row = row;
		this.content = content;
		this.setCellFormat = setCellFormat;
		this.setHV = true;this.borderLine = borderLine;
	}
	
	public ExportCell(int col, int row, String content, Integer sheet,
			String horizontal, String vertical) {
		super();
		this.col = col;
		this.row = row;
		this.content = content;
		this.sheet = sheet;
		this.horizontal = horizontal;
		this.vertical = vertical;
		this.setHV = true;
	}
	public ExportCell(int col, int row, String content) {
		super();
		this.col = col;
		this.row = row;
		this.content = content;
	}
	
	
	public ExportCell(int col, int row, String content, boolean setCellFormat) {
		super();
		this.col = col;
		this.row = row;
		this.content = content;
		this.setCellFormat = setCellFormat;
		this.setHV = true;
	}
	
		
	public Border getBorderLine() {
		return borderLine;
	}
	public void setBorderLine(Border borderLine) {
		this.borderLine = borderLine;
	}
	public boolean isSetHV() {
		return setHV;
	}
	public void setSetHV(boolean setHV) {
		this.setHV = setHV;
	}
	public boolean isSetCellFormat() {
		return setCellFormat;
	}
	public void setSetCellFormat(boolean setCellFormat) {
		this.setCellFormat = setCellFormat;
	}
	public ExportCell() {
		super();
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getSheet() {
		return sheet;
	}
	public void setSheet(Integer sheet) {
		this.sheet = sheet;
	}
	public String getHorizontal() {
		if("无".equals(content)){
			return CENTER;
		}
		return horizontal;
	}
	public void setHorizontal(String horizontal) {
		this.horizontal = horizontal;
	}
	public String getVertical() {
		return vertical;
	}
	public void setVertical(String vertical) {
		this.vertical = vertical;
	}
	
	
}
