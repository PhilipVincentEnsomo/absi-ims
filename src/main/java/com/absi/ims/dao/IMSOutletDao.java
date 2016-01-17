package com.absi.ims.dao;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.absi.ims.domain.IMSOutlet;

@Transactional
public interface IMSOutletDao extends CrudRepository<IMSOutlet, Long> {

}
