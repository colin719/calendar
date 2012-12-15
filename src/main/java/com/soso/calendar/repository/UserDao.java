package com.soso.calendar.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import com.soso.calendar.entity.User;

public interface UserDao extends PagingAndSortingRepository<User, Long> {
	User findByLoginName(String loginName);
}
