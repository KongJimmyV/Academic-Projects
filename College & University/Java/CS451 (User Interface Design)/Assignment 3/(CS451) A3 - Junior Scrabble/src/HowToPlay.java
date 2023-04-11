import java.awt.CardLayout;
import java.awt.EventQueue;
import java.awt.Font;

import javax.swing.GroupLayout;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;

public class HowToPlay {

    /**
     * How To Play Frame
     */
    protected JFrame frame;
    private JPanel panelHowToPlay;
    
    private JLabel lblNewLabel;
    private JLabel lblNewLabel_1;
    private JTextArea txtrTest_1;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    HowToPlay window = new HowToPlay();
                    window.frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the application.
     */
    public HowToPlay() {
        initialize();
    }

    /**
     * Initialize the contents of the frame.
     */
    private void initialize() {
        frame = new JFrame();
        frame.getContentPane().setLocation(-112, -125);
        frame.getContentPane().setLayout(new CardLayout(0, 0));
        frame.setTitle("Scrabble How To Play");
        frame.setResizable(false);
        frame.setBounds(1000 + 100, 20, 300, 420);
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        //frmHowToPlay.setVisible(true);
        
        panelHowToPlay = new JPanel();
        frame.getContentPane().add(panelHowToPlay, "name_97044216737200");
        
        JTextArea txtrTest = new JTextArea();
        txtrTest.setFont(new Font("Dialog", Font.PLAIN, 12));
        txtrTest.setEditable(false);
        txtrTest.setLineWrap(true);
        txtrTest.setText("Test\r\n    Test\r\n\r\nTest\r\n    Test\r\n\r\nTest\r\n    Test\r\n\r\n");
        txtrTest.setBounds(89, 398, 219, 218);
        
        lblNewLabel = new JLabel("Rules");
        lblNewLabel.setFont(new Font("Dialog", Font.BOLD, 28));
        
        lblNewLabel_1 = new JLabel("How To Play");
        lblNewLabel_1.setFont(new Font("Dialog", Font.BOLD, 28));
        
        txtrTest_1 = new JTextArea();
        txtrTest_1.setFont(new Font("Dialog", Font.PLAIN, 12));
        txtrTest_1.setEditable(false);
        txtrTest_1.setText("Test\r\n    Test\r\n\r\nTest\r\n    Test\r\n\r\nTest\r\n    Test\r\n\r\n");
        txtrTest_1.setLineWrap(true);
        GroupLayout gl_panelHowToPlay = new GroupLayout(panelHowToPlay);
        gl_panelHowToPlay.setHorizontalGroup(
            gl_panelHowToPlay.createParallelGroup(Alignment.LEADING)
                .addGroup(gl_panelHowToPlay.createSequentialGroup()
                    .addContainerGap()
                    .addGroup(gl_panelHowToPlay.createParallelGroup(Alignment.LEADING)
                        .addGroup(gl_panelHowToPlay.createParallelGroup(Alignment.LEADING, false)
                            .addComponent(txtrTest)
                            .addComponent(lblNewLabel_1, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(lblNewLabel, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addComponent(txtrTest_1, GroupLayout.PREFERRED_SIZE, 219, GroupLayout.PREFERRED_SIZE))
                    .addContainerGap(763, Short.MAX_VALUE))
        );
        gl_panelHowToPlay.setVerticalGroup(
            gl_panelHowToPlay.createParallelGroup(Alignment.LEADING)
                .addGroup(gl_panelHowToPlay.createSequentialGroup()
                    .addContainerGap()
                    .addComponent(lblNewLabel)
                    .addPreferredGap(ComponentPlacement.RELATED)
                    .addComponent(txtrTest, GroupLayout.PREFERRED_SIZE, 136, GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(ComponentPlacement.RELATED)
                    .addComponent(lblNewLabel_1, GroupLayout.PREFERRED_SIZE, 37, GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(ComponentPlacement.RELATED)
                    .addComponent(txtrTest_1, GroupLayout.PREFERRED_SIZE, 136, GroupLayout.PREFERRED_SIZE)
                    .addContainerGap(595, Short.MAX_VALUE))
        );
        panelHowToPlay.setLayout(gl_panelHowToPlay);
        
    }

}
