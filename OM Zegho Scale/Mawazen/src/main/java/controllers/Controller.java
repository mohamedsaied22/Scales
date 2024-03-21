package controllers;

import helpers.ControllerHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Controller")
public class Controller extends HttpServlet {
    ControllerHelper controllerHelper = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        controllerHelper = new ControllerHelper(request, response);
        System.out.println("n:"+request.getParameter("n"));
        if (request.getParameter("n") == null) {
            request.getRequestDispatcher("demo.jsp").forward(request, response);
        } else {
            switch (Integer.valueOf(request.getParameter("n"))) {
                case (1):
                    controllerHelper.login();
                    break;
                case (2):
                    controllerHelper.logout();
                    break;
                case (3):
                    controllerHelper.createOperation();
                    //controllerHelper.goTo("demo.jsp");
                    break;
                case (4):
                    long id = controllerHelper.recordSecondWeight();

                    //controllerHelper.goTo("weight_card.jsp?n="+ id);
                    break;
                case(5):
                    controllerHelper.goTo("demo.jsp");
                    break;
                case(6):
                    controllerHelper.goTo("demo2.jsp");
                    break;
                case(7):
                    controllerHelper.saveUser();
                    break;
                case(8):
                    controllerHelper.goTo("create_user.jsp");
                    break;
                case(9):
                    controllerHelper.saveClient();
                    break;
                case(10):
                    controllerHelper.saveGoods();
                    break;
                case(11):
                    controllerHelper.saveShip();
                    break;
                case(12):
                    controllerHelper.openClientGoodsBalance();
                    break;
                case(13):
                    int status = controllerHelper.changePassword();
                    response.getWriter().println(status);
                    break;
                case(14):
                    controllerHelper.saveSafetyTax();
                    break;

            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("signIn.html").forward(request, response);

    }
}
