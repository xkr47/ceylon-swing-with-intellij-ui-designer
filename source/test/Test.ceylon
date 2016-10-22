import javax.swing {
    JFrame
}
import java.awt.event {
    ActionListener,
    ActionEvent
}

shared class Test() extends TestForm() {
    shared void show() {
        value frame = JFrame("Hello world");
        frame.contentPane.add(panel1);
        frame.defaultCloseOperation = JFrame.\iEXIT_ON_CLOSE;
        frame.pack();

        ohHelloButton.addActionListener(object satisfies ActionListener {
            shared actual void actionPerformed(ActionEvent e) {
                ohHelloButton.text += "!";
            }
        });

        frame.visible = true;
    }
}
