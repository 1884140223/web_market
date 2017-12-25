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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginService loginservice = new LoginServiceImpl();
	AccountService accountService=new AccountServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		Account account = new Account();
		String flags=request.getParameter("flag");
		if(flags==null){	//登录验证
			String code = request.getParameter("code");
			String password = request.getParameter("password");
			boolean flag = loginservice.login(code, password);
			List<Account> listAccount = new ArrayList<Account>();
			if (flag) {
				session.setAttribute("code", code);
				account.setCode(code);
				listAccount = accountService.getAccount(account);
				String name = listAccount.get(0).getName();
				session.setAttribute("name", name);
				session.setAttribute("listAccount", listAccount);
				PrintWriter pw = response.getWriter();
				pw.write("0");
				return;
			}
				PrintWriter pw = response.getWriter();
				pw.write("1");
				return;
		}else if(flags.equals("1")){	//修改密码验证
			String code = request.getParameter("code");
			String password = request.getParameter("password");
			boolean flag = loginservice.login(code, password);
			if (flag) {
				PrintWriter pw = response.getWriter();
				pw.write("0");
				return;
			}
				PrintWriter pw = response.getWriter();
				pw.write("1");
				return;
		}
	}
		
}




