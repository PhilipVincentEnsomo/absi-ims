package com.absi.ims.dao;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.absi.ims.domain.IMSProduct;

@Transactional
public interface IMSProductDao extends CrudRepository<IMSProduct, Long> {

}
