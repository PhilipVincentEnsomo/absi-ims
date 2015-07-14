package com.absi.ims.dao;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.absi.ims.domain.IMSUser;

@Transactional
public interface IMSUserDao extends CrudRepository<IMSUser, Long> {

}
