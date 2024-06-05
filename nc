//BITSTUFFING

import java.util.*;
public class Bitstuffing
{
public static void main(String[] args)
{
Scanner sc=new Scanner(System.in);
System.out.print("Enter the message: ");
String d1 = sc.nextLine();
String remaining = new String();
String output=new String();
int counter = 0;
for(int i=0;i<d1.length();i++)
{
if (d1.charAt(i)!='1' && d1.charAt(i)!='0')
{
System.out.println("Enter valid Binary values");
return;
}
if(d1.charAt(i) == '1')
{
counter++;
remaining = remaining + d1.charAt(i);
}
else
{
remaining = remaining + d1.charAt(i);
counter = 0;
}
if(counter == 5)
{
remaining = remaining + '0';
counter = 0;
}
}
System.out.println("Flag:- 01111110");
String new1=("|01111110 |" +remaining+ "| 01111110|");
System.out.println("Stuffed data at intermediate site is: ");
System.out.print("------------------------------------");
    System.out.println();
System.out.println(" "+new1);
System.out.print("------------------------------------");
System.out.println();
System.out.println("Destuffed BIT is: "+d1);
}
}


//CHARACTER STUFFING

import java.util.*;
public class charstuff{
    public static void main(String[] args)
    {
        Scanner sc=new Scanner(System.in);
        System.out.println("enter no. of char:");
        int n=sc.nextInt();
        String ch[]=new String[n];
        for(int i=0;i<n;i++)
        {
            ch[i]=sc.next();
        }
        for(int i=0;i<n;i++)
        {
            if(ch[i].equals("cb"))
            {
                ch[i]="cb cb";
            }
        }
        System.out.println("Transmitted msg: ");
        System.out.print("malar ");
        for(int i=0;i<n;i++)
        {
            System.out.print(ch[i]+" ");
        }
        System.out.print(" malar");
    }
}

