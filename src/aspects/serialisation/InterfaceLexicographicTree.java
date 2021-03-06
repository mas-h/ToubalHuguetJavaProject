package aspects.serialisation;

import java.awt.Color;
import java.awt.EventQueue;

import javax.swing.GroupLayout;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
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

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.JTextPane;
import java.awt.Toolkit;
import java.awt.Font;

public class InterfaceLexicographicTree {

	private JFrame frmGumGumNo;
	private JTextField textField;
	private JTextField etatAction;
	private JTextField nbElements;
	private static LexicographicTree treeLexico;
	private static JFileChooser chooser;
	

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		
		
		 chooser = new JFileChooser();
		
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					InterfaceLexicographicTree window = new InterfaceLexicographicTree();
					window.frmGumGumNo.setVisible(true);
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
		treeLexico = new LexicographicTree();
		initialize();
		
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmGumGumNo = new JFrame();
		frmGumGumNo.setForeground(new Color(153, 102, 204));
		frmGumGumNo.setFont(new Font("Ubuntu", Font.BOLD, 16));
		frmGumGumNo.setTitle("Gum gum no LexicoGraphicTree");
		frmGumGumNo.setIconImage(Toolkit.getDefaultToolkit().getImage("/home/mash/Workspaces/workspaceJAVA/ToubalHuguetJavaProject/icone.png"));
		frmGumGumNo.setBounds(100, 100, 859, 576);
		frmGumGumNo.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JToolBar toolBar = new JToolBar();
		toolBar.setFloatable(false);
		
		JSeparator separator = new JSeparator();
		
		JTabbedPane panel = new JTabbedPane();
		
		etatAction = new JTextField();
		etatAction.setBackground(Color.DARK_GRAY);
		etatAction.setForeground(Color.BLACK);
		etatAction.setEditable(false);
		etatAction.setColumns(10);
		
		nbElements = new JTextField();
		nbElements.setForeground(new Color(0, 153, 255));
		nbElements.setBackground(Color.DARK_GRAY);
		nbElements.setEditable(false);
		nbElements.setColumns(10);
		GroupLayout groupLayout = new GroupLayout(frmGumGumNo.getContentPane());
		groupLayout.setHorizontalGroup(
			groupLayout.createParallelGroup(Alignment.LEADING)
				.addGroup(groupLayout.createSequentialGroup()
					.addGroup(groupLayout.createParallelGroup(Alignment.LEADING)
						.addComponent(toolBar, GroupLayout.DEFAULT_SIZE, 483, Short.MAX_VALUE)
						.addGroup(groupLayout.createSequentialGroup()
							.addContainerGap()
							.addGroup(groupLayout.createParallelGroup(Alignment.TRAILING)
								.addGroup(groupLayout.createSequentialGroup()
									.addComponent(etatAction, GroupLayout.DEFAULT_SIZE, 275, Short.MAX_VALUE)
									.addPreferredGap(ComponentPlacement.UNRELATED)
									.addComponent(nbElements, GroupLayout.PREFERRED_SIZE, 345, GroupLayout.PREFERRED_SIZE))
								.addComponent(panel, Alignment.LEADING, GroupLayout.DEFAULT_SIZE, 462, Short.MAX_VALUE))
							.addPreferredGap(ComponentPlacement.RELATED)
							.addComponent(separator, GroupLayout.PREFERRED_SIZE, 3, Short.MAX_VALUE)))
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
					.addPreferredGap(ComponentPlacement.UNRELATED)
					.addGroup(groupLayout.createParallelGroup(Alignment.BASELINE)
						.addComponent(etatAction, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
						.addComponent(nbElements, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
					.addGap(23))
		);
		
		JScrollPane scrollPane_Arbre = new JScrollPane();
		panel.addTab("Arbre", null, scrollPane_Arbre, null);
		
		JTree jTree = new JTree();
		jTree.setForeground(new Color(0, 153, 51));
		jTree.setFont(new Font("Ubuntu", Font.PLAIN, 14));
		treeLexico.setVue(jTree);
		jTree.setModel(treeLexico);
		scrollPane_Arbre.setViewportView(jTree);
		
		JScrollPane scrollPane_Liste = new JScrollPane();
		panel.addTab("Liste", null, scrollPane_Liste, null);
		
		JTextPane contenuArbre = new JTextPane();
		contenuArbre.setForeground(new Color(102, 102, 153));
		contenuArbre.setFont(new Font("Ubuntu", Font.BOLD, 16));
		scrollPane_Liste.setViewportView(contenuArbre);
		
		
		JButton btnAjouter = new JButton("Ajouter");
		btnAjouter.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String contenu = textField.getText().toLowerCase(); // on récupère le contenu du button
				// on essaye d'ajouter ce contenu dans l'arbre
				if (treeLexico.add(contenu)){
					etatAction.setForeground(Color.GREEN);
					etatAction.setText("Le mot : "+ contenu+" a bien été ajouté");
					
				}
				else {
					etatAction.setForeground(Color.RED);
					etatAction.setText("Le mot : "+ contenu+" n'a pas été ajouté, déjà présent ou erreur de saisie");
				}
				contenuArbre.setText(treeLexico.toString());
				nbElements.setText(treeLexico.elementsCount()+" mots");
			}
		});
		toolBar.add(btnAjouter);
		
