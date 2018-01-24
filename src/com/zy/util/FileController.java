/**
 * Copyright 2016 SinoSoft. All Rights Reserved.
 */
package com.zy.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <B>系统名称：版权经营系统</B><BR>
 * <B>模块名称：文件操作</B><BR>
 * <B>中文类名：文件操作类</B><BR>
 * <B>概要说明：文件操作类</B><BR>
 * 
 * @author 中科软科技 haoxl
 * @since 2016年4月18日
 */
@Controller
@RequestMapping("/file")
public class FileController {

    private static Log log = LogFactory.getLog(FileController.class);

	/**
	 * 
	 * <B>方法名称：readImg</B><BR>
	 * <B>概要说明：用于加载宣传图、作品图图片</B><BR>
	 * 
	 * @author haoxl
	 * @param request
	 * @param response
	 * @param name
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/readImg.do")
	public String readImg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String type = request.getParameter("type");
		String filepath = "E:/shop_temporary";
		try {
			if (StringUtils.isNotBlank(type)) {
				filepath = "E:/shop_imgs";
			}
			FileUtil.loadDiskImg(filepath + name, response);
			log.info("图片路径：" + filepath + name);
		} catch (FileNotFoundException e) {
			log.error("错误文件路径：" + "E:/shop_imgs" + name);
			log.error(e);
			// 要找的文件不存在
			FileUtil.loadProImg("/app/img/timg.jpg", response, request);
		} // 以byte流的方式打开文件 d:\1.gif
		return null;
	}

    /**
     * 
     * <B>方法名称：readImgFileStatic</B><BR>
     * <B>概要说明：用于加载富文本图片</B><BR>
     * 
     * @param request
     * @param session
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/readImgFileStatic")
    public String readImgFileStatic(HttpServletRequest request, HttpSession session, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
       // String tempPath1 = ConfigProperties.getPropertyValue(GlobalNames.FILE_I_URL);
        try {
            FileUtil.loadDiskImg("E:/shop_imgs" + name, response);
        }
        catch (FileNotFoundException e) {
            log.error("错误文件路径：" + "E:/shop_imgs" + name);
            log.error(e);
            // 要找的文件不存在

            FileUtil.loadProImg("/upload/image.jpg", response, request);

        } // 以byte流的方式打开文件 d:\1.gif

        return null;
    }

    public void dow(InputStream in, HttpServletResponse response) throws IOException {
        byte data[] = new byte[in.available()];
        in.read(data);
        OutputStream toClient = response.getOutputStream(); // 得到向客户端输出二进制数据的对象
        toClient.write(data); // 输出数据

        toClient.flush();
        toClient.close();
        in.close();

    }

    /**
     * 
     * <B>方法名称：copyFile</B><BR>
     * <B>概要说明：复制单个文件到新目录下</B><BR>
     * 
     * @author haoxl
     * @param oldPath:旧路径
     * @param newPath:新路径
     */
    public static void copyFile(String fileName, String type) {
        // 文件临时保存路径
        String oldPath = "";
        // 文件实际保存路径
        String newPath = "";
        // 文件持久目录
        String tempPath = "";
        if ("img".equals(type)) {
            // 图片
            oldPath = "E:/shop_temporary" + fileName;
            newPath = "E:/shop_imgs" + fileName;
            tempPath = "E:/shop_imgs";
        }
        else if ("file".equals(type)) {
            // 剧本、影视
        	  oldPath = "E:/shop_temporary" + fileName;
              newPath = "E:/shop_imgs" + fileName;
              tempPath = "E:/shop_imgs";
        }
        // 为文件目录路径添加时间戳部分
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
        String ymd = sdf.format(new Date());
        tempPath += ymd + "/";
        // 文件夹不存在时创建新文件夹
        File dirTempFile = new File(tempPath);
        if (!dirTempFile.exists()) {
            dirTempFile.mkdirs();
        }
        try {
            int bytesum = 0;
            int byteread = 0;
            File oldfile = new File(oldPath);
            if (oldfile.exists()) { // 文件存在时
                InputStream inStream = new FileInputStream(oldPath); // 读入原文件
                FileOutputStream fs = new FileOutputStream(newPath);
                byte[] buffer = new byte[1444];
                // int length;
                while ((byteread = inStream.read(buffer)) != -1) {
                    bytesum += byteread; // 字节数 文件大小
                    System.out.println(bytesum);
                    fs.write(buffer, 0, byteread);
                }
                inStream.close();
                fs.close();
            }
        }
        catch (Exception e) {
            System.out.println("复制单个文件操作出错");
            e.printStackTrace();

        }
    }

