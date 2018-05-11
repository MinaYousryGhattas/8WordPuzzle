package sample;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import javax.naming.ldap.Control;

//public class Main extends Application {
//
//    @Override
//    public void start(Stage primaryStage) throws Exception{
////        Parent root = FXMLLoader.load(getClass().getResource("sample.fxml"));
////        primaryStage.setTitle("Hello World");
////        primaryStage.setScene(new Scene(root, 300, 275));
////        primaryStage.show();
//
//
////        Solver solver = new Solver();
////        solver.solve();
//
//    }
//
//
//    public static void main(String[] args) {
//        launch(args);
//    }
//}
import javax.swing.*;
import java.io.IOException;
import java.util.Scanner;
import java.util.Vector;

/**
 * Created by Mina_Yousry on 02/12/2017.
 */
public class Main {


    public static void main(String[] args) throws IOException {
//        Controller.Compress(2,2,10 ,"200200.jpg");
//        Controller.Decompress(2,2,"outimage.jpg");
        JFrame frame = new JFrame("Puzzle Solver");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(new GUIED());
        frame.pack();
        frame.setVisible(true);
    }



}
