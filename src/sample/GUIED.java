package sample;

import org.jpl7.Term;
import sample.Solver;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

public class GUIED  extends JPanel implements ActionListener {
    JTable table = new JTable(9,9);
    JTextField jTextField = new JTextField();
    JButton jButton = new JButton("Solve");
    JLabel label = new JLabel("Words");

    GUIED()
    {
        setPreferredSize(new Dimension(340,300));
        setLayout(null);
        table.setBounds(20,20,300,143);
        label.setBounds(20,180,50,25);
        jTextField.setBounds(80,180,250,25);
        jButton.setBounds(20,235,300,25);
        add(label);
        add(table);
        add(jTextField);
        add(jButton);
        jButton.addActionListener(this);
    }


    public void actionPerformed(ActionEvent e)
    {
        if (e.getSource() == jButton)
        {
            Solver solver = new Solver();
            Term Words[] = solver.solve(jTextField.getText());
            table.setBackground(Color.LIGHT_GRAY);
            Horzintal(table,Words[0].toString(),1);
            Horzintal(table,Words[1].toString(),3);
            Horzintal(table,Words[2].toString(),5);
            Horzintal(table,Words[3].toString(),7);
            Vertical(table,Words[4].toString(),1);
            Vertical(table,Words[5].toString(),3);
            Vertical(table,Words[6].toString(),5);
            Vertical(table,Words[7].toString(),7);

        }

    }
    public void Vertical(JTable table,String s,int c){
        for (int i = 8; i >= 0;i--)
        {
            table.setValueAt(s.charAt(i),i,c);
        }
    }
    public void Horzintal(JTable table,String s,int r){
        for (int i = 8; i >= 0;i--)
        {
            table.setValueAt(s.charAt(i),r,i);
        }
    }
}