    public static boolean ishave(String imgurl, String path) {
        imgurl = path + imgurl;
        if (imgurl != null && !imgurl.equals("")) {
            File file = new File(imgurl);
            // 路径为文件且不为空则进行删除
            if (file.isFile() && file.exists()) {
                return true;
            }
        }
        return false;
    }

    /**
     * 
     * <B>方法名称：deleteFile</B><BR>
     * <B>概要说明：删除单个文件</B><BR>
     * 
     * @param sPath
     * @param type
     *            1 见组图片、头像 2 宣传图、商品图片 3 文件、剧本
     * @return
     */
    public static boolean deleteFile(String sPath, String type) {
        // 文件实际保存路径

        if ("2".equals(type)) {
            // 宣传图、商品图片
            sPath = "E:/shop_imgs" + sPath;
        }
        else if ("3".equals(type)) {
            // 文件、剧本
            sPath = "E:/shop_imgs" + sPath;
        }

        // sPath = ConfigProperties.getPropertyValue(GlobalNames.FILE_DISK_PATH)
        // + sPath;
        boolean flag = false;
        if (sPath != null && !sPath.equals("")) {
            File file = new File(sPath);
            // 路径为文件且不为空则进行删除
            if (file.isFile() && file.exists()) {
                file.delete();
                flag = true;
            }
        }
        return flag;
    }

    /**
     * 
     * <B>方法名称：deleteDirectory</B><BR>
     * <B>概要说明：删除文件夹</B><BR>
     * 
     * @param sPath
     * @return
     */
    public static boolean deleteDirectory(String sPath, String type) {
        // 如果sPath不以文件分隔符结尾，自动添加文件分隔符
        if (!sPath.endsWith(File.separator)) {
            sPath = sPath + File.separator;
        }
        File dirFile = new File(sPath);
        // 如果dir对应的文件不存在，或者不是一个目录，则退出
        if (!dirFile.exists() || !dirFile.isDirectory()) {
            return false;
        }
        boolean flag = true;
        // 删除文件夹下的所有文件(包括子目录)
        File[] files = dirFile.listFiles();
        for (int i = 0; i < files.length; i++) {
            // 删除子文件
            if (files[i].isFile()) {
                flag = deleteFile(files[i].getAbsolutePath(), type);
                if (!flag)
                    break;
            } // 删除子目录
            else {
                flag = deleteDirectory(files[i].getAbsolutePath(), type);
                if (!flag)
                    break;
            }
        }
        if (!flag)
            return false;
        // 删除当前目录
        if (dirFile.delete()) {
            return true;
        }
        else {
            return false;
        }
    }

    /**
     * 
     * <B>方法名称：实现用户手册下载</B><BR>
     * <B>概要说明：</B><BR>
     * 
     * @param filename
     *            要下载的文件的名字
     * @param session
     * @return 要下载的文件
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/download")

    public ResponseEntity<byte[]> testResponseEntity(HttpServletRequest request, HttpSession session)
            throws UnsupportedEncodingException {
        byte[] body = null;

        // ServletContext servletContext = session.getServletContext();
        // InputStream in = servletContext.getResourceAsStream(filename);
        // String filename = request.getParameter("filename");
        // filename = java.net.URLDecoder.decode(filename, "GBK");//处理中文文件名的问题
        // filename = new String(filename.getBytes("ISO-8859-1"),
        // "utf-8");//处理中文文件名的问题。
        try {
            /**
             * 访问WebContent的位置
             */
            // log.error("文件名=====================：" + filename);
            InputStream in = request.getSession().getServletContext()
                    .getResourceAsStream("doc/" + "UserManualV1.1.doc");
            // InputStream in =
            // request.getSession().getServletContext().getResourceAsStream(
            // "doc/" + filename);
            // InputStream in =
            // servletContext.getResourceAsStream(request.getSession().getServletContext().getRealPath("/")+"/doc/"
            // + filename);
            // InputStream in = new
            // FileInputStream(ConfigProperties.getPropertyValue(GlobalNames.FILE_DISK_PATH)
            // + filename);
            // log.error("文件路径:" +
            // request.getSession().getServletContext().getRealPath("/") +
            // "doc/" + filename);
            // log.error("in:" + in);
            body = new byte[in.available()];
            in.read(body);
        }
        catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        HttpHeaders headers = new HttpHeaders();
        // filename = new String(filename.getBytes("utf-8"),
        // "ISO8859-1");//处理中文文件名的问题。

        headers.add("Content-Disposition",
                "attachment;filename=" + new String("TradeSystemHelperApiV1.1.doc".getBytes("UTF-8"), "ISO8859-1"));
        HttpStatus statusCode = HttpStatus.OK;
        // headers.setContentDispositionFormData("attachment", new String(body,
        // "ISO8859-1")); //解决文件名中文乱码问题
        ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(body, headers, statusCode);
        return response;
    }
}
