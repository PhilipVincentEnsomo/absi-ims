package com.absi.ims.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.absi.ims.dao.IMSOutletDao;
import com.absi.ims.domain.IMSOutlet;

@Service
public class IMSOutletServiceImpl implements IMSOutletService {

	@Autowired
	private IMSOutletDao imsOutletDao;

	@Override
	public void addIMSOutlet(IMSOutlet imsOutlet) {
		imsOutletDao.save(imsOutlet);
	}

	@Override
	public List<IMSOutlet> getAllIMSOutlets() {
		return (List<IMSOutlet>) imsOutletDao.findAll();
	}

	@Override
	public IMSOutlet getIMSOutletById(Long id) {
		return imsOutletDao.findOne(id);
	}

	@Override
	public void updateIMSOutlet(IMSOutlet imsOutlet) {
		imsOutletDao.save(imsOutlet);
	}

	@Override
	public void deleteIMSOutlet(IMSOutlet imsOutlet) {
		imsOutletDao.delete(imsOutlet);
	}
	
}
