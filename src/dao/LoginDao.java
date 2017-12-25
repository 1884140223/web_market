package dao;

public interface LoginDao {
	/**
	 * 登录查询验证
	 */
	public int login(String name,String password);

	/**
	 * 验证账户是否已注册
	 */
	public int logins(String name);
}
