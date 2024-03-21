package classes;

import jssc.SerialPort;
import jssc.SerialPortException;
import jssc.SerialPortList;

public class SerialConnection {
    public static void getSerialPortsNames() {
        String[] portNames = SerialPortList.getPortNames();
        System.out.println("length:" + portNames.length);
        for (int i = 0; i < portNames.length; i++) {
            System.out.println(portNames[i]);
        }
    }

    public static void writeDataToSerialPort() {
        SerialPort serialPort = new SerialPort("COM3");
        try {
            serialPort.openPort();//Open serial port
            serialPort.setParams(SerialPort.BAUDRATE_9600,
                    SerialPort.DATABITS_8,
                    SerialPort.STOPBITS_1,
                    SerialPort.PARITY_NONE);//Set params. Also you can set params by this string: serialPort.setParams(9600, 8, 1, 0);
            serialPort.writeBytes("This is a test string".getBytes());//Write data to port
            serialPort.closePort();//Close serial port
        } catch (SerialPortException ex) {
            System.out.println(ex);
        }
    }

    public static String readDataFromSerialPort() {
        SerialPort serialPort = new SerialPort("COM3");
        String dataString = null;
        try {
            serialPort.openPort();//Open serial port
            serialPort.setParams(9600, 8, 1, 0);//Set params
            serialPort.setFlowControlMode(SerialPort.FLOWCONTROL_RTSCTS_IN |
                    SerialPort.FLOWCONTROL_RTSCTS_OUT);

            dataString = serialPort.readString(10).substring(1).trim();
            //byte[] buffer = serialPort.readBytes();//Read 10 bytes from serial port
            /*System.out.println("buffer length : " + buffer.length);
            for (int i = 0; i < buffer.length; i++) {
                System.out.println(buffer[i]);
            }*/
            serialPort.closePort();//Close serial port

        } catch (SerialPortException ex) {
            System.out.println(ex);
        }
        return dataString;
    }
}
