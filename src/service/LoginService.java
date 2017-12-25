package service;

public interface LoginService {
	//登录验证
	public boolean login(String name,String password);
	//账户注册验证
	public boolean logins(String name);
}
