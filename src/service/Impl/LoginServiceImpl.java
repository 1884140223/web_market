package service.Impl;

import service.LoginService;
import dao.LoginDao;
import dao.Impl.*;
public class LoginServiceImpl implements LoginService {
	/**
	 * 登录验证
	 */
	@Override
	public boolean login(String code,String password) {
		LoginDao logindao = new LoginDaoImpl();
		boolean flag=false;
		int i=logindao.login(code, password);
		if(1==i){
			flag=true;
		}
		return flag;
	}

	/**
	 * 账户注册验证
	 */
	public boolean logins(String code) {
		LoginDao logindao = new LoginDaoImpl();
		boolean flag=false;
		int i=logindao.logins(code);
		if(0==i){
			flag=true;
		}
		return flag;
	}
}
