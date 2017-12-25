package service.Impl;

import java.util.List;

import dao.CarDao;
import dao.Impl.CarDaoImpl;
import entity.Account;
import entity.Car;
import entity.Page;
import service.CarService;

public class CarServiceImpl implements CarService {
/**
 * 订单部分
 */
	/**
	 * 查询获取订单
	 */
	@Override
	public Page getCar(Account account,int pageNo,int pageSize) {		//订单
		CarDao carDao = new CarDaoImpl();
		Page page = carDao.getCar(account,pageNo,pageSize);
		return page;
	}

	/**
	 * 增加订单
	 */
	@Override
	public boolean addCar(Car car) {
		boolean flag=false;
		CarDao carDao = new CarDaoImpl();
		int num = carDao.addCar(car);
		if(1==num){
			flag=true;
		}
		return flag;
	}

	/**
	 * 删除订单
	 */
	@Override
	public boolean deleteCar(Car car) {
		boolean flag=false;
		CarDao carDao = new CarDaoImpl();
		int num = carDao.deleteCar(car);
		if(1==num){
			flag=true;
		}
		return flag;
	}

	/**
	 * 修改订单
	 */
	@Override
	public boolean updateCar(Car car) {
		// TODO Auto-generated method stub
		boolean flag=false;
		CarDao carDao = new CarDaoImpl();
		int num = carDao.updateeCar(car);
		if(1==num){
			flag=true;
		}
		return flag;
	}
	

	
	

	

}
