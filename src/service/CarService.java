package service;


import entity.Account;
import entity.Car;
import entity.Page;

public interface CarService {
	
	/**
	 * 订单部分
	 */
	//查询获取订单
	public Page getCar(Account account,int pageNo,int pageSize);
	//增加订单
	public boolean addCar(Car car);
	//删除订单
	public boolean deleteCar(Car car);
	//修改订单
	public boolean updateCar(Car car);
	
}
