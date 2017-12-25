package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.DataSource;
import dao.LoginDao;

public class LoginDaoImpl implements LoginDao {
	private Connection conn;
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	
	/**
	 * 登录验证
	 */
	@Override
	public int login(String code, String password) {
		int i=0;
		conn = DataSource.getConnecion();
		String sql="select * from account where phone ='"+ code + "' and password='"+password+"';";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			rs.last();
			i=rs.getRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	/**
	 * 验证账户是否已注册
	 */
	public int logins(String code) {
		int i=0;
		conn = DataSource.getConnecion();
		String sql="select * from account where phone ='"+ code +"';";
		try {
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			rs.last();
			i=rs.getRow();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
