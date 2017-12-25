package dao;

import java.util.List;

import entity.Account;
import entity.Car;
import entity.Page;

public interface CarDao {
	//查询订单
	public Page getCar(Account account,int pageNo,int pageSize);
	
	//添加订单
	public int addCar(Car car);
	
	//删除订单
	public int deleteCar(Car car);

	//支付订单修改状态
	public int updateeCar(Car car);

}
