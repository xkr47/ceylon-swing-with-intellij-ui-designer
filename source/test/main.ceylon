import javax.swing {
    SwingUtilities
}
import java.lang {
    Runnable
}

shared void run() {
    SwingUtilities.invokeAndWait(object satisfies Runnable {
        shared actual void run() {
            Test().show();
        }
    });
}
