package service.Impl;

import java.util.List;

import dao.CommodityDao;
import dao.Impl.CommodityDaoImpl;
import entity.Commodity;
import service.CommodityService;

public class CommodityServiceImpl implements CommodityService {
	/**
	 * 商品查询
	 */
	@Override
	public List<Commodity> getCommodity() {
		CommodityDao commdityDao = new CommodityDaoImpl();
		List<Commodity> listCommodity = commdityDao.getCommodity();
		return listCommodity;
	}

}
