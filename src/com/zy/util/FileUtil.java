package com.zy.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.sinosoft.util.tool.JStringToolkit;

/**
 * 
 * <p>
 * Title: FileUtil.java
 * </p>
 * <p>
 * Description:文件操作工具类
 * </p>
 * <p>
 * 版权所有(C) 2015-2018。中科软科技股份有限公司。
 * </p>
 * 
 * @author kjx
 * @date 2015-9-15
 * @version 2.0
 */
public class FileUtil {
	private static Log log = LogFactory.getLog(FileUtil.class);
	public final static String FILE_PATH = "FILE_PATH";
	public final static String CONTENT = "CONTENT";

	/**
	 * kjx 2015-9-16 将新上传的文件剪切到持久化目录中，并更新文本内容
	 * 
	 * @param content
	 *            文本内容
	 * @param tempFiles
	 *            新文件路径
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map<String, String> updateFilePath(String basePath, String content, String tempFiles) {
		String[] tempFile = JStringToolkit.splitString(tempFiles);
		StringBuffer returnFilepath = new StringBuffer();
		Map map = new HashMap<String, String>();
		for (String filepath : tempFile) {
			if ("".equals(filepath)) {
				continue;
			}
			if (content.contains(filepath)) {
				String newFilePath = filepath.replace( "E:/shop_temporary", "E:/shop_imgs");
				moveFile(basePath + filepath, basePath + newFilePath);
				returnFilepath.append("|$|" + newFilePath);
				content = content.replaceAll(filepath, newFilePath);
			} else {
				delFile(basePath + filepath);// 删除未引用的临时文件
			}
		}
		map.put(FILE_PATH, returnFilepath.toString());
		map.put(CONTENT, content);
		return map;
	}

	/**
	 * kjx 2015-9-16
	 * 
	 * 修改文本内容时，将新上传的文件剪切到持久化目录中 同时删除未引用的文件，并更新文本内容
	 * 
	 * @param newContent
	 *            文本内容
	 * @param oldFiles
	 *            旧文件路径
	 * @param tempFiles
	 *            新文件路径
	 * @return Map 结果集
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map<String, String> updateDataAndFilePath(String basePath, String newContent, String oldFiles,
			String tempFiles) {
		Map map = new HashMap<String, String>();
		String[] oldFile = oldFiles != null ? JStringToolkit.splitString(oldFiles) : (new String[] {});
		StringBuffer returnFilepath = new StringBuffer();
		Map tempMap = updateFilePath(basePath, newContent, tempFiles);
		returnFilepath.append(tempMap.get(FILE_PATH));

		for (String oldfilepath : oldFile) {
			if ("".equals(oldfilepath)) {
				continue;
			}
			if (!newContent.contains(oldfilepath)) {// 如果文本中未引用旧文件，就去删除
				delFile(basePath + oldfilepath);
			} else {
				returnFilepath.append("|$|" + oldfilepath);
			}
		}
		map.put(FILE_PATH, returnFilepath.toString());
		map.put(CONTENT, tempMap.get(CONTENT));
		return map;
	}

	/**
	 * 删除文件
	 * 
	 * @param filePathAndName
	 *            String 文件路径及名称 如c:/fqf.txt
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	public static void delFiles(String basePath, String filePathNames) {
		try {

			String[] oldFile = JStringToolkit.splitString(filePathNames);
			for (String oldfilepath : oldFile) {
				if ("".equals(oldfilepath)) {
					continue;
				}
				delFile(basePath + oldfilepath);
			}
		} catch (Exception e) {
			log.error("删除文件操作出错");
			e.printStackTrace();

		}

	}

	/**
	 * 移动文件到指定目录
	 * 
	 * @param oldPath
	 *            String 如：c:/fqf.txt
	 * @param newPath
	 *            String 如：d:/fqf.txt
	 */
	public static void moveFile(String oldPath, String newPath) {
		copyFile(oldPath, newPath);
		delFile(oldPath);

	}

	/**
	 * 删除文件
	 * 
	 * @param filePathAndName
	 *            String 文件路径及名称 如c:/fqf.txt
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	public static void delFile(String filePathAndName) {
		try {
			// String filePath = filePathAndName;
			// filePath = filePath.toString();
			java.io.File myDelFile = new java.io.File(filePathAndName);
			myDelFile.delete();

		} catch (Exception e) {
			log.error("删除文件操作出错");
			e.printStackTrace();

		}

	}

	/**
	 * 复制单个文件
	 * 
	 * @param oldPath
	 *            String 原文件路径 如：c:/fqf.txt
	 * @param newPath
	 *            String 复制后路径 如：f:/fqf.txt
	 * @return boolean
	 */
	public static void copyFile(String oldPath, String newPath) {
		System.out.println("2222");
		log.debug("复制单个文件操作start....");
		isexitsPath(newPath.substring(0, newPath.lastIndexOf("/")));
		try {
			// int bytesum = 0;
			int byteread = 0;
			File oldfile = new File(oldPath);
			log.debug("复制单个文件操作start....");
			// System.out.println(oldfile.getAbsolutePath());
			if (oldfile.exists()) { // 文件存在时
				log.debug("复制单个文件操作ing....");
				InputStream inStream = new FileInputStream(oldPath); // 读入原文件
				File newfile = new File(newPath);
				FileOutputStream fs = new FileOutputStream(newfile);
				byte[] buffer = new byte[1444];
				// int length;
				while ((byteread = inStream.read(buffer)) != -1) {
					// bytesum += byteread; // 字节数 文件大小
					// System.out.println(bytesum);
					fs.write(buffer, 0, byteread);
				}
				inStream.close();
				fs.close();
				log.debug("复制单个文件操作end....");
			}
		} catch (Exception e) {
			log.error("复制单个文件操作出错");
			e.printStackTrace();

		}

	}

