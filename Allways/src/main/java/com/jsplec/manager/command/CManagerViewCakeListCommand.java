package com.jsplec.manager.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsplec.manager.dao.ManagerCakeDao;
import com.jsplec.manager.dto.cakeListDto;

public class CManagerViewCakeListCommand implements CManagerCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ManagerCakeDao dao=new ManagerCakeDao();
		ArrayList<cakeListDto> dtos=dao.viewCakeList();
		int index=1;
		int rowcount=7;
		int pagecount=5;
		int pagepage=0;
		
		if (request.getParameter("index")!=null) {
			index=(int)Float.parseFloat(request.getParameter("index"));
		}
		
		if (index%pagecount==0) {
			pagepage=index/pagecount-1;
		} else {
			pagepage=index/pagecount;
		}
		
		request.setAttribute("Dtos", dtos);
		request.setAttribute("Size", dtos.size());
		request.setAttribute("index", index);
		request.setAttribute("rowcount", rowcount);
		request.setAttribute("pagecount", pagecount);
		request.setAttribute("pagepage", pagepage);
	}

	@Override
	public boolean execute2(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return false;
	}

}
