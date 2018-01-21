package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.SpaceMapper;
import com.mapper.ZoneMapper;
import com.model.Admin;
import com.model.Space;
import com.model.Zone;

import com.service.ZoneService;



@Service
@Transactional
public class ZoneServiceImpl implements ZoneService {
	
	@Resource
	private ZoneMapper zoneMapper;

	public List<Zone> allZoneList() {
		List<Zone> allZoneList = zoneMapper.allZoneList();
		return allZoneList;
	}

	public void addZone(Zone dto) {
		zoneMapper.addZone(dto);
	}

	public String selectZoneById(Integer zId) {
		String zone = zoneMapper.selectZoneById(zId);
		return zone;
	}

	public void deleteZone(Integer zId) {
		zoneMapper.deleteZone(zId);
	}

	
}
