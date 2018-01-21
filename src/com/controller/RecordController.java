package com.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import sun.print.resources.serviceui;


import com.model.Card;
import com.model.Charge;
import com.model.Record;
import com.model.Space;

import com.service.CardService;
import com.service.ChargeService;
import com.service.RecordService;
import com.service.SpaceService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;


/**
 * <p>类名：RecordController</p>
 * <p>类功能描述：停车场出入记录信息的增删改查</p>
 * @类作者：renguangqi
 * @创建时间：2018-1-2 下午6:34:02
 */
@Controller
@RequestMapping("/record")
public class RecordController {

	//注入Service
	@Autowired
	private RecordService recordService;
	@Autowired
	private CardService cardService;
	@Autowired
	private SpaceService spaceService;
	@Autowired
	private ChargeService chargeService;

	/**
	 * <p>方法功能描述：显示停车场出入记录的信息</p>
	 * @方法作者：renguangqi
	 * @创建时间：2018-1-28 上午11:45:39
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("show")
	public ModelAndView show(){
		ModelAndView mav = new ModelAndView();
		//查询显示停车场出入记录信息
		List<Record> recordList = recordService.recordList();
		mav.addObject("recordList", recordList);
		mav.setViewName("back/inandout");
		return mav;
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping("statistic")
	public ModelAndView statistic(HttpServletRequest request) throws java.text.ParseException{
		ModelAndView mav = new ModelAndView();
		//查询显示停车场出入记录信息
		List<Record> recordList = recordService.recordList();
		Integer eightUserCount = 0;
		Integer nineUserCount = 0;
		Integer tenUserCount = 0;
		Integer elevenUserCount = 0;
		Integer twelveUserCount = 0;
		Integer thirteenUserCount = 0;
		Integer fourteenUserCount = 0;
		Integer fifteenUserCount = 0;
		Integer sixteenUserCount = 0;
		Integer seventeenUserCount = 0;
		Integer eighteenUserCount = 0;
		Integer nineteenUserCount = 0;
		Integer twentyUserCount = 0;
		//当日临时卡入场数
		Integer eightTempCount = 0;
		Integer nineTempCount = 0;
		Integer tenTempCount = 0;
		Integer elevenTempCount = 0;
		Integer twelveTempCount = 0;
		Integer thirteenTempCount = 0;
		Integer fourteenTempCount = 0;
		Integer fifteenTempCount = 0;
		Integer sixteenTempCount = 0;
		Integer seventeenTempCount = 0;
		Integer eighteenTempCount = 0;
		Integer nineteenTempCount = 0;
		Integer twentyTempCount = 0;
		//月度会员车辆
		Integer JanuaryUserCount = 0;
		Integer FebruaryUserCount = 0;
		Integer MarchUserCount = 0;
		Integer AprilUserCount = 0;
		Integer MayUserCount = 0;
		Integer JuneUserCount = 0;
		Integer JulyUserCount = 0;
		Integer AugustUserCount = 0;
		Integer SeptemberUserCount = 0;
		Integer OctoberUserCount = 0;
		Integer NovemberUserCount = 0;
		Integer DecemberUserCount = 0;
		//月度临时车辆
		Integer JanuaryTempCount = 0;
		Integer FebruaryTempCount = 0;
		Integer MarchTempCount = 0;
		Integer AprilTempCount = 0;
		Integer MayTempCount = 0;
		Integer JuneTempCount = 0;
		Integer JulyTempCount = 0;
		Integer AugustTempCount = 0;
		Integer SeptemberTempCount = 0;
		Integer OctoberTempCount = 0;
		Integer NovemberTempCount = 0;
		Integer DecemberTempCount = 0;
		for(int i = 0;i < recordList.size(); i ++){
			Record nowRecord = recordList.get(i);
			//获取记录的起止时间
			String startTime = nowRecord.getrStarttime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式24小时制
			SimpleDateFormat df = new SimpleDateFormat("yyyy");
	        Date date = new Date();
			Date str;
			str = sdf.parse(startTime);
			//求出该记录的开始时间戳
			long Start = str.getTime();
			//当前年份
			String nowYear = df.format(date);
			//该记录年份
			String recordYear = df.format(str);
			String type = nowRecord.getrCardtype();
			//求出当日各时间段的时间戳
			
			//8点及之前
			Date eightTime = new Date();
			eightTime.setHours(0);
			eightTime.setMinutes(0);
			eightTime.setSeconds(0);
			long eight = eightTime.getTime();
			//9点
			Date nineTime = new Date();
			nineTime.setHours(9);
			nineTime.setMinutes(0);
			nineTime.setSeconds(0);
			long nine = nineTime.getTime();
			//10点
			Date tenTime = new Date();
			tenTime.setHours(10);
			tenTime.setMinutes(0);
			tenTime.setSeconds(0);
			long ten = tenTime.getTime();
			//11点
			Date elevenTime = new Date();
			elevenTime.setHours(11);
			elevenTime.setMinutes(0);
			elevenTime.setSeconds(0);
			long eleven = elevenTime.getTime();
			//12点
			Date twelveTime = new Date();
			twelveTime.setHours(12);
			twelveTime.setMinutes(0);
			twelveTime.setSeconds(0);
			long twelve = twelveTime.getTime();
			//13点
			Date thirteenTime = new Date();
			thirteenTime.setHours(13);
			thirteenTime.setMinutes(0);
			thirteenTime.setSeconds(0);
			long thirteen = thirteenTime.getTime();
			//14点
			Date fourteenTime = new Date();
			fourteenTime.setHours(14);
			fourteenTime.setMinutes(0);
			fourteenTime.setSeconds(0);
			long fourteen = fourteenTime.getTime();
			//15点
			Date fifteenTime = new Date();
			fifteenTime.setHours(15);
			fifteenTime.setMinutes(0);
			fifteenTime.setSeconds(0);
			long fifteen = fifteenTime.getTime();
			//16点
			Date sixteenTime = new Date();
			sixteenTime.setHours(16);
			sixteenTime.setMinutes(0);
			sixteenTime.setSeconds(0);
			long sixteen = sixteenTime.getTime();
			//17点
			Date seventeenTime = new Date();
			seventeenTime.setHours(17);
			seventeenTime.setMinutes(0);
			seventeenTime.setSeconds(0);
			long seventeen = seventeenTime.getTime();
			//18点
			Date eighteenTime = new Date();
			eighteenTime.setHours(18);
			eighteenTime.setMinutes(0);
			eighteenTime.setSeconds(0);
			long eighteen = eighteenTime.getTime();
			//19点
			Date nineteenTime = new Date();
			nineteenTime.setHours(19);
			nineteenTime.setMinutes(0);
			nineteenTime.setSeconds(0);
			long nineteen = nineteenTime.getTime();
			//20点
			Date twentyTime = new Date();
			twentyTime.setHours(20);
			twentyTime.setMinutes(0);
			twentyTime.setSeconds(0);
			long twenty = twentyTime.getTime();
			//24点
			Date endTime = new Date();
			endTime.setHours(23);
			endTime.setMinutes(59);
			endTime.setSeconds(59);
			long end = endTime.getTime();
			
			//2月
			Date FebruaryTime = new Date();
			FebruaryTime.setMonth(1);
			FebruaryTime.setDate(1);
			FebruaryTime.setHours(1);
			FebruaryTime.setMinutes(0);
			FebruaryTime.setSeconds(0);
			long February = FebruaryTime.getTime();
			//3月
			Date MarchTime = new Date();
			MarchTime.setMonth(2);
			MarchTime.setDate(1);
			MarchTime.setHours(1);
			MarchTime.setMinutes(0);
			MarchTime.setSeconds(0);
			long March = MarchTime.getTime();
			//4月
			Date AprilTime = new Date();
			AprilTime.setMonth(3);
			AprilTime.setDate(1);
			AprilTime.setHours(1);
			AprilTime.setMinutes(0);
			AprilTime.setSeconds(0);
			long April = AprilTime.getTime();
			//5月
			Date MayTime = new Date();
			MayTime.setMonth(4);
			MayTime.setDate(1);
			MayTime.setHours(1);
			MayTime.setMinutes(0);
			MayTime.setSeconds(0);
			long May = MayTime.getTime();
			//6月
			Date JuneTime = new Date();
			JuneTime.setMonth(5);
			JuneTime.setDate(1);
			JuneTime.setHours(1);
			JuneTime.setMinutes(0);
			JuneTime.setSeconds(0);
			long June = JuneTime.getTime();
			//7月
			Date JulyTime = new Date();
			JulyTime.setMonth(6);
			JulyTime.setDate(1);
			JulyTime.setHours(1);
			JulyTime.setMinutes(0);
			JulyTime.setSeconds(0);
			long July = JulyTime.getTime();
			//8月
			Date AugustTime = new Date();
			AugustTime.setMonth(7);
			AugustTime.setDate(1);
			AugustTime.setHours(1);
			AugustTime.setMinutes(0);
			AugustTime.setSeconds(0);
			long August = AugustTime.getTime();
			//9月
			Date SeptemberTime = new Date();
			SeptemberTime.setMonth(8);
			SeptemberTime.setDate(1);
			SeptemberTime.setHours(1);
			SeptemberTime.setMinutes(0);
			SeptemberTime.setSeconds(0);
			long September = SeptemberTime.getTime();
			//10月
			Date OctoberTime = new Date();
			OctoberTime.setMonth(9);
			OctoberTime.setDate(1);
			OctoberTime.setHours(1);
			OctoberTime.setMinutes(0);
			OctoberTime.setSeconds(0);
			long October = OctoberTime.getTime();
			//11月
			Date NovemberTime = new Date();
			NovemberTime.setMonth(10);
			NovemberTime.setDate(1);
			NovemberTime.setHours(1);
			NovemberTime.setMinutes(0);
			NovemberTime.setSeconds(0);
			long November = NovemberTime.getTime();
			//12月
			Date DecemberTime = new Date();
			DecemberTime.setMonth(11);
			DecemberTime.setDate(1);
			DecemberTime.setHours(1);
			DecemberTime.setMinutes(0);
			DecemberTime.setSeconds(0);
			long December = DecemberTime.getTime();
			//初始化每个时间点的出入数
			//会员入场数
			
			//判断时间范围内记录的条数，就在相应的范围内+1
			//会员卡
			if(eight<Start && Start<nine && type.equals("会员卡")){
				eightUserCount = eightUserCount+1;
			}else if(nine<Start && Start<ten && type.equals("会员卡")){
				nineUserCount = nineUserCount+1;
			}else if(ten<Start && Start<eleven && type.equals("会员卡")){
				tenUserCount = tenUserCount+1;
			}else if(eleven<Start && Start<twelve && type.equals("会员卡")){
				elevenUserCount = elevenUserCount+1;
			}else if(twelve<Start && Start<thirteen && type.equals("会员卡")){
				twelveUserCount = twelveUserCount+1;
			}else if(thirteen<Start && Start<fourteen && type.equals("会员卡")){
				thirteenUserCount = thirteenUserCount+1;
			}else if(fourteen<Start && Start<fifteen && type.equals("会员卡")){
				fourteenUserCount = fourteenUserCount+1;
			}else if(fifteen<Start && Start<sixteen && type.equals("会员卡")){
				fifteenUserCount = fifteenUserCount+1;
			}else if(sixteen<Start && Start<seventeen && type.equals("会员卡")){
				sixteenUserCount = sixteenUserCount+1;
			}else if(seventeen<Start && Start<eighteen && type.equals("会员卡")){
				seventeenUserCount = seventeenUserCount+1;
			}else if(eighteen<Start && Start<nineteen && type.equals("会员卡")){
				eighteenUserCount = eighteenUserCount+1;
			}else if(nineteen<Start && Start<twenty && type.equals("会员卡")){
				nineteenUserCount = nineteenUserCount+1;
			}else if(twenty<Start && Start<end && type.equals("会员卡")){
				twentyUserCount = twentyUserCount+1;
			}
			//临时卡
			else if(eight<Start && Start<nine && type.equals("临时卡")){
				eightTempCount = eightTempCount+1;
			}else if(nine<Start && Start<ten && type.equals("临时卡")){
				nineTempCount = nineTempCount+1;
			}else if(ten<Start && Start<eleven && type.equals("临时卡")){
				tenTempCount = tenTempCount+1;
			}else if(eleven<Start && Start<twelve && type.equals("临时卡")){
				elevenTempCount = elevenTempCount+1;
			}else if(twelve<Start && Start<thirteen && type.equals("临时卡")){
				twelveTempCount = twelveTempCount+1;
			}else if(thirteen<Start && Start<fourteen && type.equals("临时卡")){
				thirteenTempCount = thirteenTempCount+1;
			}else if(fourteen<Start && Start<fifteen && type.equals("临时卡")){
				fourteenTempCount = fourteenTempCount+1;
			}else if(fifteen<Start && Start<sixteen && type.equals("临时卡")){
				fifteenTempCount = fifteenTempCount+1;
			}else if(sixteen<Start && Start<seventeen && type.equals("临时卡")){
				sixteenTempCount = sixteenTempCount+1;
			}else if(seventeen<Start && Start<eighteen && type.equals("临时卡")){
				seventeenTempCount = seventeenTempCount+1;
			}else if(eighteen<Start && Start<nineteen && type.equals("临时卡")){
				eighteenTempCount = eighteenTempCount+1;
			}else if(nineteen<Start && Start<twenty && type.equals("临时卡")){
				nineteenTempCount = nineteenTempCount+1;
			}else if(twenty<Start && Start<end && type.equals("临时卡")){
				twentyTempCount = twentyTempCount+1;
			}
			
			if(nowYear.equals(recordYear) && Start<February && type.equals("会员卡")){
				JanuaryUserCount = JanuaryUserCount+1;
			}else if(nowYear.equals(recordYear) && February<Start && Start<March && type.equals("会员卡")){
				FebruaryUserCount = FebruaryUserCount+1;
			}else if(nowYear.equals(recordYear) && March<Start && Start<April && type.equals("会员卡")){
				MarchUserCount = MarchUserCount+1;
			}else if(nowYear.equals(recordYear) && April<Start && Start<May && type.equals("会员卡")){
				AprilUserCount = AprilUserCount+1;
			}else if(nowYear.equals(recordYear) && May<Start && Start<June && type.equals("会员卡")){
				MayUserCount = MayUserCount+1;
			}else if(nowYear.equals(recordYear) && June<Start && Start<July && type.equals("会员卡")){
				JuneUserCount = JuneUserCount+1;
			}else if(nowYear.equals(recordYear) && July<Start && Start<August && type.equals("会员卡")){
				JulyUserCount = JulyUserCount+1;
			}else if(nowYear.equals(recordYear) && August<Start && Start<September && type.equals("会员卡")){
				AugustUserCount = AugustUserCount+1;
			}else if(nowYear.equals(recordYear) && September<Start && Start<October && type.equals("会员卡")){
				SeptemberUserCount = SeptemberUserCount+1;
			}else if(nowYear.equals(recordYear) && October<Start && Start<November && type.equals("会员卡")){
				OctoberUserCount = OctoberUserCount+1;
			}else if(nowYear.equals(recordYear) && November<Start && Start<December && type.equals("会员卡")){
				NovemberUserCount = NovemberUserCount+1;
			}else if(nowYear.equals(recordYear) && December<Start && type.equals("会员卡")){
				DecemberUserCount = DecemberUserCount+1;
			}
			
			else if(nowYear.equals(recordYear) && Start<February && type.equals("临时卡")){
				JanuaryTempCount = JanuaryTempCount+1;
			}else if(nowYear.equals(recordYear) && February<Start && Start<March && type.equals("临时卡")){
				FebruaryTempCount = FebruaryTempCount+1;
			}else if(nowYear.equals(recordYear) && March<Start && Start<April && type.equals("临时卡")){
				MarchTempCount = MarchTempCount+1;
			}else if(nowYear.equals(recordYear) && April<Start && Start<May && type.equals("临时卡")){
				AprilTempCount = AprilTempCount+1;
			}else if(nowYear.equals(recordYear) && May<Start && Start<June && type.equals("临时卡")){
				MayTempCount = MayTempCount+1;
			}else if(nowYear.equals(recordYear) && June<Start && Start<July && type.equals("临时卡")){
				JuneTempCount = JuneTempCount+1;
			}else if(nowYear.equals(recordYear) && July<Start && Start<August && type.equals("临时卡")){
				JulyTempCount = JulyTempCount+1;
			}else if(nowYear.equals(recordYear) && August<Start && Start<September && type.equals("临时卡")){
				AugustTempCount = AugustTempCount+1;
			}else if(nowYear.equals(recordYear) && September<Start && Start<October && type.equals("临时卡")){
				SeptemberTempCount = SeptemberTempCount+1;
			}else if(nowYear.equals(recordYear) && October<Start && Start<November && type.equals("临时卡")){
				OctoberTempCount = OctoberTempCount+1;
			}else if(nowYear.equals(recordYear) && November<Start && Start<December && type.equals("临时卡")){
				NovemberTempCount = NovemberTempCount+1;
			}else if(nowYear.equals(recordYear) && December<Start && type.equals("临时卡")){
				DecemberTempCount = DecemberTempCount+1;
				
			}
	    }
		mav.addObject("eightUserCount",eightUserCount);
		mav.addObject("nineUserCount",nineUserCount);
		mav.addObject("tenUserCount",tenUserCount);
		mav.addObject("elevenUserCount",elevenUserCount);
		mav.addObject("twelveUserCount",twelveUserCount);
		mav.addObject("thirteenUserCount",thirteenUserCount);
		mav.addObject("fourteenUserCount",fourteenUserCount);
		mav.addObject("fifteenUserCount",fifteenUserCount);
		mav.addObject("sixteenUserCount",sixteenUserCount);
		mav.addObject("seventeenUserCount",seventeenUserCount);
		mav.addObject("eighteenUserCount",eighteenUserCount);
		mav.addObject("nineteenUserCount",nineteenUserCount);
		mav.addObject("twentyUserCount",twentyUserCount);
		
		mav.addObject("eightTempCount",eightTempCount);
		mav.addObject("nineTempCount",nineTempCount);
		mav.addObject("tenTempCount",tenTempCount);
		mav.addObject("elevenTempCount",elevenTempCount);
		mav.addObject("twelveTempCount",twelveTempCount);
		mav.addObject("thirteenTempCount",thirteenTempCount);
		mav.addObject("fourteenTempCount",fourteenTempCount);
		mav.addObject("fifteenTempCount",fifteenTempCount);
		mav.addObject("sixteenTempCount",sixteenTempCount);
		mav.addObject("seventeenTempCount",seventeenTempCount);
		mav.addObject("eighteenTempCount",eighteenTempCount);
		mav.addObject("nineteenTempCount",nineteenTempCount);
		mav.addObject("twentyTempCount",twentyTempCount);
		
		mav.addObject("JanuaryUserCount",JanuaryUserCount);
		mav.addObject("FebruaryUserCount",FebruaryUserCount);
		mav.addObject("MarchUserCount",MarchUserCount);
		mav.addObject("AprilUserCount",AprilUserCount);
		mav.addObject("MayUserCount",MayUserCount);
		mav.addObject("JuneUserCount",JuneUserCount);
		mav.addObject("JulyUserCount",JulyUserCount);
		mav.addObject("AugustUserCount",AugustUserCount);
		mav.addObject("SeptemberUserCount",SeptemberUserCount);
		mav.addObject("OctoberUserCount",OctoberUserCount);
		mav.addObject("NovemberUserCount",NovemberUserCount);
		mav.addObject("DecemberUserCount",DecemberUserCount);
		
		mav.addObject("JanuaryTempCount",JanuaryTempCount);
		mav.addObject("FebruaryTempCount",FebruaryTempCount);
		mav.addObject("MarchTempCount",MarchTempCount);
		mav.addObject("AprilTempCount",AprilTempCount);
		mav.addObject("MayTempCount",MayTempCount);
		mav.addObject("JuneTempCount",JuneTempCount);
		mav.addObject("JulyTempCount",JulyTempCount);
		mav.addObject("AugustTempCount",AugustTempCount);
		mav.addObject("SeptemberTempCount",SeptemberTempCount);
		mav.addObject("OctoberTempCount",OctoberTempCount);
		mav.addObject("NovemberTempCount",NovemberTempCount);
		mav.addObject("DecemberTempCount",DecemberTempCount);
		mav.setViewName("back/statistic");
		return mav;
	}
	
	
	@RequestMapping("userEnter")
	public String userEnter(Record dto){
		//获取会员车牌号
		String userPlatenumber = dto.getrPlatenumber();
		//根据车牌号查询会员卡信息
		Card card = cardService.selectByPlatenumber(userPlatenumber);
		//获取当前系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date = df.format(new Date());// new Date()为获取当前系统时间
		//设置车辆入场时间
		card.setcStarttime(date);
		//查询空余车位
		List<Space> allFreeList = spaceService.allFreeList();
		//获取list随机值
		Random rand = new Random();
		Space dc = allFreeList.get(rand.nextInt(allFreeList.size()));
		String zone = dc.getsZone();
		String number = dc.getsNumber().toString();
		//修改对应随机车位状态
		dc.setsPlatenumber(card.getcPlatenumber());
		spaceService.updateUserState(dc);
		//保存信息到会员卡
		cardService.updateUserEnter(card);
		//生成入场纪录保存到记录表
		Record record = new Record();
		record.setrPlatenumber(card.getcPlatenumber());
		record.setrCardtype(card.getcType());
		record.setrUser(card.getcUser());
		record.setrStarttime(card.getcStarttime());
		record.setrParking(zone+'-'+number);
		recordService.userEnter(record);

		return "redirect:../record/show.do";
	}
	
	@RequestMapping("tempEnter")
	public String tempEnter(Record dto){
		//时间函数生成随机卡号
		long cardNumber = new Date().getTime();
		String cNumber = String.valueOf(cardNumber);
		//生成随机卡
		Card card = new Card();
		card.setcNumber(cNumber);
		card.setcPlatenumber(dto.getrPlatenumber());
		//获取当前系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date = df.format(new Date());// new Date()为获取当前系统时间
		card.setcStarttime(date);
		card.setcType("临时卡");
		//保存临时卡信息
		cardService.addTempCard(card);
		//查询空余车位
		List<Space> allFreeList = spaceService.allFreeList();
		//获取list随机值
		Random rand = new Random();
		Space dc = allFreeList.get(rand.nextInt(allFreeList.size()));
		String zone = dc.getsZone();
		String number = dc.getsNumber().toString();
		//修改对应车位的状态
		dc.setsPlatenumber(dto.getrPlatenumber());
		spaceService.updateUserState(dc);
		//存入停车场记录
		dto.setrCardtype("临时卡");
		dto.setrParking(zone+'-'+number);
		dto.setrStarttime(date);
		dto.setrUser("临时用户");
		recordService.userEnter(dto);
		return "redirect:../record/show.do";
	}
	
	@RequestMapping("selectRecord")
	public ModelAndView selectRecord(String selectString){
		ModelAndView mav = new ModelAndView();
		if(selectString!=""){
			//按照用户名查询
			List<Record> selectUserList = recordService.selectUserList(selectString);
			//按照车牌号查询
			List<Record> selectPlatenumberList = recordService.selectPlatenumberList(selectString);
			mav.addObject("selectUserList", selectUserList);
			mav.addObject("selectPlatenumberList", selectPlatenumberList);
		}else{
			List<Record> recordList = recordService.recordList();	
			mav.addObject("recordList", recordList);
		}
		mav.setViewName("back/inandout");
		return mav;
	}
	
	@RequestMapping("leavePark")
	public String leavePark(Record dto) throws java.text.ParseException{
		//根据车牌信息查询入场记录
		List<Record> record = recordService.selectRecordByPlatenumber(dto);
		//根据入场记录判断用户类型
		Record userRecord = record.get(0);
		String userType = userRecord.getrCardtype();
		//会员用户根据车牌信息查询会员卡信息
		Card userCard = cardService.selectByPlatenumber(dto.getrPlatenumber());
		if(userType.equals("会员卡")){
			//根据时间计算停车时长
			String startTime = userRecord.getrStarttime();
			//获取当前系统时间，并计算时间差
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String date = sdf.format(new Date());// new Date()为获取当前系统时间
			String EndTime = date;
			dto.setrEndtime(date);
			Date str;
			Date end;
			str = sdf.parse(startTime);
			end = sdf.parse(EndTime);
			long starttime = str.getTime();
			long endtime = end.getTime();
			long time = endtime-starttime;
			long hour = time/3600000;
			String timeString = Long.toString(hour);
	        Integer timeInteger = Integer.parseInt(timeString);
			//根据时长和用户类型查询相应的收费规则并计算费用
	        if(timeInteger<8 && timeInteger>0){
	        	//查询会员按小时收费规则
	        	Charge userHourCharge = chargeService.userHourCharge();
	        	String unitPrise = userHourCharge.getChUnitprise();
	        	Integer unitPriseInteger = Integer.parseInt(unitPrise);
	        	Integer money = unitPriseInteger*timeInteger;
	        	String prise = money.toString();
	        	dto.setrPrise(prise);
	        }else if(timeInteger==0){
	        	//查询小时
	        	Charge userHourCharge = chargeService.userHourCharge();
	        	String unitPrise = userHourCharge.getChUnitprise();
	        	Integer unitPriseInteger = Integer.parseInt(unitPrise);
	        	Integer money = unitPriseInteger;
	        	String prise = money.toString();
	        	dto.setrPrise(prise);
	        }else if(7<timeInteger && timeInteger<25){
	        	//查询会员按天收费
	        	Charge userDayCharge = chargeService.userDayCharge();
	        	String unitPrise = userDayCharge.getChUnitprise();
	        	Integer unitPriseInteger = Integer.parseInt(unitPrise);
	        	Integer money = unitPriseInteger;
	        	String prise = money.toString();
	        	dto.setrPrise(prise);
	        }else if(24<timeInteger){
	        	//时间除以24，整数部分按天收费，余数部分按小时收费
	        	Charge userHourCharge = chargeService.userHourCharge();
	        	Charge userDayCharge = chargeService.userDayCharge();
	        	String unitHourPrise = userHourCharge.getChUnitprise();
	        	String unitDayPrise = userDayCharge.getChUnitprise();
	        	Integer unitHourInteger = Integer.parseInt(unitHourPrise);
	        	Integer unitDayInteger = Integer.parseInt(unitDayPrise);
	        	//总小时数除以天数，整数部分乘以按天收费价格，余数部分乘以小时收费价格
	        	Integer dayMoneyInteger = timeInteger/24*unitDayInteger;
	        	Integer hourMoneyInteger = timeInteger%24*unitHourInteger;
	        	double dayMoney = Math.floor(dayMoneyInteger);
	        	double hourMoney = Math.floor(hourMoneyInteger);
	        	Integer Day =(int) dayMoney;
	        	Integer Hour =(int) hourMoney;
	        	Integer moneyInteger = Day+Hour;
	        	String prise = moneyInteger.toString();
	        	dto.setrPrise(prise);
	        }
			//用会员卡余额减去费用，如果小于0，则保存出入记录，并设定支付状态为    线上未支付
	        //用会员卡余额减去费用，如果大于0，则保存出入记录，用户余额减去支付金额，并设定支付状态为    线上已支付
			String prise = dto.getrPrise();
			Integer money = Integer.parseInt(prise);
			String userMoney = userCard.getcMoney();
			Integer usermoney = Integer.parseInt(userMoney);
			Integer lessMoney = usermoney-money;
			if(lessMoney<0){
				//保存未支付成功的会员记录
				recordService.updateUserLessRecord(dto);
			}else{
				//保存支付成功的会员记录
				recordService.updateUserOkRecord(dto);
				//更新用户余额信息
				String allMoney = lessMoney.toString();
				userCard.setcMoney(allMoney);
				cardService.updateUserMoney(userCard);
			}
			
		}else{
			//根据时间计算停车时长
			String startTime = userRecord.getrStarttime();
			//获取当前系统时间，并计算时间差
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String date = sdf.format(new Date());// new Date()为获取当前系统时间
			String EndTime = date;
			dto.setrEndtime(date);
			Date str;
			Date end;
			str = sdf.parse(startTime);
			end = sdf.parse(EndTime);
			long starttime = str.getTime();
			long endtime = end.getTime();
			long time = endtime-starttime;
			long hour = time/3600000;
			String timeString = Long.toString(hour);
	        Integer timeInteger = Integer.parseInt(timeString);
			//根据时长和用户类型查询相应的收费规则并计算费用
	        if(timeInteger<8 && timeInteger>0){
	        	//查询临时按小时收费规则
	        	Charge tempHourCharge = chargeService.tempHourCharge();
	        	String unitPrise = tempHourCharge.getChUnitprise();
	        	Integer unitPriseInteger = Integer.parseInt(unitPrise);
	        	Integer money = unitPriseInteger*timeInteger;
	        	String prise = money.toString();
	        	dto.setrPrise(prise);
	        }else if(7<timeInteger && timeInteger<25){
	        	//查询临时按天收费
	        	Charge tempDayCharge = chargeService.tempDayCharge();
	        	String unitPrise = tempDayCharge.getChUnitprise();
	        	Integer unitPriseInteger = Integer.parseInt(unitPrise);
	        	Integer money = unitPriseInteger;
	        	String prise = money.toString();
	        	dto.setrPrise(prise);
	        }else if(0==timeInteger){
	        	//查询临时按天收费
	        	Charge tempHourCharge = chargeService.tempHourCharge();
	        	String unitPrise = tempHourCharge.getChUnitprise();
	        	Integer unitPriseInteger = Integer.parseInt(unitPrise);
	        	Integer money = unitPriseInteger;
	        	String prise = money.toString();
	        	dto.setrPrise(prise);
	        }else if(24<timeInteger){
	        	//时间除以24，整数部分按天收费，余数部分按小时收费
	        	Charge tempHourCharge = chargeService.tempHourCharge();
	        	Charge tempDayCharge = chargeService.tempDayCharge();
	        	String unitHourPrise = tempHourCharge.getChUnitprise();
	        	String unitDayPrise = tempDayCharge.getChUnitprise();
	        	Integer unitHourInteger = Integer.parseInt(unitHourPrise);
	        	Integer unitDayInteger = Integer.parseInt(unitDayPrise);
	        	//总小时数除以天数，整数部分乘以按天收费价格，余数部分乘以小时收费价格
	        	Integer dayMoneyInteger = timeInteger/24*unitDayInteger;
	        	Integer hourMoneyInteger = timeInteger%24*unitHourInteger;
	        	double dayMoney = Math.floor(dayMoneyInteger);
	        	double hourMoney = Math.floor(hourMoneyInteger);
	        	Integer Day =(int) dayMoney;
	        	Integer Hour =(int) hourMoney;
	        	Integer moneyInteger = Day+Hour;
	        	String prise = moneyInteger.toString();
	        	dto.setrPrise(prise);
	        }
			//费用保存到记录，支付状态为线下未支付       
			recordService.updateTempRecord(dto);
			//删除临时卡
			cardService.deleteTemp(dto.getrPlatenumber());
		}
		//修改车位状态
		String platenumber = userRecord.getrPlatenumber();
		spaceService.updateLeave(platenumber);
		return "redirect:../record/show.do";
	}
	
}
