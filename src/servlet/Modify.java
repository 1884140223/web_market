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
import service.LoginService;
import service.Impl.AccountServiceImpl;
import service.Impl.LoginServiceImpl;

/**
 * Servlet implementation class Modify
 */
@WebServlet("/Modify")
public class Modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AccountService accountService = new AccountServiceImpl();
	LoginService loginService = new LoginServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Modify() {
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
		String phone = request.getParameter("code");
		String password = request.getParameter("password");
		Account account = new Account();
		account.setCode(phone);
		account.setPassword(password);
		boolean f=accountService.update_pwd(account);
		if(f){
			PrintWriter pw = response.getWriter();
			pw.write("0");
			return;
		}else{
			PrintWriter pw = response.getWriter();
			pw.write("1");
			return;
		}
	}
		
		
	}	
 

