package com.zy.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


/**
 * 
 * @ClassName FileUpload
 * @Description 文件上传
 * @auther haoxl
 * @date 2016年3月29日 上午11:12:14
 */
@Controller
@RequestMapping("/appfile")
public class FileUpload {
	// 上传文件的保存路径
	protected String configPath = "upload";

	protected String dirTemp = "upload/temp";

	protected String dirName = "file";

	/**
	 * 
	 * @Method: fileUpload
	 * @Description: 文件上传保存
	 * @auther: haoxl
	 * @date: 2016年3月29日 上午10:59:13
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "fileUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(@RequestParam("file") MultipartFile file, MultipartFile txtfile,
			HttpServletRequest request) throws IOException {
		// 临时文件目录
		String tempPath = "E:/shop_temporary";
		// 为文件目录路径添加时间戳部分
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String ymd = sdf.format(new Date());
		tempPath += ymd + "/";

		String filePath = "";// 存储路径
		String newFileName = "";// 返回的文件名

		// 保存文件
		if (!file.isEmpty()) {
			// 创建临时文件夹
			File dirTempFile = new File(tempPath);
			if (!dirTempFile.exists()) {
				dirTempFile.mkdirs();
			}
			// 创建新的文件名
			String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1)
					.toLowerCase();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
			try {
				filePath = tempPath + newFileName;
				// 转存文件
				file.transferTo(new File(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return ymd + "/" + newFileName;
	}

	/**
	 * 
	 * <B>方法名称：uploadTxt</B><BR>
	 * <B>概要说明：剧本上传</B><BR>
	 * 
	 * @return
	 */
	@RequestMapping(value = "uploadTxt")
	@ResponseBody
	public String uploadTxt(MultipartFile txtfile, HttpServletRequest request) throws IOException {
		// 临时文件目录
		String tempPath = "E:/shop_temporary";
		// 为文件目录路径添加时间戳部分
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String ymd = sdf.format(new Date());
		tempPath += ymd + "/";

		String filePath = "";// 存储路径
		String newFileName = "";// 返回的文件名

		// 保存文件
		if (!txtfile.isEmpty()) {
			// 创建临时文件夹
			File dirTempFile = new File(tempPath);
			if (!dirTempFile.exists()) {
				dirTempFile.mkdirs();
			}
			// 创建新的文件名
			String fileExt = txtfile.getOriginalFilename().substring(txtfile.getOriginalFilename().lastIndexOf(".") + 1)
					.toLowerCase();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
			try {
				filePath = tempPath + newFileName;
				// 转存文件
				txtfile.transferTo(new File(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return newFileName;
	}

	/**
	 * 
	 * <B>方法名称：uploadImg</B><BR>
	 * <B>概要说明：图片上传</B><BR>
	 * 
	 * @return
	 */
	@RequestMapping(value = "uploadImg.do", method = RequestMethod.POST)

	public void uploadImg(MultipartHttpServletRequest multipartRequest, HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		MultipartFile file = null;
		for (Iterator it = multipartRequest.getFileNames(); it.hasNext();) {
			String key = (String) it.next();
			file = multipartRequest.getFile(key);
		}
		// 临时文件目录
		String tempPath = "E:/shop_temporary";
		// 为文件目录路径添加时间戳部分
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String ymd = sdf.format(new Date());
		tempPath += ymd + "/";

		String filePath = "";// 存储路径
		String newFileName = "";// 返回的文件名

		// 保存文件
		if (!file.isEmpty()) {
			// 创建临时文件夹
			File dirTempFile = new File(tempPath);
			if (!dirTempFile.exists()) {
				dirTempFile.mkdirs();
			}
			// 创建新的文件名
			String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1)
					.toLowerCase();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
			try {
				filePath = tempPath + newFileName;
				// 转存文件
				file.transferTo(new File(filePath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		response.getWriter().write(ymd + "/" + newFileName);
	}

	@RequestMapping(value = "/uploadImg.do", method = RequestMethod.OPTIONS)
	public void uploadGet(HttpServletResponse response) {
		response.setHeader("access-control-allow-headers", "accept,content-type");
		response.setHeader("access-control-allow-methods", "GET, POST, PUT,OPTIONS");
	}
}
