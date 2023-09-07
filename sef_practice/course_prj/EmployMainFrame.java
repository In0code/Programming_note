package self_practice_course_prj;

import javax.swing.JFrame;

@SuppressWarnings("serial")
public class EmployMainFrame extends JFrame {

	public EmployMainFrame() {
		super("메인");

		setBounds(400, 100, 1200, 800);
		setVisible(true);
		new EmployProfManageDialog(this);

		this.setResizable(false);

		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
	}

	public static void main(String[] args) {
		new EmployMainFrame();
	}

}
