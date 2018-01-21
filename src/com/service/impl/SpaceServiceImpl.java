package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.SpaceMapper;
import com.model.Record;
import com.model.Space;
import com.service.SpaceService;

/**
 * <p>类名：SpaceServiceImpl</p>
 * <p>类功能描述：停车场车位的serviceImpl</p>
 * @类作者：renguangqi
 * @创建时间：2018-5-2 上午9:55:10
 */
@Service
@Transactional
public class SpaceServiceImpl implements SpaceService {

	@Resource
	private SpaceMapper spaceMapper;

	public Integer getFreeCount() {
		Integer getFreeCount = spaceMapper.getFreeCount();
		return getFreeCount;
	}

	public Integer getCarCount() {
		Integer getCarCount = spaceMapper.getCarCount();
		return getCarCount;
	}

	
	public Integer getAllSpaceCount() {
		Integer getAllSpaceCount = spaceMapper.getAllSpaceCount();
		return getAllSpaceCount;
	}

	

	public List<Space> allSpaceList() {
		List<Space> allSpaceList = spaceMapper.allSpaceList();
		return allSpaceList;
	}

	public void deleteSpaceByZone(String zName) {
		spaceMapper.deleteSpaceByZone(zName);
	}

	public List<String> allNumberList(Space dto) {
		List<String> allNumberList = spaceMapper.allNumberList(dto);
		return allNumberList;
	}

	public void addSpace(Space dto) {
		spaceMapper.addSpace(dto);
	}

	public void deleteSpace(Integer sId) {
		spaceMapper.deleteSpace(sId);
	}

	public List<Space> selectSpaceByZone(String zName) {
		List<Space> selectSpaceByZone = spaceMapper.selectSpaceByZone(zName);
		return selectSpaceByZone;
	}

	public List<Space> allZoneNameList() {
		List<Space> allZoneNameList = spaceMapper.allZoneNameList();
		return allZoneNameList;
	}

	public List<Space> allFreeList() {
		List<Space> allFreeList = spaceMapper.allFreeList();
		return allFreeList;
	}

	public void updateUserState(Space dc) {
		spaceMapper.updateUserState(dc);
	}

	public void updateLeave(String platenumber) {
		spaceMapper.updateLeave(platenumber);
	}


}
