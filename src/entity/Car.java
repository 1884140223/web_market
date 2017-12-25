package entity;

public class Car {
	private String commodity;	//商品
	private String person;		//收货人
	private String oneMoney;	//单价
	private String number;		//数量
	private String money;		//总价
	private String status;		//状态
	private String id;			//购物车订单号
	private String adress;		//收货地址
	private String code;		//购买用户账号
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOneMoney() {
		return oneMoney;
	}
	public void setOneMoney(String oneMoney) {
		this.oneMoney = oneMoney;
	}
	public String getCommodity() {
		return commodity;
	}
	public void setCommodity(String commodity) {
		this.commodity = commodity;
	}
	public String getPerson() {
		return person;
	}
	public void setPerson(String person) {
		this.person = person;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
