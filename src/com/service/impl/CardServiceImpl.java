package com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.CardMapper;

import com.model.Card;

import com.service.CardService;



@Service
@Transactional
public class CardServiceImpl implements CardService {

	@Resource
	private CardMapper cardMapper;
	
	public List<Card> allCardList() {
		List<Card> allCardList = cardMapper.allCardList();
		return allCardList;
	}

	public void addCard(Card dto) {
		cardMapper.addCard(dto);
	}

	public String selectMoneyBycNumber(String cNumber) {
		String money = cardMapper.selectMoneyBycNumber(cNumber);
		return money;
	}

	public void addMoney(Card dto) {
		cardMapper.addMoney(dto);
	}

	public void deleteCard(Integer cId) {
		cardMapper.deleteCard(cId);
	}

	public void updateCard(Card dto) {
		cardMapper.updateCard(dto);
	}

	public List<Card> selectNumberList(String selectString) {
		List<Card> selectNumberList = cardMapper.selectNumberList(selectString);
		return selectNumberList;
	}

	public List<Card> selectUserList(String selectString) {
		List<Card> selectUserList = cardMapper.selectUserList(selectString);
		return selectUserList;
	}

	public List<Card> selectPlatenumberList(String selectString) {
		List<Card> selectPlatenumberList = cardMapper.selectPlatenumberList(selectString);
		return selectPlatenumberList;
	}

	public Card selectByPlatenumber(String userPlatenumber) {
		Card card = cardMapper.selectByPlatenumber(userPlatenumber);
		return card;
	}

	public void reduceMoney(String cNumber) {
		cardMapper.reduceMoney(cNumber);
	}

	public void updateUserEnter(Card card) {
		cardMapper.updateUserEnter(card);
	}

	public void addTempCard(Card card) {
		cardMapper.addTempCard(card);
	}

	public void updateUserMoney(Card userCard) {
		cardMapper.updateUserMoney(userCard);
	}

	public void deleteTemp(String getrPlatenumber) {
		cardMapper.deleteTemp(getrPlatenumber);
	}

	
}
