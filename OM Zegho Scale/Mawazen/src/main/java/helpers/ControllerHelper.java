package helpers;

import elements.*;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

public class ControllerHelper extends HelperBase {
    HibernateHelper hibernateHelper = new HibernateHelper(request, response);

    public ControllerHelper(HttpServletRequest request, HttpServletResponse response) {

        super(request, response);
        // init shiro - place this e.g. in the constructor
        //Factory<SecurityManager> factory = new IniSecurityManagerFactory();
        //org.apache.shiro.mgt.SecurityManager securityManager = factory.getInstance();
        //SecurityUtils.setSecurityManager(securityManager);

    }



    public void login() throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<User> users = hibernateHelper.retreiveData("from User where username = '" + username + "' and password = '" + password + "'");
        if (users.size() == 1) {
            HttpSession session = request.getSession(true);
            //session.setMaxInactiveInterval(1800);
            for (User user : users) {
                session.setAttribute("user", user);
            }
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("signIn.html").forward(request, response);
        }

    }

    public void logout() throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");
            System.out.println(user.getName() + " Logging out");
            session.removeAttribute("user");
            session.invalidate();
            request.getRequestDispatcher("signIn.html").forward(request, response);
            System.out.println(user.getName() + " logout");
        }
        request.getRequestDispatcher("signIn.html").forward(request, response);
    }

    public void createOperation() throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        System.out.println(request.getParameter("first_weight"));
        int first_weight = Integer.valueOf(request.getParameter("first_weight"));
        String vechile_num = request.getParameter("vechile_num");
        String maqtura_num = request.getParameter("maqtura_num");

        //Ship ship = (Ship) hibernateHelper.retreiveData(Ship.class, Long.valueOf(request.getParameter("ship")));
        boolean firstWeightAutomatic = Boolean.parseBoolean(request.getParameter("auto"));
        Client client = (Client) hibernateHelper.retreiveData(Client.class, Long.valueOf(request.getParameter("client")));
        //OperationType operationType = session1.get(OperationType.class, Long.valueOf(request.getParameter("operation_type")));
        Goods goods = (Goods) hibernateHelper.retreiveData(Goods.class, Long.valueOf(request.getParameter("goods")));
        Operation operation = new Operation(vechile_num, maqtura_num, first_weight, firstWeightAutomatic, client, goods, null, user);
        hibernateHelper.saveData(operation);

        response.getWriter().println(operation.getId());
    }

    public long recordSecondWeight() throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        int second_weight = Integer.valueOf(request.getParameter("second_weight"));



        Operation operation = (Operation) hibernateHelper.retreiveData(Operation.class, Long.valueOf(request.getParameter("operation")));
        ClientGoods clientGoods = getClientGoods(operation.getClient(),operation.getGoods());

        operation.setSecondWeight(Integer.valueOf(request.getParameter("second_weight")));
        operation.setSecondWeightAutomatic(Boolean.parseBoolean(request.getParameter("auto")));
        operation.setUser2(user);
        OperationType operationType = (OperationType) hibernateHelper.retreiveData(OperationType.class, Long.valueOf(getOperationType(operation.getFirstWeight(), operation.getSecondWeight())));
        operation.setOperationType(operationType);
        if (operation.getOperationType().getId() == 1) {
            operation.setNetWeight(operation.getFirstWeight() - Integer.valueOf(request.getParameter("second_weight")));
            clientGoods.setInBalance(clientGoods.getInBalance() + operation.getNetWeight());
        } else if (operation.getOperationType().getId() == 2) {
            operation.setNetWeight(Integer.valueOf(request.getParameter("second_weight")) - operation.getFirstWeight());
            clientGoods.setOutBalance(clientGoods.getOutBalance() + operation.getNetWeight());
        }

        operation.setEndDate(new Date());
        operation.setEndTime(new Date());
        operation.setDone(true);
        hibernateHelper.updateData(operation);
        hibernateHelper.updateData(clientGoods);
        response.getWriter().println(operation.getId());
        return operation.getId();

    }

    private int getOperationType(int firstWeight, int secondWeight) {
        if (firstWeight > secondWeight) {
            return 1;
        } else if (firstWeight < secondWeight) {
            return 2;
        } else {
            return 0;
        }
    }

    public void goTo(String page) throws ServletException, IOException {
        request.getRequestDispatcher(page).forward(request, response);
    }


    public void saveUser() throws IOException, ServletException {
        User user = null;
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Role role = (Role) hibernateHelper.retreiveData(Role.class, Long.valueOf(request.getParameter("role")));
        List<User> users = hibernateHelper.retreiveData("from User where userName = '" + username + "'");
        if (users.size() == 0) {
            user = new User(username, name, password, role);
            hibernateHelper.saveData(user);
        }

    }

    public void saveClient() throws IOException {
        Client client = new Client(request.getParameter("client"));
        hibernateHelper.saveData(client);
    }

    public void saveShip() throws IOException {
        Ship ship = new Ship(request.getParameter("ship"));
        hibernateHelper.saveData(ship);
    }

    public void saveGoods() throws IOException {
        Goods goods = new Goods(request.getParameter("goods"));
        hibernateHelper.saveData(goods);
    }
    private ClientGoods getClientGoods(Client client, Goods goods) throws IOException {
        ClientGoods clientGoods;
        List<ClientGoods> clientGoodsList = hibernateHelper.retreiveData("from ClientGoods where client = " + client.getId() + " and goods = " + goods.getId());
        if (clientGoodsList.size() == 0) {
            clientGoods = new ClientGoods(client, goods);
            hibernateHelper.saveData(clientGoods);
        } else {
            clientGoods = clientGoodsList.get(0);
        }
        return clientGoods;
    }

    public void openClientGoodsBalance() throws IOException {
        Client client = (Client) hibernateHelper.retreiveData(Client.class, Long.valueOf(request.getParameter("client")));
        Goods goods = (Goods) hibernateHelper.retreiveData(Goods.class, Long.valueOf(request.getParameter("goods")));

        ClientGoods clientGoods = getClientGoods(client, goods);
        int opening_balance = Integer.parseInt(request.getParameter("opening_balance"));
        clientGoods.setOpeningBalance(opening_balance);
        hibernateHelper.updateData(clientGoods);
    }
    public int changePassword() throws IOException {
        //User user = (User) this.hibernateHelper.retreiveData(User.class, Long.valueOf(request.getParameter("user_id")));
        User user = (User) request.getSession().getAttribute("user");
        String currentPassword = request.getParameter("current_password");
        String newPassword = request.getParameter("new_password");
        String reNewPassword = request.getParameter("re_new_password");
        if (user.getPassword().equals(currentPassword) && newPassword.equals(reNewPassword)) {
            user.setPassword(newPassword);
            hibernateHelper.updateData(user);
            return (1);
        } else {
            return (0);
        }

    }

    public void saveSafetyTax() throws IOException {
        Operation operation = (Operation) hibernateHelper.retreiveData(Operation.class, Long.valueOf(request.getParameter("operation")));
        operation.setSafetyTax(Integer.valueOf(request.getParameter("tax")));
        hibernateHelper.updateData(operation);
    }
}
