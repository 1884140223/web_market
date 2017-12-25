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

import entity.Commodity;
import service.CommodityService;
import service.Impl.CommodityServiceImpl;

/**
 * Servlet implementation class CommodityServlet
 */
@WebServlet("/CommodityServlet")
public class CommodityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommodityService commodityService = new CommodityServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommodityServlet() {
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
		List<Commodity> listCommodity = new ArrayList<Commodity>();
		listCommodity = commodityService.getCommodity();
		session.setAttribute("listCommodity", listCommodity);
		PrintWriter pw = response.getWriter();
		pw.write("0");
		return;
	}

}
