package com.jsplec.manager.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsplec.manager.dao.CManagerOrdersReviewDao;
import com.jsplec.manager.dto.ordersReviewDto;

public class CManagerViewOrdersReviewDetailCommand implements CManagerCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int oreviewId = Integer.parseInt(request.getParameter("oreviewId"));
		CManagerOrdersReviewDao dao = new CManagerOrdersReviewDao();
		ordersReviewDto dto=dao.viewOrdersReviewDetail(oreviewId);
		
		request.setAttribute("DTO", dto);
	}

	@Override
	public boolean execute2(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return false;
	}

}
