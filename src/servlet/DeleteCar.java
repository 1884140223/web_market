package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Account;
import entity.Car;
import entity.Page;
import service.CarService;
import service.Impl.CarServiceImpl;

/**
 * Servlet implementation class DeleteCar
 */
@WebServlet("/DeleteCar")
public class DeleteCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCar() {
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
		String code = request.getParameter("code");
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		String id = request.getParameter("id");
		String f = request.getParameter("flag");
		HttpSession session = request.getSession();
		CarService carService = new CarServiceImpl();
		Account account = new Account();
		account.setCode(code);
		Car car = new Car();
		car.setId(id);
		boolean flag=carService.deleteCar(car);
		if(flag){
			Page page = carService.getCar(account, pageNo, 5);
			page.setPageNo(pageNo);
			session.setAttribute("page", page);
			if(f.equals("1")){
				PrintWriter pw = response.getWriter();
				pw.write("0");
				return;
			}else if(f.equals("2")){
				PrintWriter pw = response.getWriter();
				pw.write("4");
				return;
			}
		}else{
			PrintWriter pw = response.getWriter();
			pw.write("1");
			return;
		}
	}

}
