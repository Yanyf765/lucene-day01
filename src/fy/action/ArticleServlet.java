package fy.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fy.entity.Page;
import fy.service.ArticleService;

public class ArticleServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			// 获取关键字
			String keywords = request.getParameter("keywords");// 培训
			if (keywords == null || keywords.trim().length() == 0) {
				keywords = "培训";// 默认值
			}
			// 获取当前页号
			String temp = request.getParameter("currPageNO");
			if (temp == null || temp.trim().length() == 0) {
				temp = "1";//默认值
			}
			//调用业务层
			ArticleService articleService = new ArticleService();
			Page page = articleService.show(keywords, Integer.parseInt(temp));
			//将Page对象绑定到request域对象中
			request.setAttribute("PAGE", page);
			//将keywords变量绑定到request域对象中
			request.setAttribute("KEYWORDS", keywords);
			//转发到list页面中
			request.getRequestDispatcher("/list.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

}
