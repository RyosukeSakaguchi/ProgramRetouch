package ec;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BuyDataBeans;
import beans.BuyDetailDataBeans;
import dao.BuyDAO;
import dao.BuyDetailDAO;

/**
 * 購入履歴画面
 * @author d-yamaguchi
 *
 */
@WebServlet("/UserBuyHistoryDetail")
public class UserBuyHistoryDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//リクエストパラメーターの取得
		int buyId = Integer.parseInt(request.getParameter("buy_id"));

		//購入IDがbuyIdである購入履歴を取得
		BuyDataBeans bdb = new BuyDataBeans();
		try {
			bdb = BuyDAO.getBuyDataBeansByBuyId(buyId);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		//リクエストパラメーターを生成
		request.setAttribute("bdb", bdb);

		//購入IDがbuyIdであるアイテムリストを取得
		ArrayList<BuyDetailDataBeans> buyDetailList = new ArrayList<BuyDetailDataBeans>();
		try {
			buyDetailList = BuyDetailDAO.getBuyDataBeansListByBuyId(buyId);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		//リクエストパラメーターを生成
		request.setAttribute("buyDetailList", buyDetailList);

		//フォワード
		request.getRequestDispatcher(EcHelper.USER_BUY_HISTORY_DETAIL_PAGE).forward(request, response);

	}
}
