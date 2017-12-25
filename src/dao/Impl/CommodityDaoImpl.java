package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DataSource;
import dao.CommodityDao;
import entity.Commodity;

public class CommodityDaoImpl implements CommodityDao {
	private Connection conn;
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	
	/**
	 * 查询商品
	 */
	@Override
	public List<Commodity> getCommodity() {
		conn = DataSource.getConnecion();
		String sql = "select * from commodity;";
		Commodity commodity = new Commodity();
		List<Commodity> listcommodity = new ArrayList<Commodity>();
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()){
				commodity = new Commodity();
				commodity.setImg(rs.getString("img"));
				commodity.setTitle(rs.getString("title"));
				commodity.setContent(rs.getString("content"));
				commodity.setMoney(rs.getString("money"));
				listcommodity.add(commodity);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DataSource.closeAll(rs, pst, conn);
		}
		return listcommodity;
	}

}
