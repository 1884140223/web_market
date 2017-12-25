package service;

import java.util.List;

import dao.AccountDao;
import dao.Impl.AccountDaoImpl;
import entity.Account;

public interface AccountService {
	/**
	 * 查询个人信息
	 * @param account
	 * @return
	 */
	public List<Account> getAccount(Account account);
	/**
	 * 修改个人信息
	 * @param account
	 * @return
	 */
	public boolean updata_person(Account account);
	/**
	 * 增加用户
	 * @param account
	 * @return
	 */
	public boolean insert_person(Account account);
	
	/**
	 * 重置密码
	 * @param account
	 * @return
	 */
	public boolean update_pwd(Account account);
}
