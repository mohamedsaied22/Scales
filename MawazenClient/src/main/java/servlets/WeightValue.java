package servlets;

import classes.SerialConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "WeightValue")
public class WeightValue extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(response);
    }
    private void process(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        System.out.println("weight value : " + SerialConnection.readDataFromSerialPort());
        System.out.println("ports:");
        SerialConnection.getSerialPortsNames();

        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Headers", "Origin, X-Requested_With, Content-Type, Accept");
        response.getWriter().println(SerialConnection.readDataFromSerialPort());
    }

}
