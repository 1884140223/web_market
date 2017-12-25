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
import service.AccountService;
import service.Impl.AccountServiceImpl;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AccountService accountService = new AccountServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		String phone=request.getParameter("code");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String year=request.getParameter("year");
		String month=request.getParameter("month");
		String day=request.getParameter("day");
		String email=request.getParameter("email");
		String birthday=year+"-"+month+"-"+day;
		Account account = new Account();
		account.setCode(phone);
		account.setSex(sex);
		account.setBirthday(birthday);
		account.setEmail(email);
		account.setName(name);
		boolean flag = accountService.updata_person(account);
		if(flag){
			List<Account> listAccount =new ArrayList<Account>();
			listAccount = accountService.getAccount(account);
			String names = listAccount.get(0).getName();
			session.setAttribute("name", names);
			session.setAttribute("code", phone);
			session.setAttribute("listAccount", listAccount);
 			PrintWriter pw = response.getWriter();
			pw.write("0");
			return;
		}
		PrintWriter pw = response.getWriter();
		pw.write("1");
		return;
	}

}
