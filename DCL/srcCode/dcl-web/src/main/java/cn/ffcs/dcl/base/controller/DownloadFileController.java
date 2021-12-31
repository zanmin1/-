package cn.ffcs.dcl.base.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.ffcs.file.mybatis.domain.attachment.Attachment;
import cn.ffcs.file.service.IAttachmentService;
import cn.ffcs.system.publicUtil.StringUtils;
import cn.ffcs.uam.service.IFunConfigurationService;

/**
 * 下载附件
 * 
 * @author Linkun
 */
@Controller
@RequestMapping("/dcl/down")
public class DownloadFileController {

	@Autowired
	private IAttachmentService attachmentService;
	@Autowired
	private IFunConfigurationService funConfigurationService;

	/**
	 * 根据附件id下载文件
	 * 
	 * @param attaId
	 * @param response
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("downloadFile")
	public void downloadFile(Long attaId, String fileUrl, String name,HttpServletResponse response,
			HttpServletRequest request) throws UnsupportedEncodingException {
		name = request.getParameter("name");
		//name = new String(request.getParameter("name").getBytes("ISO8859-1"), "UTF-8");
		String fileName = null;
		String filePath = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		if( !StringUtils.isEmpty(fileUrl)){
			filePath = funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null) + fileUrl;
			if( !StringUtils.isEmpty(name)){
				fileName = name;
			}else{
				throw new RuntimeException("附件名异常");
			}
		}else if(attaId != null) {
			Attachment att = attachmentService.findById(attaId);
			if (att != null) {
				filePath = funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null) + att.getFilePath();
				fileName = att.getFileName();
			}
		}
		try {
			// url判断
			if (null == filePath || filePath.length() == 0) {
				throw new RuntimeException("附件URL异常");
			}
			// 解决文件名乱码处理，判断浏览器类型
			/*String userAgent = request.getHeader("user-agent").toLowerCase();
			if (userAgent.contains("msie") || userAgent.contains("like gecko")) {
				// win10 ie edge 浏览器 和其他系统的ie
				fileName = URLEncoder.encode(fileName, "UTF-8");
			} else {
				// 非ie
				fileName = new String(fileName.getBytes("utf-8"), "iso-8859-1");
			}*/
			
			//判断是否是IE11  
            boolean flag= request.getHeader("User-Agent").indexOf("Gecko")>0 && !(request.getHeader("User-Agent").indexOf("Chrome")>=0);
            
			if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0 || flag) {  
				fileName = URLEncoder.encode(fileName, "UTF-8");  
			} else {  
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");  
			}
			
			// 根据网络文件地址创建URL
			URL url = new URL(filePath);
			// 获取此路径的连接
			URLConnection conn = url.openConnection();
			// 获取文件大小
			Long fileLength = conn.getContentLengthLong();
			// 构建输入流
			bis = new BufferedInputStream(conn.getInputStream());
			// 构建输出流
			bos = new BufferedOutputStream(response.getOutputStream());

			// 清除response中的缓存
			response.reset();
			// 设置reponse响应头，真实文件名重命名，就是在这里设置，设置编码
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;fileName="
					+ fileName);
			response.setHeader("Content-Length", String.valueOf(fileLength));

			byte[] buff = new byte[1024];
			int bytesRead;
			// 每次读取缓存大小的流，写到输出流
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			// 将所有的读取的流返回给客户端
			response.flushBuffer();
		} catch (IOException e) {
			throw new RuntimeException("文件下载失败！");
		} finally {
			try {
				if (null != bis) {
					bis.close();
				}
				if (null != bos) {
					bos.close();
				}
			} catch (IOException e) {
				throw new RuntimeException("关闭流异常！");
			}
		}

	}
	
	/**
	 * 根据附件id下载文件
	 * 
	 * @param attaId
	 * @param response
	 * @throws Exception 
	 */
	@RequestMapping("downloadDocFile")
	public void downloadDocFile(Long attaId, String fileUrl, String name,HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		name = request.getParameter("name");
		name = new String(request.getParameter("name").getBytes("ISO8859-1"), "UTF-8");
		String fileName = null;
		String filePath = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		if( !StringUtils.isEmpty(fileUrl)){
			filePath = funConfigurationService.getAppDomain("$IMG_DOMAIN", null, null) + fileUrl;
			if( !StringUtils.isEmpty(name)){
				fileName = name;
			}else{
				throw new RuntimeException("附件名异常");
			}
		}
		try {
			// url判断
			if (null == filePath || filePath.length() == 0) {
				throw new RuntimeException("附件URL异常");
			}
			// 解决文件名乱码处理，判断浏览器类型
			/*String userAgent = request.getHeader("user-agent").toLowerCase();
			if (userAgent.contains("msie") || userAgent.contains("like gecko")) {
				// win10 ie edge 浏览器 和其他系统的ie
				fileName = URLEncoder.encode(fileName, "UTF-8");
			} else {
				// 非ie
				fileName = new String(fileName.getBytes("utf-8"), "iso-8859-1");
			}*/
			
			//判断是否是IE11  
            boolean flag= request.getHeader("User-Agent").indexOf("Gecko")>0 && !(request.getHeader("User-Agent").indexOf("Chrome")>=0);
            
			if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0 || flag) {  
				fileName = URLEncoder.encode(fileName, "UTF-8");  
			} else {  
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");  
			}
			
			// 根据网络文件地址创建URL
			URL url = new URL(filePath);
			// 获取此路径的连接
			URLConnection conn = url.openConnection();
			// 获取文件大小
			Long fileLength = conn.getContentLengthLong();
			// 构建输入流
			bis = new BufferedInputStream(conn.getInputStream());
			// 构建输出流
			bos = new BufferedOutputStream(response.getOutputStream());

			// 清除response中的缓存
			response.reset();
			// 设置reponse响应头，真实文件名重命名，就是在这里设置，设置编码
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;fileName="
					+ fileName);
			response.setHeader("Content-Length", String.valueOf(fileLength));

			byte[] buff = new byte[1024];
			int bytesRead;
			// 每次读取缓存大小的流，写到输出流
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			// 将所有的读取的流返回给客户端
			response.flushBuffer();
		} catch (IOException e) {
			System.out.println(222);
			System.out.println(e);
			throw new RuntimeException("文件下载失败！");
		} finally {
			try {
				if (null != bis) {
					bis.close();
				}
				if (null != bos) {
					bos.close();
				}
			} catch (IOException e) {
				throw new RuntimeException("关闭流异常！");
			}
		}

	}


}
