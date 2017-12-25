package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Car;
import service.CarService;
import service.Impl.CarServiceImpl;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CarService carService = new CarServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String code = request.getParameter("code");
		String commodity = request.getParameter("commodity");
		String oneMoney = request.getParameter("oneMoney");
		String person = request.getParameter("name");
		String province = request.getParameter("province");
		String adre = request.getParameter("adress");
		String adress = province + adre ;
		String status = request.getParameter("status");
		String number = request.getParameter("number");
		String id = request.getParameter("id");
		String f = request.getParameter("flag");
		//String money = request.getParameter("money");
		double o =Double.parseDouble(oneMoney);
		double num=Double.parseDouble(number);
		double sum=o*num;
		String money = Double.toString(sum);
		Car car = new Car();
		car.setCommodity(commodity);
		car.setOneMoney(oneMoney);
		car.setPerson(person);
		car.setStatus(status);
		car.setNumber(number);
		car.setMoney(money);
		car.setId(id);
		car.setAdress(adress);
		car.setCode(code);
		boolean flag = carService.addCar(car);
		if(flag){
			if(f.equals("1")){
				PrintWriter pw = response.getWriter();
				pw.write("0");
				return;
			}else if(f.equals("2")){
				PrintWriter pw = response.getWriter();
				pw.write("2");
				return;
			}
		}else{
			PrintWriter pw = response.getWriter();
			pw.write("1");
			return;
		}
	}

}
