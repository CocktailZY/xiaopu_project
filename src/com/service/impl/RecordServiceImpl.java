package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.RecordMapper;
import com.model.Record;
import com.model.Space;
import com.service.RecordService;

/**
 * <p>类名：RecordServiceImpl</p>
 * <p>类功能描述：进出记录的serviceImpl</p>
 * @类作者：renguangqi
 * @创建时间：2018-5-2 上午9:53:15
 */
@Service
@Transactional
public class RecordServiceImpl implements RecordService {

	@Resource
	private RecordMapper recordMapper;

	public List<Record> recordList() {
		List<Record> recordList = recordMapper.recordList();
		return recordList;
	}

	public void userEnter(Record record) {
		recordMapper.userEnter(record);
	}

	public List<Record> selectUserList(String selectString) {
		List<Record> selectUserList = recordMapper.selectUserList(selectString);
		return selectUserList;
	}

	public List<Record> selectPlatenumberList(String selectString) {
		List<Record> selectPlatenumberList = recordMapper.selectPlatenumberList(selectString);
		return selectPlatenumberList;
	}

	public List<Record> selectRecordByPlatenumber(Record dto) {
		List<Record> record =recordMapper.selectRecordByPlatenumber(dto);
		return record;
	}

	public void updateUserLessRecord(Record dto) {
		recordMapper.updateUserLessRecord(dto);
	}

	public void updateUserOkRecord(Record dto) {
		recordMapper.updateUserOkRecord(dto);
	}

	public void updateTempRecord(Record dto) {
		recordMapper.updateTempRecord(dto);
	}

}
