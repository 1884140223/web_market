package service.Impl;

import java.util.List;

import dao.AccountDao;
import dao.Impl.AccountDaoImpl;
import entity.Account;
import service.AccountService;

public class AccountServiceImpl implements AccountService {
	/**
	 * 查询个人信息
	 * @param account
	 * @return
	 */
	@Override
	public List<Account> getAccount(Account account) {
		AccountDao accountDao = new AccountDaoImpl();
		List<Account> listAccount = accountDao.getAccount(account);
		return listAccount;
	}

	/**
	 * 修改个人信息
	 * @param account
	 * @return
	 */
	@Override
	public boolean updata_person(Account account) {
		boolean flag=false;
		AccountDao accountDao = new AccountDaoImpl();
		int num = accountDao.updata_person(account);
		if(1==num){
			flag=true;
		}
		return flag;
	}

	/**
	 * 增加用户
	 * @param account
	 * @return
	 */
	@Override
	public boolean insert_person(Account account) {
		boolean flag=false;
		AccountDao accountDao = new AccountDaoImpl();
		int num = accountDao.insert_person(account);
		if(1==num){
			flag=true;
		}
		return flag;
	}

	/**
	 * 重置密码
	 * @param account
	 * @return
	 */
	@Override
	public boolean update_pwd(Account account) {
		boolean flag=false;
		AccountDao accountDao = new AccountDaoImpl();
		int num = accountDao.update_pwd(account);
		if(1==num){
			flag=true;
		}
		return flag;
	}
	
	

}