//Sliding window protocol
//Server
//Server.java
import java.io.*;
import java.net.*;
class Server {
    public static void main(String args[]) {
        try {
            ServerSocket server = new ServerSocket(1234);
            System.out.println("Running");
            while (true) {
                Socket client = server.accept();
                BufferedReader in = new BufferedReader(new InputStreamReader(client.getInputStream()));
                PrintWriter out = new PrintWriter(client.getOutputStream(), true);
                String re;
                while ((re = in.readLine()) != null) {
                    System.out.println("received: " + re);
                    out.println("Response to: " + re); // Send response back to the client
                }
                client.close();
                System.out.println("Disconnected");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

//client

import java.io.*;
import java.net.*;
class Client {
    public static void main(String args[]){
        try{
            Socket soc = new Socket("localhost", 1234); 
            System.out.println("Waiting...");
            BufferedReader in = new BufferedReader(new InputStreamReader(soc.getInputStream()));
            PrintWriter out = new PrintWriter(soc.getOutputStream(), true);
            for (int i = 0; i < 10; i++){
                out.println("Packet" + i); // Send a message to the server
                System.out.println("Packet" + i);
                System.out.println("Response: " + in.readLine());
            }
            soc.close();
            System.out.println("Disconnected");
        } catch(IOException e){
            e.printStackTrace();
        }
    }
}


//stop and wait protocol
//Server

import java.io.*;
import java.net.*;

public class Server {
    public static void main(String[] args) {
        try {
            ServerSocket serverSocket = new ServerSocket(1234);
            System.out.println("Server is running...");
            while (true) {
                Socket clientSocket = serverSocket.accept();
                System.out.println("Client connected: " + clientSocket);
                BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
                PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
                String receivedData;
                while ((receivedData = in.readLine()) != null) {
                    System.out.println("Received from client: " + receivedData);
                    out.println("ACK");
                }
                clientSocket.close();
                System.out.println("Client disconnected.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

//Client

import java.io.*;
import java.net.*;
public class Client {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("localhost", 1234);
            System.out.println("Connected to server.");
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
            for (int i = 0; i < 10; i++) {
                out.println("Packet " + i);
                System.out.println("Sent to server: Packet " + i);
                String response = in.readLine();
                System.out.println("Response from server: " + response);
            }
            socket.close();
            System.out.println("Connection closed.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

//ping server
//server
import java.io.*;
import java.net.*;
public class Server {
    public static void main(String[] args) {
        try {
            ServerSocket serverSocket = new ServerSocket(5555);
            System.out.println("Server is running...");
            while (true) {
                Socket socket = serverSocket.accept();
                System.out.println("Client connected: " + socket);
                BufferedReader inputReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                PrintWriter outputWriter = new PrintWriter(socket.getOutputStream(), true);
                for (int i = 0; i < 4; i++) {
                    String message = inputReader.readLine();
                    System.out.println("Received: " + message);
                    outputWriter.println("Reply from " + socket.getInetAddress() + "; Length " + message.length());
                }
                System.out.println("Data sent successfully.");
                socket.close();
                System.out.println("Client disconnected.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

//client

import java.io.*;
import java.net.Socket;
public class Client {
    public static void main(String[] args) throws Exception {
        try (Socket socket = new Socket("127.0.0.1", 5555);
             BufferedReader inputReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
             PrintWriter outputWriter = new PrintWriter(socket.getOutputStream(), true)) {
            String message = "Welcome to network programming world";
            for (int i = 0; i < 4; i++) {
                outputWriter.println(message);
                System.out.println(inputReader.readLine());
            }
        }
    }
}

//Traceroute
//only server
import java.io.*;
public class Server {
    public static void main(String[] args) {
        try {
            System.out.print("Enter the IP Address to be Traced: ");
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            String ip = reader.readLine();
            ProcessBuilder processBuilder = new ProcessBuilder("tracert", ip); //"tracepath"
            Process process = processBuilder.start();
            BufferedReader inputReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = inputReader.readLine()) != null) {
                System.out.println(" " + line);
            }
            int exitCode = process.waitFor();
            if (exitCode != 0) {
                System.err.println("Error: Traceroute command failed with exit code " + exitCode);
            }
        } catch (IOException | InterruptedException e) {
            System.err.println(e.getMessage());
        }
    }
}

//TCP
//Server
import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
public class Server {
    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(5000)) {
            System.out.println("Server is listening on port 5000");
            while (true) {
                try (Socket socket = serverSocket.accept();
                     BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                     BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()))) {
                    String msgFromClient;
                    while ((msgFromClient = reader.readLine()) != null) {
                        System.out.println("Client: " + msgFromClient);
                        writer.write("MSG Received\n");
                        writer.flush();
                        if (msgFromClient.equalsIgnoreCase("BYE")) {
                            break;
                        }
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

//Client


import java.io.*;
import java.net.Socket;
public class Client {
    public static void main(String[] args) {
        try (Socket socket = new Socket("127.0.0.1", 5000);
             BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
             BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
             BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()))) {
            System.out.println("Connected");
            String line;
            while (!(line = input.readLine()).equalsIgnoreCase("BYE")) {
                writer.write(line + "\n");
                writer.flush();
                System.out.println("Server: " + reader.readLine());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

//SUBNet
//Server
import java.io.*;
import java.net.*;
public class SubServer {
    public static void main(String[] args) {
        try (ServerSocket serverSocket = new ServerSocket(12345)) {
            System.out.println("Server listening on port 12345...");
            while (true) {
                try (Socket clientSocket = serverSocket.accept();
                     PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
                     BufferedReader in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()))) {
                    String ipAddress = in.readLine();
                    out.println("Available subnet range: " + ipAddress.substring(0, ipAddress.lastIndexOf('.') + 1) + "0 - " + ipAddress.substring(0, ipAddress.lastIndexOf('.') + 1) + "255");

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

//Client

import java.io.*;
import java.net.*;
public class SubClient {
    public static void main(String[] args) {
        try (Socket socket = new Socket("localhost", 12345);
             PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
             BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
             BufferedReader userInput = new BufferedReader(new InputStreamReader(System.in))) {
            System.out.print("Enter IP address: ");
            out.println(userInput.readLine());
            in.lines().forEach(System.out::println);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

//http web
//server
import java.io.*;
import java.net.*;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import javax.swing.*;
public class WebServer {
    public static void main(String[] args) {
        try (ServerSocket server = new ServerSocket(3000)) {
            System.out.println("Server waiting for image...");
            try (Socket socket = server.accept()) {
                System.out.println("Client connected.");
                InputStream in = socket.getInputStream();
                BufferedImage image = ImageIO.read(in);
                if (image == null) {
                    System.err.println("Failed to read image from input stream.");
                    return;
                }
                JFrame frame = new JFrame("Received Image");
                frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame.getContentPane().add(new JLabel(new ImageIcon(image)));
                frame.pack();
                frame.setVisible(true);
                System.out.println("Image received and displayed.");
            } catch (IOException e) {
                System.err.println("Error reading image from client.");
                e.printStackTrace();
            }
        } catch (IOException e) {
            System.err.println("Server error.");
            e.printStackTrace();
        }
    }
}

//client

import java.io.*;
import java.net.*;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
public class WebClient {
    public static void main(String[] args) {
        String filePath = "C:\\Users\\devam\\OneDrive\\Documents\\ss23.jpg";
        // Check if file exists
        File imageFile = new File(filePath);
        if (!imageFile.exists()) {
            System.err.println("File not found: " + imageFile.getAbsolutePath());
            return;
        }
        try (Socket soc = new Socket("localhost", 3000)) {
            System.out.println("Client is running.");
            BufferedImage image = ImageIO.read(imageFile);
            if (image == null) {
                System.err.println("Could not read image file: " + filePath);
                return;
            }
            ImageIO.write(image, "jpeg", soc.getOutputStream());
            System.out.println("Image sent to server.");
        } catch (IOException e) {
            System.err.println("Error sending image to server.");
            e.printStackTrace();
        }
    }
}

//UDP
//Server
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
public class UDPServer {
    public static void main(String[] args) {
        try (DatagramSocket socket = new DatagramSocket(1234)) {
            byte[] receiveData = new byte[65535];
            System.out.println("Server is running and waiting for messages...");
            while (true) {
                DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
                socket.receive(receivePacket);
                String receivedMessage = new String(receivePacket.getData(), 0, receivePacket.getLength());
                System.out.println("Client: " + receivedMessage);

                if (receivedMessage.trim().equals("bye")) {
                    System.out.println("Client sent bye... EXITING");
                    break;
                }
            }
        } catch (IOException e) {
            System.err.println("IOException in server:");
            e.printStackTrace();
        }
    }
}

//Client
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.util.Scanner;
public class UDPClient {
    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in);
             DatagramSocket socket = new DatagramSocket()) {
            InetAddress serverAddress = InetAddress.getLocalHost();
            System.out.println("Client is running. Enter messages to send to the server:");
            while (true) {
                System.out.print("Enter message: ");
                String input = scanner.nextLine();
                byte[] buffer = input.getBytes();
                DatagramPacket sendPacket = new DatagramPacket(buffer, buffer.length, serverAddress, 1234);
                socket.send(sendPacket);
                System.out.println("Sent message: " + input);
                if (input.trim().equals("bye")) {
                    System.out.println("Client sent bye... EXITING");
                    break;
                }
            }
        } catch (IOException e) {
            System.err.println("IOException in client:");
            e.printStackTrace();
        }
    }
}