	public static void isexitsPath(String rootPath) {
		File saveDirFile = new File(rootPath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
	}

	/**
	 * 删除文件夹
	 * 
	 * @param folderPath
	 *            文件夹完整绝对路径
	 * @return
	 */
	public static void delFolder(String folderPath) {
		try {
			delAllFile(folderPath); // 删除完里面所有内容
			String filePath = folderPath;
			filePath = filePath.toString();
			java.io.File myFilePath = new java.io.File(filePath);
			myFilePath.delete(); // 删除空文件夹
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 删除指定文件夹下所有文件
	 * 
	 * @param path
	 *            文件夹完整绝对路径
	 * @return
	 */
	public static boolean delAllFile(String path) {
		boolean flag = false;
		File file = new File(path);
		if (!file.exists()) {
			return flag;
		}
		if (!file.isDirectory()) {
			return flag;
		}
		String[] tempList = file.list();
		File temp = null;
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				temp.delete();
			}
			if (temp.isDirectory()) {
				delAllFile(path + "/" + tempList[i]);// 先删除文件夹里面的文件
				delFolder(path + "/" + tempList[i]);// 再删除空文件夹
				flag = true;
			}
		}
		return flag;
	}

	/**
	 * 将String 存到 file中
	 * 
	 * @param filePath
	 * @param str
	 * @throws IOException
	 */
	public static void saveFile(String filePath, String str) throws IOException {
		File requestFile = new File(filePath);
		if (!requestFile.exists()) {
			requestFile.createNewFile();
		}
		PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(requestFile), "utf-8"));
		printWriter.print(str);
		printWriter.close();
	}

	/**
	 * 获取文件中的String
	 */
	public static String readFileAndText(File file) throws FileNotFoundException, IOException {
		FileInputStream is = new FileInputStream(file);
		InputStreamReader isr = new InputStreamReader(is, "utf-8");
		BufferedReader reader = new BufferedReader(isr);
		String s = null;
		String result = "";
		while ((s = reader.readLine()) != null) {
			result = result + s;
		}
		reader.close();
		return result;
	}

	/**
	 * 
	 * <B>方法名称：loadDiskImg</B><BR>
	 * <B>概要说明：加载磁盘上图片</B><BR>
	 * 
	 * @param path
	 *            要加载图片的路径+文件名
	 * @param response
	 * @throws FileNotFoundException,IOException
	 */
	public static String loadDiskImg(String path, HttpServletResponse response)
			throws FileNotFoundException, IOException {
		// 加载磁盘上的图片
		InputStream in = new FileInputStream(path);
		return loadImg(in, response);

	}

	/**
	 * 
	 * <B>方法名称：loadProImg</B><BR>
	 * <B>概要说明：加载项目中的图片</B><BR>
	 * 
	 * @param path
	 *            文件的路径+文件名
	 * @param response
	 * @param request
	 * @return
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public static String loadProImg(String path, HttpServletResponse response, HttpServletRequest request)
			throws FileNotFoundException, IOException {
		javax.servlet.http.HttpSession session = request.getSession();
		InputStream in = session.getServletContext().getResourceAsStream(path);
		return loadImg(in, response);
	}

	/**
	 * 
	 * <B>方法名称：loadImg</B><BR>
	 * <B>概要说明：加载图片，将图片以流的形式输出到客户端</B><BR>
	 * 
	 * @param in
	 *            文件流
	 * @param response
	 * @return
	 * @throws IOException
	 */
	public static String loadImg(InputStream in, HttpServletResponse response) throws IOException {
		byte data[] = new byte[in.available()];
		in.read(data);
		OutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
		toClient.write(data); // 输出数据
		toClient.flush();
		toClient.close();
		in.close();
		return null;
	}

	/**
	 * 
	 * <B>方法名称：</B>Base64ToFile<BR>
	 * <B>概要说明：</B>将图片的base64字节转为图片文件<BR>
	 * 
	 * @param data
	 * @return 返回文件路径+文件名
	 */
	public static String Base64ToFile(String data) {
		Base64 base64 = new Base64();
		try {
			int byteread = 0;
			byte[] k = base64.decode(data.substring("data:image/jpeg;base64,".length()).getBytes());
			InputStream is = new ByteArrayInputStream(k);
			String fileName = UUID.randomUUID().toString() + ".jpg";
			File newfile = new File("E:/shop_temporary" + fileName);
			if (!newfile.exists()) {
				newfile.createNewFile();
			}
			FileOutputStream fs = new FileOutputStream(newfile);
			byte[] buffer = new byte[1444];
			while ((byteread = is.read(buffer)) != -1) {
				fs.write(buffer, 0, byteread);
			}
			is.close();
			fs.close();
			return "E:/shop_temporary" + fileName;
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
}
