package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.ChargeMapper;
import com.model.Charge;

import com.service.ChargeService;


/**
 * <p>类名：ChargeServiceImpl</p>
 * <p>类功能描述：收费规则的serviceImpl</p>
 * @类作者：renguangqi
 * @创建时间：2018-3-2 上午9:31:28
 */
@Service
@Transactional
public class ChargeServiceImpl implements ChargeService {

	@Resource
	private ChargeMapper chargeMapper;

	public void addCharge(Charge dto) {
		chargeMapper.addCharge(dto);
	}

	public void deleteCharge(Integer chId) {
		chargeMapper.deleteCharge(chId);
	}

	public List<Charge> allInterimList() {
		List<Charge> allInterimList = chargeMapper.allInterimList();
		return allInterimList;
	}

	public List<Charge> allMemberList() {
		List<Charge> allMemberList = chargeMapper.allMemberList();
		return allMemberList;
	}

	public List<Charge> allChargeList() {
		List<Charge> allChargeList = chargeMapper.allChargeList();
		return allChargeList;
	}

	public Charge userHourCharge() {
		Charge charge = chargeMapper.userHourCharge();
		return charge;
	}

	public Charge userDayCharge() {
		Charge charge = chargeMapper.userDayCharge();
		return charge;
	}

	public Charge tempHourCharge() {
		Charge charge = chargeMapper.tempHourCharge();
		return charge;
	}

	public Charge tempDayCharge() {
		Charge charge = chargeMapper.tempDayCharge();
		return charge;
	}
}
