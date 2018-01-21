package com.util;

 
 

import java.util.ArrayList;
import java.util.Map;

 

import com.util.SelectBean;

public class AllBean {
	SelectBean sb = new SelectBean();
	@SuppressWarnings("unchecked")
	ArrayList al = null;
	
	
	public Map<String, String> getOneById(String user_id) {
		Map<String, String> map = null;
		String sql = "select id,stuNo,pwd,name"
				+ " from tstudent where id=?";
		String[] args = { user_id };
		map = CommDAO.getMap(sql, args);
		return map; 
	}


	
	
	@SuppressWarnings("unchecked")
	public ArrayList getAdmin() {
		String sql = "select * from t_admin order by id desc";
		String args[] = { "id", "account","pwd"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getGongzi() {
		String sql = "select * from t_gongzi order by id desc";
		String args[] = { "id", "name","bumen","riqi","num"};
		al = sb.select(sql, args);
		return al;
	}
	

	@SuppressWarnings("unchecked")
	public ArrayList getGongziBybumen(String bumen) {
		String sql = "select * from t_gongzi where bumen like '%"+bumen+"%' order by id desc";
		String args[] = { "id", "name","bumen","riqi","num"};
		System.out.println(sql);
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getAdmin1(String account) {
		String sql = "select * from t_admin  where account like '%"+account+"%'";
		String args[] = { "id", "account","pwd"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getCangku() {
		String sql = "select * from t_cangku order by id desc";
		String args[] = { "id", "cangkuNo","name","username","beizhu","istingyong"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getCangkuByname(String name) {
		String sql = "select * from t_cangku where name='%"+name+"%'";
		String args[] = { "id", "cangkuNo","name","username","beizhu","istingyong"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getCangku(String id) {
		String sql = "select * from t_cangku where id="+id;
		String args[] = { "id", "cangkuNo","name","username","beizhu","istingyong"};
		al = sb.select(args,sql);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getUser() {
		String sql = "select * from t_user order by id desc";
		String args[] = { "id", "userNo","name","sex","age","tel","qq","daozhiriqi","bumen","wenhuachengdu","hunyinzhuangkuang","dizhi","shifouzaizhi"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getUser1(String name) {
		String sql = "select * from t_user where name like '%"+name+"%'";
		String args[] = { "id", "userNo","name","sex","age","tel","qq","daozhiriqi","bumen","wenhuachengdu","hunyinzhuangkuang","dizhi","shifouzaizhi"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getUser(String id) {
		String sql = "select * from t_user where id="+id;
		String args[] = { "id", "userNo","name","sex","age","tel","qq","daozhiriqi","bumen","wenhuachengdu","hunyinzhuangkuang","dizhi","shifouzaizhi"};
		al = sb.select(args,sql);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getRuku() {
		String sql = "select * from t_ruku order by id desc";
		String args[] = { "id", "rukuType","rukuNo","rukuriqi","gongyingshang","lianxiren","cangku","jingshouren","goodsNo","goodsName","goodsGuige","goodsPinpai","goodsNum","goodsPrice","goodsTotal","beizhu"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getRuku1() {
		String sql = "select  distinct SUBSTRING(rukuriqi, 1,4) nianfen  , sum(goodsTotal) num from t_ruku group by nianfen";
		String args[] = { "nianfen","num"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getRuku2() {
		String sql = "select  distinct SUBSTRING(rukuriqi, 1,7) yuefen  , sum(goodsTotal) num from t_ruku group by yuefen";
		String args[] = { "yuefen","num"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getGongzitongji() {
		String sql = "select distinct bumen,SUBSTRING(riqi, 1,7) yuefen,sum(num) num from t_gongzi group by bumen,riqi";
		String args[] = { "bumen","yuefen","num"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getChuku() {
		String sql = "select * from t_chuku order by id desc";
		String args[] = { "id", "chukutype","chukuNo","chukuriqi","kehu","cangku","jingshouren","goodsNo","goodsName","goodsGuige","goodsPinpai","goodsNum","goodsPrice","goodsTotal","beizhu"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getChuku1() {
		String sql = "select  distinct SUBSTRING(chukuriqi, 1,4) nianfen  , sum(goodsTotal) num from t_chuku group by nianfen";
		String args[] = { "nianfen","num"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getChuku2() {
		String sql = "select  distinct SUBSTRING(chukuriqi, 1,7) yuefen  , sum(goodsTotal) num from t_chuku group by yuefen";
		String args[] = { "yuefen","num"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	public ArrayList getXiaoshou(){
		String sql = "select * from t_xiaoshou order by id desc";
		String args[] = {"id", "xiaoshoutype","xiaoshouNo","xiaoshouriqi","kehu","cangku","jingshouren","goodsNo","goodsName","goodsGuige","goodsPinpai","goodsNum","goodsPrice","xiaoshouPrice","goodsTotal","beizhu"};
		al = sb.select(sql, args);
		return al;
		
	}
	public ArrayList getXisoshoubyNo(String xiaoshouno) {
		String sql = "select * from t_xiaoshou where xiaoshouNo like '%"+xiaoshouno+"%'";
		String args[] = { "id", "xiaoshoutype","xiaoshouNo","xiaoshouriqi","kehu","cangku","jingshouren","goodsNo","goodsName","goodsGuige","goodsPinpai","goodsNum","goodsPrice","xiaoshouPrice","goodsTotal","beizhu"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getRukuByrukuno(String rukuno) {
		String sql = "select * from t_ruku where rukuNo like '%"+rukuno+"%'";
		String args[] = { "id", "rukuType","rukuNo","rukuriqi","gongyingshang","lianxiren","cangku","jingshouren","goodsNo","goodsName","goodsGuige","goodsPinpai","goodsNum","goodsPrice","goodsTotal","beizhu"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	
	
	public ArrayList getChukubyNo(String chukuno) {
		String sql = "select * from t_chuku where chukuNo like '%"+chukuno+"%'";
		String args[] = { "id", "chukutype","chukuNo","chukuriqi","kehu","cangku","jingshouren","goodsNo","goodsName","goodsGuige","goodsPinpai","goodsNum","goodsPrice","goodsTotal","beizhu"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getgoods() {
		String sql = "select * from t_goods order by id desc";
		String args[] = { "id", "goodNo","name","guige","gongyingshang","yanse","pinpai","type","weizhi","num","price","danwei"};
		al = sb.select(sql, args);
		return al;
	}
	 
	
	@SuppressWarnings("unchecked")
	public ArrayList getgoodsByname(String name) {
		String sql = "select * from t_goods  where name like '%"+name+"%'";
		String args[] = { "id", "goodNo","name","guige","gongyingshang","yanse","pinpai","type","weizhi","num","price","danwei"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getgoods(String id) {
		String sql = "select * from t_goods where id="+id;
		String args[] = { "id", "goodNo","name","guige","gongyingshang","yanse","pinpai","type","weizhi","num","price","danwei"};
		al = sb.select(args,sql);
		return al;
	}
	 
	 
	
	@SuppressWarnings("unchecked")
	public ArrayList getKehu() {
		String sql = "select * from t_kehu order by id desc";
		String args[] = { "id", "kehuname","kehutype","dizhi","lianxiren","tel1","tel2","chuanzhen","email","beizhu","iszaiyong"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getKehu2(String kehutype) {
		String sql = "select * from t_kehu where kehutype='"+kehutype+"'";
		String args[] = { "id", "kehuname","kehutype","dizhi","lianxiren","tel1","tel2","chuanzhen","email","beizhu","iszaiyong"};
		System.out.println(sql);
		al = sb.select(sql, args);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getKehu1(String kehuname) {
		String sql = "select * from t_kehu where kehuname like '%"+kehuname+"%'";
		String args[] = { "id", "kehuname","kehutype","dizhi","lianxiren","tel1","tel2","chuanzhen","email","beizhu","iszaiyong"};
		al = sb.select(sql, args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getKehu(String id) {
		String sql = "select * from t_kehu where id="+id;
		String args[] = { "id", "kehuname","kehutype","dizhi","lianxiren","tel1","tel2","chuanzhen","email","beizhu","iszaiyong"};
		al = sb.select(args,sql);
		return al;
	}
	
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getgongyingshang() {
		String sql = "select * from t_gongyingshang order by id desc";
		String args[] = { "id", "name","lianxiren","dizhi","tel1","tel2","email","chuanzhen","beizhu","istingyong"};
		al = sb.select(sql, args);
		return al;
	}
	 
	@SuppressWarnings("unchecked")
	public ArrayList getgongyingshang1(String name) {
		String sql = "select * from t_gongyingshang where name like '%"+name+"%'";
		String args[] = { "id", "name","lianxiren","dizhi","tel1","tel2","email","chuanzhen","beizhu","istingyong"};
		al = sb.select(sql, args);
		return al;
	}
	 
	
	@SuppressWarnings("unchecked")
	public ArrayList getgongyingshang(String id) {
		String sql = "select * from t_gongyingshang  where id="+id;
		String args[] = { "id", "name","lianxiren","dizhi","tel1","tel2","email","chuanzhen","beizhu","istingyong"};
		al = sb.select(args,sql);
		return al;
	}
	 
	 
 
	@SuppressWarnings("unchecked")
	public ArrayList getAdmin(String id) {
		String sql = "select * from t_admin  where id="+id;
		String args[] = { "id", "account","pwd"};
		al = sb.select(args,sql);
		return al;
	}
	
 
	 
	@SuppressWarnings("unchecked")
	public ArrayList getBumen() {
		String sql = "select * from t_bumen ";
		String args[] = { "id", "bumen"};
		al = sb.select(sql,args);
		return al;
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList getBumen1(String bumen) {
		String sql = "select * from t_bumen where bumen like '%"+bumen+"%'";
		String args[] = { "id", "bumen"};
		al = sb.select(sql,args);
		System.out.println(sql);
		return al;
	}
	
	 
	@SuppressWarnings("unchecked")
	public ArrayList getBumen(String id) {
		String sql = "select * from t_bumen where id="+id;
		String args[] = { "id", "bumen"};
		al = sb.select(args,sql);
		return al;
	}
	
	
	 
	@SuppressWarnings("unchecked")
	public ArrayList getType() {
		String sql = "select * from t_type ";
		String args[] = { "id", "type"};
		al = sb.select(sql,args);
		return al;
	}
	
	 
	@SuppressWarnings("unchecked")
	public ArrayList getType1(String type) {
		String sql = "select * from t_type where type like '%"+type+"%'";
		String args[] = { "id", "type"};
		al = sb.select(sql,args);
		return al;
	}
 
 
 
	@SuppressWarnings("unchecked")
	public ArrayList getType(String id) {
		String sql = "select * from t_type where id="+id;
		String args[] = { "id", "type"};
		al = sb.select(args,sql);
		return al;
	}
 
	
 
 
	  
	
	@SuppressWarnings("unchecked")
	public ArrayList getXitongshezhi() {
		String sql = "select * from txitongshezhi order by id desc";
		String args[] = { "id", "xitongName","banquan","content"};
		al = sb.select(sql, args);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getXitongshezhi(String id) {
		String sql = "select * from txitongshezhi where id='"+id+"'";
		String args[] = { "id", "xitongName","banquan","content"};
		al = sb.select( args,sql);
		return al;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList getXitongName() {
		String sql = "select * from txitongshezhi";
		String args[] = { "id", "xitongName","banquan","content"};
		al = sb.select( args,sql);
		return al;
	}
	
	
	 
	
	
	
	public static void main(String[] args) {
		//System.out.println(new AllBean().getzhaopinById("1").get(1).toString());
	}
	
	
 
}
