package study.jsp.petstudio.controller.aboutus;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.jsp.helper.BaseController;


@WebServlet("/aboutus/intro.do")
public class Intro extends BaseController {
	private static final long serialVersionUID = 1L;
       

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "aboutus/intro";
	}

}
