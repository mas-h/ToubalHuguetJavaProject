package aspects.serialisation;

import java.awt.EventQueue;

import javax.swing.GroupLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JScrollPane;
import javax.swing.JSeparator;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.JToolBar;
import javax.swing.JTree;
import javax.swing.GroupLayout.Alignment;
import javax.swing.LayoutStyle.ComponentPlacement;

public class InterfaceLexicographicTree {

	private JFrame frame;
	private JTextField textField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					InterfaceLexicographicTree window = new InterfaceLexicographicTree();
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
	public InterfaceLexicographicTree() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 495, 297);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JToolBar toolBar = new JToolBar();
		toolBar.setFloatable(false);
		
		JSeparator separator = new JSeparator();
		
		JTabbedPane panel = new JTabbedPane();
		GroupLayout groupLayout = new GroupLayout(frame.getContentPane());
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.TRAILING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addGroup(groupLayout.createSequentialGroup()
							.addContainerGap()
							.addComponent(panel, GroupLayout.DEFAULT_SIZE, 462, Short.MAX_VALUE)
							.addPreferredGap(ComponentPlacement.RELATED)
							.addComponent(separator, GroupLayout.DEFAULT_SIZE, 3, Short.MAX_VALUE))
						.addComponent(toolBar, GroupLayout.DEFAULT_SIZE, 483, Short.MAX_VALUE))
					.addContainerGap())
		);
		groupLayout.setVerticalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addComponent(toolBar, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
					.addPreferredGap(ComponentPlacement.RELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(separator, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addComponent(panel, GroupLayout.DEFAULT_SIZE, 185, Short.MAX_VALUE))
					.addGap(54))
		);
		
		JScrollPane scrollPane_Arbre = new JScrollPane();
		panel.addTab("Arbre", null, scrollPane_Arbre, null);
		
		JTree tree = new JTree();
		scrollPane_Arbre.setViewportView(tree);
		
		JScrollPane scrollPane_Liste = new JScrollPane();
		panel.addTab("Liste", null, scrollPane_Liste, null);
		
		JList list = new JList();
		scrollPane_Liste.setViewportView(list);
		
		JButton btnAjouter = new JButton("Ajouter");
		toolBar.add(btnAjouter);
		
		JButton btnSupprimer = new JButton("Supprimer");
		toolBar.add(btnSupprimer);
		
		JButton btnChercher = new JButton("Chercher");
		toolBar.add(btnChercher);
		
		JButton btnPrefixe = new JButton("Prefixe");
		toolBar.add(btnPrefixe);
		
		JLabel lblQuoi = new JLabel("             Quoi ?    ");
		toolBar.add(lblQuoi);
		
		textField = new JTextField();
		toolBar.add(textField);
		textField.setColumns(10);
		frame.getContentPane().setLayout(groupLayout);
		
		JMenuBar menuBar = new JMenuBar();
		frame.setJMenuBar(menuBar);
		
		JMenu mnFichier = new JMenu("Fichier");
		menuBar.add(mnFichier);
		
		JMenuItem mntmSauvegarder = new JMenuItem("Sauvegarder");
		mnFichier.add(mntmSauvegarder);
		
		JMenuItem mntmCharger = new JMenuItem("Charger");
		mnFichier.add(mntmCharger);
		
		JMenuItem mntmQuitter = new JMenuItem("Quitter");
		mnFichier.add(mntmQuitter);
		
		JMenu mnAide = new JMenu("Aide");
		menuBar.add(mnAide);
		
		JMenuItem menuItem = new JMenuItem("?");
		mnAide.add(menuItem);
	}

}
