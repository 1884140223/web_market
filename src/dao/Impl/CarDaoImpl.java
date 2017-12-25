package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DataSource;
import dao.CarDao;
import entity.Account;
import entity.Car;
import entity.Page;

public class CarDaoImpl implements CarDao {
	private Connection conn;
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	int totalCount=0;	//查询总结果数
	Page page=null;
	@Override
	/**
	 * 查询订单
	 */
	public Page getCar(Account account,int pageNo,int pageSize) {
		conn = DataSource.getConnecion();
		Car car = new Car();
		List<Car> listCar = new ArrayList<Car>();
		try {
			String sql = "select count(*) from orders where code = '"+account.getCode()+"';";
			pst = conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				totalCount = rs.getInt(1);
			}
			/*****************************/
			String sqls="select * from orders where code='"+account.getCode()+"' order by id desc limit "+(pageNo-1)*pageSize+","+pageSize+";";
			pst = conn.prepareStatement(sqls);
			rs = pst.executeQuery();
			while(rs.next()){
				car = new Car();
				car.setCommodity(rs.getString("commodity"));
				car.setPerson(rs.getString("person"));
				car.setOneMoney(rs.getString("oneMoney"));
				car.setNumber(rs.getString("number"));
				car.setMoney(rs.getString("money"));
				car.setAdress(rs.getString("adress"));
				car.setStatus(rs.getString("status"));
				car.setId(rs.getString("id"));
				listCar.add(car);
			}
			page=new Page(pageSize, totalCount);
			page.setData(listCar);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DataSource.closeAll(rs, pst, conn);
		}
		return page;
	}
	
	/**
	 * 加入购物车
	 */
	@Override
	public int addCar(Car car) {
		int num=0;
		conn = DataSource.getConnecion();
		String sql = "insert into orders(commodity,oneMoney,person,number,money,status,id,adress,code) value(?,?,?,?,?,?,?,?,?);"; 
		try{
			pst=conn.prepareStatement(sql);
			pst.setString(1, car.getCommodity());
			pst.setString(2, car.getOneMoney());
			pst.setString(3, car.getPerson());
			pst.setString(4, car.getNumber());
			pst.setString(5, car.getMoney());
			pst.setString(6, car.getStatus());
			pst.setString(7, car.getId());
			pst.setString(8, car.getAdress());
			pst.setString(9, car.getCode());
			num=pst.executeUpdate();
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			DataSource.closeAll(rs, pst, conn);
		}
		return num;
	}
	
	/**
	 * 删除订单
	 */
	@Override
	public int deleteCar(Car car) {
		int num=0;
		conn = DataSource.getConnecion();
		String sql = "delete from orders where id = '"+car.getId()+"';"; 
		try{
			pst=conn.prepareStatement(sql);
			num=pst.executeUpdate();
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			DataSource.closeAll(rs, pst, conn);
		}
		return num;
	}
	
	/**
	 * 订单支付
	 */
	@Override
	public int updateeCar(Car car) {
		// TODO Auto-generated method stub
		int num=0;
		conn = DataSource.getConnecion();
		String sql="update orders set status= '已支付' where id= '"+car.getId()+"';";
		try {
			pst=conn.prepareStatement(sql);
			num=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DataSource.closeAll(rs, pst, conn);
		}
		return num;
	}
	
	


}
