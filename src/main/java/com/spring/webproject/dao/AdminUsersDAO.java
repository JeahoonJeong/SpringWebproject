package com.spring.webproject.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.webproject.dto.AdminUsersDTO;
import com.spring.webproject.util.SearchCriteria;


@Repository
public class AdminUsersDAO {
	
	@Inject
	private SqlSession sessionTemplate;
	
	
	public List<AdminUsersDTO> getUserList(SearchCriteria cri){
		
		List<AdminUsersDTO> list = sessionTemplate.selectList("adminUsersMapper.selectAll",cri);
		
		return list;
	}
	
	public void delUser(String userId) {
		
		sessionTemplate.delete("adminUsersMapper.deleteUser", userId);
		
	}
	
	public int getTotalCount(SearchCriteria cri) {
		
		return sessionTemplate.selectOne("adminUsersMapper.getTotalCount",cri);
	}
	
}