		JButton btnSupprimer = new JButton("Supprimer");
		btnSupprimer.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String contenu = textField.getText().toLowerCase(); // on récupère le contenu du button
				// on essaye d'enlever ce contenu dans l'arbre
				if (treeLexico.remove(contenu)){
					etatAction.setForeground(Color.GREEN);
					etatAction.setText("Le mot : "+ contenu+" a bien été supprimé");
				}
				else {
					etatAction.setForeground(Color.RED);
					etatAction.setText("Le mot : "+ contenu+" n'a pas été supprimé, non présent ou erreur de saisie");
				}
				contenuArbre.setText(treeLexico.toString());
				nbElements.setText(treeLexico.elementsCount()+" mots");
			}
		});
		toolBar.add(btnSupprimer);
		
		JButton btnChercher = new JButton("Chercher");
		btnChercher.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String contenu = textField.getText().toLowerCase(); // on récupère le contenu du button
				// on regarde si le contenu est dans l'arbre
				if (treeLexico.contains(contenu)){
					etatAction.setForeground(Color.GREEN);
					etatAction.setText("Le mot : "+ contenu +" est bien dans l'arbre");
					
				}
				else {
					etatAction.setForeground(Color.RED);
					etatAction.setText("Le mot : "+ contenu +" n'est pas présent dans l'arbre");
				}
				contenuArbre.setText(treeLexico.toString());
				nbElements.setText(treeLexico.elementsCount()+" mots");
			}
		});
		toolBar.add(btnChercher);
		
		JButton btnPrefixe = new JButton("Prefixe");
		btnPrefixe.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String contenu = textField.getText().toLowerCase(); // on récupère le contenu du button
				// on regarde si ce contenu est un prefix dans l'arbre
				if (treeLexico.prefix(contenu)){
					etatAction.setForeground(Color.GREEN);
					etatAction.setText("Il y a des mots qui commencent par : "+ contenu);
				}
				else {
					etatAction.setForeground(Color.RED);
					etatAction.setText("Il n'y a pas de mots commençant par : "+ contenu);
				}
				contenuArbre.setText(treeLexico.toString());
				nbElements.setText(treeLexico.elementsCount()+" mots");
			}
		});
		toolBar.add(btnPrefixe);
		
		JLabel lblQuoi = new JLabel("             What ?    ");
		toolBar.add(lblQuoi);
		
		textField = new JTextField();
		toolBar.add(textField);
		textField.setColumns(10);
		frmGumGumNo.getContentPane().setLayout(groupLayout);
		
		JMenuBar menuBar = new JMenuBar();
		frmGumGumNo.setJMenuBar(menuBar);
		
		JMenu mnFichier = new JMenu("Fichier");
		menuBar.add(mnFichier);
		
		JMenuItem mntmSauvegarder = new JMenuItem("Sauvegarder");
		mntmSauvegarder.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				int retour =chooser.showSaveDialog(frmGumGumNo);
				if (retour == JFileChooser.APPROVE_OPTION){// un fichier a été choisi (sortie par OK)
					   // nom du fichier  choisi 
					 String nameFile =  chooser.getSelectedFile().getName();
					   // chemin absolu du fichier choisi
					 String pathFile = chooser.getSelectedFile().getAbsolutePath();
					 try { // on sauve l'arbre dans le fichier
						treeLexico.sauve(pathFile);
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					etatAction.setSelectedTextColor(Color.GREEN);
					etatAction.setText("Arbre sauvegardé correctement dans le fichier : "+nameFile);
				}
				else {
					etatAction.setSelectedTextColor(Color.RED);
					etatAction.setText("Une erreur est survenue");
					}
			}
		});
		mnFichier.add(mntmSauvegarder);
		
		JMenuItem mntmCharger = new JMenuItem("Charger (Ecraser)"); // Création d'un nouvel arbre à partir des éléments contenu dans le fichier choisi 
		mntmCharger.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				int retour =chooser.showOpenDialog(frmGumGumNo);
				if (retour == JFileChooser.APPROVE_OPTION){// un fichier a été choisi (sortie par OK)
					   // nom du fichier  choisi 
					 String nameFile =  chooser.getSelectedFile().getName();
					   // chemin absolu du fichier choisi
					 String pathFile =chooser.getSelectedFile().getAbsolutePath();
					 treeLexico = new LexicographicTree();
					 treeLexico.setVue(jTree);
					 jTree.setModel(treeLexico);
					 try { // on charge l'arbre depuis le fichier choisi 
						treeLexico.charge(pathFile);
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					etatAction.setForeground(Color.GREEN); 
					etatAction.setText("Arbre ouvert correctement depuis le fichier : "+nameFile);
				}
				else {
					etatAction.setForeground(Color.RED);
					etatAction.setText("Une erreur est survenue");}
				
				contenuArbre.setText(treeLexico.toString());
				nbElements.setText(treeLexico.elementsCount()+" mots");
			}
			
		});
		mnFichier.add(mntmCharger);
		
		JMenuItem mntmQuitter = new JMenuItem("Quitter");
		mntmQuitter.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				frmGumGumNo.dispose(); // ferme la fenêtre
			}
		});
		
		JMenuItem mntmChargermerge = new JMenuItem("Charger (Fusion)"); // Si l'arbre n'est pas vide, cette methode ajoute les éléments du fichier choisi à l'arbre courant
		mntmChargermerge.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				int retour =chooser.showOpenDialog(frmGumGumNo);
				if (retour == JFileChooser.APPROVE_OPTION){// un fichier a été choisi (sortie par OK)
					   // nom du fichier  choisi 
					 String nameFile =  chooser.getSelectedFile().getName();
					   // chemin absolu du fichier choisi
					 String pathFile =chooser.getSelectedFile().getAbsolutePath();
					 
					 try { // on charge l'arbre depuis le fichier choisi
						treeLexico.charge(pathFile);
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					etatAction.setForeground(Color.GREEN); 
					etatAction.setText("Arbre ouvert correctement depuis le fichier : "+nameFile);
				}
				else {
					etatAction.setForeground(Color.RED);
					etatAction.setText("Une erreur est survenue");
					}
				contenuArbre.setText(treeLexico.toString());
				nbElements.setText(treeLexico.elementsCount()+" mots");
			}
			
		});
		mnFichier.add(mntmChargermerge);
		mnFichier.add(mntmQuitter);
		
		JMenu mnAide = new JMenu("Aide");
		menuBar.add(mnAide);
		
		JMenuItem menuItem = new JMenuItem("?");
		mnAide.add(menuItem);
	}
}
