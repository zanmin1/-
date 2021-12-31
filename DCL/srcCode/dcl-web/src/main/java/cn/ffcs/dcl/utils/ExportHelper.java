package cn.ffcs.dcl.utils;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import cn.ffcs.common.CommonFunctions;
import cn.ffcs.common.ExcelCellData;
import cn.ffcs.common.ExcelTable;
import freemarker.template.Configuration;
import freemarker.template.Template;
import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ExportHelper {

	private HttpServletRequest request;
	private HttpServletResponse response;
	private Configuration configuration;

	public ExportHelper(HttpServletRequest request, HttpServletResponse response) throws IOException {
		this.request = request;
		this.response = response;
		FreeMarkerConfigurer freemarkerConfig = new FreeMarkerConfigurer();
		configuration = freemarkerConfig.getConfiguration();
	}
	public ExportHelper() {
	}

	
	/**
	 * 
	 * @param fileName
	 * @param templatePath
	 * @param dataMap
	 * @throws Exception
	 */
	public void exportExcel(String fileName, String templatePath, Map<String, Object> dataMap) throws Exception {
		if (StringUtils.isBlank(templatePath)) throw new Exception("未指明模板路径！");
		PrintWriter out = response.getWriter();
		try {
			StringBuffer sb = this.getTemplateHtml(templatePath, dataMap);
			this.setOutputParams(fileName);
			out.write(sb.toString());
			out.flush();
		}catch(Exception e){
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	/**
	 * 
	 * @param fileName
	 * @param keys
	 * 			String[]：长度为2；第一位：表头名称，第二位：数据源key；
	 * @param vals
	 * @throws Exception
	 */
	public void exportExcel(String fileName, List<String[]> keys, List<Map<String, Object>> vals) throws Exception {
		if (StringUtils.isNotBlank(fileName)) {
			if (keys != null && keys.size() > 0) {
				ExcelTable excelTable = new ExcelTable(fileName);
				for (int i = 0; i < keys.size(); i++) {
					excelTable.addData(new ExcelCellData(0, i, keys.get(i)[0]));
				}
				if (vals != null && vals.size() > 0) {
					for (int i = 1; i <= vals.size(); i++) {
						Map<String, Object> map = vals.get(i - 1);
						for (int j = 0; j < keys.size(); j++) {
							Object obj = map.get(keys.get(j)[1]);
							excelTable.addData(new ExcelCellData(i, j, obj == null ? "" : String.valueOf(obj)));
						}
					}
					this.exportExcel(excelTable);
				} else {
					this.printMsg("无数据可导出！");
				}
			} else {
				throw new Exception("导出出错，请指定导出表头字段与数据源对应关系！");
			}
		} else {
			throw new Exception("导出出错，请指定导出文件名称！");
		}
	}

	/**
	 * 
	 * @param excelTable
	 * @throws Exception
	 */
	public void exportExcel(ExcelTable excelTable) throws Exception {
		ServletOutputStream outputStream = response.getOutputStream();
		response.reset();// 清空输出流
		if (excelTable != null) {
			this.setOutputParams(excelTable.getTableName());
			WritableWorkbook workbook = null;
			WorkbookSettings settings = new WorkbookSettings();
			settings.setWriteAccess(null);
			workbook = Workbook.createWorkbook(outputStream, settings);
			WritableSheet wsheet = workbook.createSheet(excelTable.getTableName(), 0);
			for (ExcelCellData data : excelTable.getDataList())
				wsheet.addCell(new Label(data.getCol(), data.getRow(), data.getValue())); // 列号 行号 值
			// -- 单元格合并
			try {
				if (excelTable.getMergeCells() != null && excelTable.getMergeCells().size() > 0) {
					for (String mc : excelTable.getMergeCells()) {
						String[] rowColStr = mc.split(",");
						if (rowColStr.length == 4)
							wsheet.mergeCells(Integer.parseInt(rowColStr[0]), Integer.parseInt(rowColStr[1]),
									Integer.parseInt(rowColStr[2]), Integer.parseInt(rowColStr[3]));
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			workbook.write();
			workbook.close();
		} else {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			String content = "<script type='text/javascript'>alert('无数据可导出');window.close();</script>";
			outputStream.write(content.getBytes("UTF-8"));
		}
		outputStream.flush();
		outputStream.close();
	}

	public void printMsg(String msg) throws Exception {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String content = "<script type='text/javascript'>alert('" + msg + "');window.close();</script>";
		ServletOutputStream outputStream = response.getOutputStream();
		outputStream.write(content.getBytes("UTF-8"));
		outputStream.flush();
		outputStream.close();
	}
	
	private StringBuffer getTemplateHtml(String templateName, Map<String, Object> dataMap) throws Exception {
		Template t = null;
		StringWriter writer = null;
		try {
			t = configuration.getTemplate(templateName);
			writer = new StringWriter(5 * 1024);
			t.process(dataMap, writer);
			return writer.getBuffer();
		} finally {
			writer.close();
		}
	}
	
	private void setOutputParams(String fileName) {
		String userAgent = request.getHeader("User-Agent");
		String filename = CommonFunctions.buildFileNameByUa(fileName + ".xls", userAgent);
		response.setHeader("Content-disposition", ("attachment; " + filename));// 设定输出文件头
		response.setContentType("application/msexcel");// 定义输出类型
	}
	
	/**
	 * 人口简历类 excel导出(不适合大数据量列表导出)
	 * @param fileName
	 * @param templatePath
	 * @param map 
	 * {	sheetCount	共有几个动态插入列表(从1开始) 
	 * 
	 * 	例:	sheet1(int)	第几个表格
	 * 		insertRowNum1(int)	从第几行插入(从0开始)
	 * 		rowCount1(int)		插入多少行
	 * 		mergeList1(list<int[]>)	合并单元格 int[起始列,起始行,结束列,结束行]
	 * 
	 * 		sheet2(int)	第几个表格
	 * 		insertRowNum2(int)	从第几行插入(从0开始)
	 * 		rowCount2(int)		插入多少行
	 * 		mergeList2(list<int[]>)	合并单元格 int[起始列,起始行,结束列,结束行]
	 *}
	 * @throws Exception
	 */
	public void exportExcelByCell(String fileName, String templatePath,List<ExportCell> list,Map<String,Object> map) throws Exception {
		if (StringUtils.isBlank(templatePath)) throw new Exception("未指明模板路径！");
		Map<String,VerticalAlignment> vaMap = new HashMap<String, VerticalAlignment>();
		vaMap.put("bottom", VerticalAlignment.BOTTOM);vaMap.put("center", VerticalAlignment.CENTRE);vaMap.put("top", VerticalAlignment.TOP);
		Map<String,Alignment> aMap = new HashMap<String, Alignment>();
		aMap.put("left", Alignment.LEFT);aMap.put("center", Alignment.CENTRE); aMap.put("right", Alignment.RIGHT);
		response.reset();// 清空输出流
		@SuppressWarnings("deprecation")
		String path = request.getRealPath("") +templatePath ;
        File from=new File(path);
        File file = new File(path.substring(0, path.lastIndexOf("."))+System.currentTimeMillis() + ".xls");
        Workbook wb = Workbook.getWorkbook(from); // 获得原始文档  
		 WritableWorkbook workbook = Workbook.createWorkbook(file,wb);
        WritableSheet wsheet = workbook.getSheet(0);
        //wsheet.mergeCells(arg0, arg1, arg2, arg3)
        WritableFont font= new WritableFont(WritableFont.createFont("宋体"),10,WritableFont.NO_BOLD);   
		WritableCellFormat format=new WritableCellFormat(font);
		format.setBorder(Border.ALL, BorderLineStyle.THIN);
		format.setVerticalAlignment(VerticalAlignment.CENTRE);
		format.setAlignment(Alignment.CENTRE);
		format.setWrap(true);//自动换行
		if(map != null && map.get("sheetCount") != null){
			int sheetCount = (int) map.get("sheetCount");
			for(int j=1;j<=sheetCount;j++){
				WritableSheet wsheet1 = workbook.getSheet((int) map.get("sheet"+j));
				if(map.get("insertRowNum"+j) != null && map.get("rowCount"+j)!= null){
					int rowNum = (int) map.get("insertRowNum"+j);
					for(int i=0,l=(int) map.get("rowCount"+j);i<l;i++){
						wsheet1.insertRow(rowNum);
						wsheet1.setRowView(rowNum, 400, false);
					}
				}
				if(map.get("mergeList"+j) != null){
					@SuppressWarnings("unchecked")
					List<int[]> mergeList = (List<int[]>) map.get("mergeList"+j);
					for (int[] m : mergeList) {
						wsheet1.mergeCells(m[0], m[1], m[2], m[3]);
					}
				}
			}
		}
		//wsheet.insertRow(2);
//	    wsheet.insertColumn(1);
		for (ExportCell ec : list) {
			if(ec.isSetHV()){
				WritableSheet wsheet1 = workbook.getSheet(ec.getSheet());
		       	WritableFont font1= new WritableFont(WritableFont.createFont("宋体"),12,WritableFont.NO_BOLD);   
				WritableCellFormat format1=new WritableCellFormat(font1);
				if(ec.isSetCellFormat()){
					format1.setBorder(Border.ALL, BorderLineStyle.THIN);
				}
				if(ec.getBorderLine()!=null){
					format1.setBorder(Border.RIGHT, BorderLineStyle.MEDIUM);
				}
				format1.setWrap(true);
				if(ec.getVertical() !=null){
					format1.setVerticalAlignment(vaMap.get(ec.getVertical()));
				}else{
					format1.setVerticalAlignment(VerticalAlignment.CENTRE);
				}
				if(ec.getHorizontal()!=null){
					format1.setAlignment(aMap.get(ec.getHorizontal()));
				}else{
					format1.setAlignment(Alignment.CENTRE);
				}
				
				wsheet1.addCell(new Label(ec.getCol(),ec.getRow(),ec.getContent(),format1));
			}else{
				wsheet.addCell(new Label(ec.getCol(),ec.getRow(),ec.getContent(),format));
			}
		}
		workbook.write();  
		workbook.close();
		
		setOutputParams(fileName);
		InputStream fis = new BufferedInputStream(new FileInputStream(file));
        byte[] buffer = new byte[fis.available()];
        fis.read(buffer);
        fis.close();
        OutputStream os = new BufferedOutputStream(response.getOutputStream());
        os.write(buffer);
        os.flush();
        file.delete();
	}

	

	public void exportExcelByCell1(String fileName, String templatePath,List<ExportCell> list,Map<String,Object> map) throws Exception {
		if (StringUtils.isBlank(templatePath)) throw new Exception("未指明模板路径！");
		Map<String,VerticalAlignment> vaMap = new HashMap<String, VerticalAlignment>();
		vaMap.put("bottom", VerticalAlignment.BOTTOM);vaMap.put("center", VerticalAlignment.CENTRE);vaMap.put("top", VerticalAlignment.TOP);
		Map<String,Alignment> aMap = new HashMap<String, Alignment>();
		aMap.put("left", Alignment.LEFT);aMap.put("center", Alignment.CENTRE); aMap.put("right", Alignment.RIGHT);
		
		String path = templatePath ;
        File from=new File(path);
        File file = new File(path.substring(0, path.indexOf("."))+System.currentTimeMillis() + ".xls");
        Workbook wb = Workbook.getWorkbook(from); // 获得原始文档  
		 WritableWorkbook workbook = Workbook.createWorkbook(file,wb);
        WritableSheet wsheet = workbook.getSheet(0);
        //wsheet.mergeCells(arg0, arg1, arg2, arg3)
        WritableFont font= new WritableFont(WritableFont.createFont("宋体"),10,WritableFont.NO_BOLD);   
		WritableCellFormat format=new WritableCellFormat(font);
		format.setBorder(Border.ALL, BorderLineStyle.THIN);
		format.setVerticalAlignment(VerticalAlignment.CENTRE);
		format.setAlignment(Alignment.CENTRE);
		format.setWrap(true);//自动换行
		if(map != null && map.get("sheetCount") != null){
			int sheetCount = (int) map.get("sheetCount");
			for(int j=1;j<=sheetCount;j++){
				WritableSheet wsheet1 = workbook.getSheet((int) map.get("sheet"+j));
				if(map.get("insertRowNum"+j) != null && map.get("rowCount"+j)!= null){
					int rowNum = (int) map.get("insertRowNum"+j);
					for(int i=0,l=(int) map.get("rowCount"+j);i<l;i++){
						wsheet1.insertRow(rowNum);
					}
				}
				if(map.get("mergeList"+j) != null){
					@SuppressWarnings("unchecked")
					List<int[]> mergeList = (List<int[]>) map.get("mergeList"+j);
					for (int[] m : mergeList) {
						wsheet1.mergeCells(m[0], m[1], m[2], m[3]);
					}
				}
			}
		}
		//wsheet.insertRow(2);
//	    wsheet.insertColumn(1);
		for (ExportCell ec : list) {
			if(ec.isSetHV()){
				WritableSheet wsheet1 = workbook.getSheet(ec.getSheet());
		       	WritableFont font1= new WritableFont(WritableFont.createFont("宋体"),10,WritableFont.NO_BOLD);   
				WritableCellFormat format1=new WritableCellFormat(font1);
				if(ec.isSetCellFormat()){
					format1.setBorder(Border.ALL, BorderLineStyle.THIN);
				}
				if(ec.isSetCellFormat()){
					format1.setBorder(Border.RIGHT, BorderLineStyle.MEDIUM);
				}
				format1.setWrap(true);
				if(ec.getVertical() !=null){
					format1.setVerticalAlignment(vaMap.get(ec.getVertical()));
				}else{
					format1.setVerticalAlignment(VerticalAlignment.CENTRE);
				}
				if(ec.getHorizontal()!=null){
					format1.setAlignment(aMap.get(ec.getHorizontal()));
				}else{
					format1.setAlignment(Alignment.CENTRE);
				}
				
				wsheet1.addCell(new Label(ec.getCol(),ec.getRow(),ec.getContent(),format1));
			}else{
				wsheet.addCell(new Label(ec.getCol(),ec.getRow(),ec.getContent(),format));
			}
		}
		workbook.write();  
		workbook.close();
		
		
	}
		public static void main(String[] args) throws Exception {
		Map<String,Object> map = new HashMap<String, Object>();
		List<ExportCell> list = new ArrayList<ExportCell>();
		int sheetNum=1;
		List<String> representList = new ArrayList<String>();
		//representList.add("");representList.add("");representList.add("");
		//representList.add("");representList.add("");representList.add("");
		//representList.add("");representList.add("");representList.add("");
		//representList.add("");representList.add("");
		int representLength = representList.size();
		int row = 31;
		
		if(representLength>1){
			List<int[]> mergeList = new ArrayList<int[]>();
			for(int i=0,l=representLength-1;i<l;i++){
				mergeList.add(new int[]{3,row,4,row});
				mergeList.add(new int[]{5,row,6,row});
				mergeList.add(new int[]{9,row,11,row});
				row++;
			}
			map.put("mergeList"+sheetNum, mergeList);
			map.put("sheet"+sheetNum, 0);
			map.put("insertRowNum"+sheetNum, 31);
			map.put("rowCount"+sheetNum, representLength-1);
			map.put("sheetCount", sheetNum);
			sheetNum++;
		}
		row = 31;
		for(int i=0;i<representLength;i++){//两委成员简况
			list.add(new ExportCell(1,row,"姓名"+i));//姓名	
			list.add(new ExportCell(2,row,"书记"));//职务
			list.add(new ExportCell(3,row,"1000.11"));//出生年月
			list.add(new ExportCell(5,row,"2222.33"));//入党时间
			list.add(new ExportCell(7,row,"初中"));//文化程度
			list.add(new ExportCell(8,row,"男"));//性别
			list.add(new ExportCell(9,row,"问"));//村外职业
			list.add(new ExportCell(12,row,"是"));//党代表
			list.add(new ExportCell(13,row,"是"));//人大代表
			list.add(new ExportCell(14,row," 是"));//政协委员
			list.add(new ExportCell(15,row,"是"));//劳模
			row++;
		}
		//row=32;
		//这行到 ‘本村（社区）其他现任市级以上“两代表一委员”名单’
		row = representLength ==0?row+1:row;//没有 两委成员列表
		
		
		representList = new ArrayList<String>();
		representList.add("");representList.add("");representList.add("");
		representList.add("");representList.add("");representList.add("");
		//representList.add("");representList.add("");representList.add("");
		//representList.add("");representList.add("");
		representLength = representList.size();
		row+=2;//34	
		if(representLength>1){
			List<int[]> mergeList = new ArrayList<int[]>();
			map.put("mergeList"+sheetNum, mergeList);
			map.put("sheet"+sheetNum, 0);
			map.put("insertRowNum"+sheetNum, row);
			map.put("rowCount"+sheetNum, representLength-1);
			map.put("sheetCount", sheetNum);
			sheetNum++;
			for(int i=0,l=representLength-1;i<l;i++){
				mergeList.add(new int[]{2,row,3,row});
				mergeList.add(new int[]{4,row,5,row});
				mergeList.add(new int[]{6,row,7,row});
				mergeList.add(new int[]{9,row,11,row});
				row++;
			}
			
		}
		row = row - representLength+1;
		for(int i=0;i<representLength;i++){//两代表一委员
			list.add(new ExportCell(1,row,"姓名"+i));//姓名	
			list.add(new ExportCell(2,row,"1000.11"));//出生年月
			list.add(new ExportCell(4,row,"2222.33"));//入党时间
			list.add(new ExportCell(6,row,"初中"));//文化程度
			list.add(new ExportCell(8,row,"男"));//性别
			list.add(new ExportCell(9,row,"问"));//村外职业
			list.add(new ExportCell(12,row,"是"));//党代表
			list.add(new ExportCell(13,row,"是"));//人大代表
			list.add(new ExportCell(14,row," 是"));//政协委员
			list.add(new ExportCell(15,row,"是"));//劳模
			row++;
		}
		row = representLength ==0?row+1:row;// 两代表一委员列表
							//主要产业//劳动力就业率//资源条件
		int[] nextRowNum = {0,row+3,	row+7,row+10,row+12,row+18};
		//list.add(new ExportCell(1,nextRowNum[0]," 无",0,ExportCell.LEFT,null));//本村（社区）其他现任市级以上“两代表一委员”名单
		
		list.add(new ExportCell(1,nextRowNum[1],"鞋服\n商场\n服务"));//主要产业
		list.add(new ExportCell(2,nextRowNum[1],"932个"));//企业数	
		list.add(new ExportCell(3,nextRowNum[1],"3个"));//农业
		list.add(new ExportCell(4,nextRowNum[1],"1.爱乐假日酒店\n2.阳光商务酒店\n3.兴泰商务酒店\n4.新华都百货\n5.马哥孛罗酒店",0,ExportCell.LEFT,null));//知名企业
		list.add(new ExportCell(8,nextRowNum[1],"无",0,ExportCell.LEFT,null));//农民合作社
		list.add(new ExportCell(12,nextRowNum[1],"1"));//商场数
		list.add(new ExportCell(13,nextRowNum[1],"2"));//店铺数
		list.add(new ExportCell(14,nextRowNum[1],"3"));//厂矿数
		list.add(new ExportCell(15,nextRowNum[1],"4"));//其他
		
		list.add(new ExportCell(3,nextRowNum[2]-2,"2014年 村财总收入(万元)"));//N年 	 村财总收入(万元)
		list.add(new ExportCell(15,nextRowNum[2]-1,"2014年 经营收入"));//N年  经营收入
		
		//村财收入
		list.add(new ExportCell(1,nextRowNum[2],"75.0%"));//劳动力就业率
		list.add(new ExportCell(2,nextRowNum[2],"25000"));//人均可支配收入数
		list.add(new ExportCell(3,nextRowNum[2],"1776.2万"));//村财总收入（万元
		list.add(new ExportCell(5,nextRowNum[2],"900万万"));//自营收入				
		list.add(new ExportCell(6,nextRowNum[2],"386.9万"));//上级补助
		list.add(new ExportCell(7,nextRowNum[2],"152万"));//社会捐赠
		list.add(new ExportCell(8,nextRowNum[2],"无"));//土地补偿
		list.add(new ExportCell(9,nextRowNum[2],"无"));//其他
		list.add(new ExportCell(10,nextRowNum[2],"是"));//是否成立投资公司
		
		representList = new ArrayList<String>();
		representList.add("");representList.add("");
		representList.add("");
		representLength = representList.size();
		row=nextRowNum[2];//42	
		if(representLength>1){
			List<int[]> mergeList = new ArrayList<int[]>();
			map.put("mergeList"+sheetNum, mergeList);
			map.put("sheet"+sheetNum, 0);
			map.put("insertRowNum"+sheetNum, row);
			map.put("rowCount"+sheetNum, representLength-1);
			map.put("sheetCount", sheetNum);
			sheetNum++;
			nextRowNum[0] = row+representLength-1;//单纯当变量用 
			for(int i=1,l=10;i<=l;i++){
				if(i==3 || i==4){
					continue;
				}
				mergeList.add(new int[]{i,row,i,nextRowNum[0]});
			}
			mergeList.add(new int[]{3,row,4,nextRowNum[0]});//村财总收入（万元） 再合并单元格
			for(int i=0,l=representLength-1;i<l;i++){
				mergeList.add(new int[]{11,row,13,row});//是否成立投资公司 (名称)
				row++;
			}
			
		}else{
			List<int[]> mergeList = new ArrayList<int[]>();
			mergeList.add(new int[]{3,row,4,row});//村财总收入（万元） 再合并单元格
			map.put("mergeList"+sheetNum, mergeList);
			map.put("sheet"+sheetNum, 0); 
			map.put("sheetCount", sheetNum);
			sheetNum++;
		}
		row = row - representLength+1;
		for(int i=0;i<representLength;i++){//是否成立投资公司
			list.add(new ExportCell(11,row,"公司"+i));//名称
			list.add(new ExportCell(14,row,"1000.11万"));//注册资本
			list.add(new ExportCell(15,row,"2222.33万"));//经营收入
			row++;
		}
		nextRowNum =new int[]{0,0,0,row+2,row+4,row+10};	
		//是否拥有集体物业	/村企合作/产权置换
		list.add(new ExportCell(5,nextRowNum[3]-1,"2014经营收入"));//N年 经营收入
		
		list.add(new ExportCell(1,nextRowNum[3],"是"));//是否拥有集体物业
		list.add(new ExportCell(8,nextRowNum[3],"是"));//村企合作
		list.add(new ExportCell(11,nextRowNum[3],"是"));//产权置换
		
		representList = new ArrayList<String>();
		representList.add("");
		representLength = representList.size();
		row=nextRowNum[3];//46	
		if(representLength>1){//插入行+合并单元格
			List<int[]> mergeList = new ArrayList<int[]>();
			map.put("mergeList"+sheetNum, mergeList);
			map.put("sheet"+sheetNum, 0);
			map.put("insertRowNum"+sheetNum, row);
			map.put("rowCount"+sheetNum, representLength-1);
			map.put("sheetCount", sheetNum);
			sheetNum++;
			nextRowNum[0] = row+representLength-1;//单纯当变量用 
			//纵向合并
			mergeList.add(new int[]{1,row,1,nextRowNum[0]});//是否拥有集体物业
			mergeList.add(new int[]{8,row,8,nextRowNum[0]});//村企合作
			mergeList.add(new int[]{11,row,11,nextRowNum[0]});//产权置换
			//横向合并
			for(int i=0,l=representLength-1;i<l;i++){
				mergeList.add(new int[]{2,row,3,row});//物业形态
				mergeList.add(new int[]{6,row,7,row});//在建物业项目
				mergeList.add(new int[]{9,row,10,row});//合作企业
				row++;
			}
			
		}/*else{
			List<int[]> mergeList = new ArrayList<int[]>();
			mergeList.add(new int[]{2,row,3,row});//物业形态
			mergeList.add(new int[]{6,row,7,row});//在建物业项目
			mergeList.add(new int[]{9,row,10,row});//合作企业
			map.put("mergeList"+sheetNum, mergeList);
			map.put("sheet"+sheetNum, 0); 
			map.put("sheetCount", sheetNum);
			sheetNum++;
		}*/
		row = row - representLength+1;
		for(int i=0;i<representLength;i++){//是否拥有集体物业	/村企合作/产权置换
			list.add(new ExportCell(2,row,"酒店"+i));//物业形态
			list.add(new ExportCell(4,row,"35203.84㎡"));//面积平方米
			list.add(new ExportCell(5,row,"900万"));//经营收入
			list.add(new ExportCell(6,row,"地下停车场"));//在建物业项目
			list.add(new ExportCell(9,row,"1.爱乐假日酒店"+i));//合作企业
			list.add(new ExportCell(12,row,"湖光西路改造区域"+i));//所在组团片区
			list.add(new ExportCell(13,row,"3396.1平方米"));//置换物业面积
			list.add(new ExportCell(14,row,"803.5万"));//置换后的差价
			list.add(new ExportCell(15,row,"有"));//是否投入使用
			row++;
		}
		nextRowNum =new int[]{0,0,0,0,row+1,row+7};
		
		list.add(new ExportCell(3,nextRowNum[4],"有1",0,ExportCell.LEFT,null));//周边产业
		list.add(new ExportCell(3,nextRowNum[4]+1,"泉安路与阳光路交通路口，和平路与阳光路交通路口",0,ExportCell.LEFT,null));//交通道口
		list.add(new ExportCell(3,nextRowNum[4]+2,"有2",0,ExportCell.LEFT,null));//自然景观
		list.add(new ExportCell(3,nextRowNum[4]+3,"金鸡水利纪念碑",0,ExportCell.LEFT,null));//文物单位
		list.add(new ExportCell(3,nextRowNum[4]+4,"有3",0,ExportCell.LEFT,null));//革命遗迹
		
//		项目建设
		List<String> projectList = new ArrayList<String>();
		projectList.add("");projectList.add("");projectList.add("");
		//projectList.add("");projectList.add("");projectList.add("");
		projectList.add("");projectList.add("");
		int projectLength = projectList.size();
		row = nextRowNum[5];
		if(projectLength>6){
			List<int[]> mergeList = new ArrayList<int[]>();
			for(int i=0,l=projectLength-6;i<l;i++){
				mergeList.add(new int[]{2,row,3,row});//项目名称
				mergeList.add(new int[]{4,row,5,row});//启动时间
				mergeList.add(new int[]{6,row,7,row});//结束时间
				mergeList.add(new int[]{8,row,9,row});//征地面积
				mergeList.add(new int[]{10,row,11,row});//房屋幢数
				mergeList.add(new int[]{12,row,13,row});//涉迁群众
				row++;
			}
			map.put("mergeList"+sheetNum, mergeList);
			map.put("sheet"+sheetNum, 0);
			map.put("insertRowNum"+sheetNum,  nextRowNum[5]);
			map.put("rowCount"+sheetNum, projectLength-6);
			map.put("sheetCount", sheetNum);
			sheetNum++;
		}
		row = nextRowNum[5];
		for(int i=0;i<projectLength;i++){
			list.add(new ExportCell(1,row,"组团"+i));//组团
			list.add(new ExportCell(2,row,"项目"+i));//项目名称
			list.add(new ExportCell(4,row,"动"+i));//启动时间
			list.add(new ExportCell(6,row,""+i));//结束时间
			list.add(new ExportCell(8,row,""+i));//征地面积
			list.add(new ExportCell(10,row,""+i));//房屋幢数
			list.add(new ExportCell(12,row,""+i));//涉迁群众
			list.add(new ExportCell(14,row,""+i));//是否回迁
			list.add(new ExportCell(15,row,""+i));//是否安置
			row ++;
		}
		
		row = projectLength<6?nextRowNum[5]+6:row;
		nextRowNum =new int[]{row+3,row+7,row+11,row+14};
		//表彰
		list.add(new ExportCell(1,nextRowNum[0],"1"));//省部级 个数
		list.add(new ExportCell(2,nextRowNum[0],"2010年7月被中华全国妇女联合会评为“全国妇联基层组织建设示范社区”",0,ExportCell.LEFT,null));//内容
		list.add(new ExportCell(6,nextRowNum[0],"2"));//泉州市 个数
		list.add(new ExportCell(7,nextRowNum[0],"2012年7月被泉州市委文明办、泉州市环保局、泉州市民政局评为“泉州市环境友好型社区”",0,ExportCell.LEFT,null));//内容
		list.add(new ExportCell(11,nextRowNum[0],"3"));//晋江市 个数
		list.add(new ExportCell(12,nextRowNum[0],"无",0,ExportCell.LEFT,null));//内容
		
		//命名
		list.add(new ExportCell(1,nextRowNum[1],"4"));//省部级 个数
		list.add(new ExportCell(2,nextRowNum[1],"无",0,ExportCell.LEFT,null));//内容
		list.add(new ExportCell(6,nextRowNum[1],"5"));//泉州市 个数
		list.add(new ExportCell(7,nextRowNum[1],"无",0,ExportCell.LEFT,null));//内容
		list.add(new ExportCell(11,nextRowNum[1],"6"));//晋江市 个数
		list.add(new ExportCell(12,nextRowNum[1],"2013月3月被晋江市委定为网格化试点",0,ExportCell.LEFT,null));//内容
		
		//试点
		list.add(new ExportCell(1,nextRowNum[2],"7"));//省部级 个数
		list.add(new ExportCell(2,nextRowNum[2],"无",0,ExportCell.LEFT,null));//内容
		list.add(new ExportCell(6,nextRowNum[2],"8"));//泉州市 个数
		list.add(new ExportCell(7,nextRowNum[2],"无",0,ExportCell.LEFT,null));//内容
		list.add(new ExportCell(11,nextRowNum[2],"9"));//晋江市 个数
		list.add(new ExportCell(12,nextRowNum[2],"无",0,ExportCell.LEFT,null));//内容
		//存在问题
		list.add(new ExportCell(1,nextRowNum[3],"11"));//征迁遗留问题 个数
		list.add(new ExportCell(2,nextRowNum[3],"无",0,ExportCell.LEFT,null));//内容
		list.add(new ExportCell(6,nextRowNum[3],"13"));//角落宗族问题 个数
		list.add(new ExportCell(7,nextRowNum[3],"无",0,ExportCell.LEFT,null));//内容
		list.add(new ExportCell(11,nextRowNum[3],"13"));//信访突出问题 个数
		list.add(new ExportCell(12,nextRowNum[3],"无",0,ExportCell.LEFT,null));//内容
		
		ExportHelper eh = new ExportHelper();
		eh.exportExcelByCell1("", "E:\\fu\\villageBookSurvey.xls", list, map);
	}
}
