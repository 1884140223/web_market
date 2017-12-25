package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import common.DataSource;

import dao.AccountDao;
import entity.Account;



public class AccountDaoImpl implements AccountDao {
	private Connection conn;
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	/**
	 * 查找个人信息
	 */
	@Override
	public List<Account> getAccount(Account account) {
		conn = DataSource.getConnecion();
		String sql = "select * from account;";
		if(null != account.getCode()){
			sql="select * from account where phone ='"+account.getCode()+"';";
		}
		List<Account> listAccount = new ArrayList<Account>();
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				account = new Account();
				account.setPassword(rs.getString("password"));
				account.setCode(rs.getString("phone"));
				account.setSex(rs.getString("sex"));
				account.setBirthday(rs.getString("birthday"));
				account.setEmail(rs.getString("email"));
				account.setName(rs.getString("name"));
				listAccount.add(account);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DataSource.closeAll(rs, pst, conn);
		}
		return listAccount;
	}
	
	/**
	 * 修改个人信息
	 */
	@Override
	public int updata_person(Account account) {
		int num=0;
		conn = DataSource.getConnecion();
		String sql="update account set sex=?,birthday=?,email=?,name=? where phone= '"+account.getCode()+"';";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, account.getSex());
			pst.setString(2, account.getBirthday());
			pst.setString(3, account.getEmail());
			pst.setString(4, account.getName());
			num=pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DataSource.closeAll(rs, pst, conn);
		}
		return num;
	}
	

	/**
	 * 增加用户
	 */
	@Override
	public int insert_person(Account account) {
		int num=0;
		conn = DataSource.getConnecion();
		String sql="insert into account(password,phone,name,email) value(?,?,?,?);";
		try{
			pst=conn.prepareStatement(sql);
			pst.setString(1, account.getPassword());
			pst.setString(2, account.getCode());
			pst.setString(3,account.getName());
			pst.setString(4,account.getEmail());
			num=pst.executeUpdate();
		}catch(Exception e1){
			e1.printStackTrace();
		}finally{
			DataSource.closeAll(rs, pst, conn);
		}
		return num;
	}

	
	/**
	 * 重置密码
	 */
	@Override
	public int update_pwd(Account account) {
		int num=0;
		conn = DataSource.getConnecion();
		String sql="update account set password=? where phone= '"+account.getCode()+"';";
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, account.getPassword());
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
