package dao;

import java.util.List;
import entity.*;
/**
 * 增删改查
 * @author Administrator
 *
 */
public interface AccountDao {
	//查询个人信息
	public List<Account> getAccount(Account account);
	
	//修改个人信息
	public int updata_person(Account account);
	
	//增加用户
	public int insert_person(Account account);
	
	//重置密码
	public int update_pwd(Account account);
}
