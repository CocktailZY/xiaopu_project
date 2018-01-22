package com.a2.ssm.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtils {

	/**
	 * <p>
	 * 方法功能描述：发送激活码邮件
	 * </p>
	 * 
	 * @方法作者：lx
	 * @创建时间：2018-9-1 下午2:36:18
	 * @参数：@param to
	 * @参数：@param code
	 * @返回类型：void
	 * @throws
	 */
	public static void sendMail(String to, String code) {
		/**
		 * 1.获得一个Session对象. 2.创建一个代表邮件的对象Message. 3.发送邮件Transport
		 */
		/*
		 * // 1.获得连接对象 Properties props = new Properties();
		 * props.setProperty("mail.host", "localhost"); Session session =
		 * Session.getInstance(props, new Authenticator() {
		 * 
		 * @Override protected PasswordAuthentication
		 * getPasswordAuthentication() { return new
		 * PasswordAuthentication("service@shop.com", "111"); }
		 * 
		 * }); // 2.创建邮件对象: Message message = new MimeMessage(session); //
		 * 设置发件人: try { message.setFrom(new
		 * InternetAddress("service@shop.com")); // 设置收件人:
		 * message.addRecipient(RecipientType.TO, new InternetAddress(to)); //
		 * 抄送 CC 密送BCC // 设置标题 message.setSubject("来自购物天堂传智商城官方激活邮件"); //
		 * 设置邮件正文: message.setContent(
		 * "<h1>购物天堂传智商城官方激活邮件!点下面链接完成激活操作!</h1><h3><a href='http://172.7.42.73:8080/shop/user_active.action?code="
		 * +code+"'>http://172.7.42.73:8080/shop/user_active.action?code="+code+
		 * "</a></h3>", "text/html;charset=UTF-8"); // 3.发送邮件:
		 * Transport.send(message); } catch (AddressException e) {
		 * e.printStackTrace(); } catch (MessagingException e) {
		 * e.printStackTrace(); }
		 */

		try {
			Properties props = new Properties();
			props.put("username", "jyxp1224@163.com");
			props.put("password", "jyxp171224");//zmbscobjczauchce
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", "smtp.163.com");
			props.put("mail.smtp.port", "25");

			Session mailSession = Session.getDefaultInstance(props);

			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress("jyxp1224@163.com"));
			msg.addRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			msg.setSubject("激活邮件");
			msg.setContent(
					"<h1>这里每个人都有项目，所以ip地址设置为localhsot，记得要修改！</h1><h3><a href='http://localhost:8090/emporium/user/active.do?code="+ code+ "'>http://localhost:8080/emporium/user/active.do?code="+ code + "</a></h3>", "text/html;charset=UTF-8");
			msg.saveChanges();

			Transport transport = mailSession.getTransport("smtp");
			transport.connect(props.getProperty("mail.smtp.host"),
					props.getProperty("username"),
					props.getProperty("password"));
			transport.sendMessage(msg, msg.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}

	}

	public static void main(String[] args) {
		sendMail("804998302@qq.com", "hhhhhhhhhhhh");
	}
}
