package aspects.serialisation;

import java.util.Enumeration;

import javax.swing.JTree;
import javax.swing.event.TreeModelListener;
import javax.swing.tree.*;

public privileged aspect VisualisationLexicographicTree { // declaré privileged pour avoir
												// accès aux attributs des
												// classes concernées

	//////////////// 3.1 DECLARATIONS
	//////////////// INTER-TYPE//////////////////////////////////

	// Déclaration inter-type de deux interfaces (TreeModel,TreeNode) dans les
	// classes AbstractNode et LexicographicTree
	declare parents : LexicographicTree implements TreeModel;
	declare parents : AbstractNode implements TreeNode;

	// Introductions de 3 attributs private dans 2 classes
	private JTree LexicographicTree.vue; // attribut vue de type Jtree dans
											// LexicographicTree
	private DefaultTreeModel LexicographicTree.dTreeModel; // attribut treeModel
															// de type TreeModel
															// dans LexicographicTree
	private DefaultMutableTreeNode AbstractNode.dMutableTreeNode; // attribut
																	// mutableTreeNode
																	// dans
																	// AbstractNode

	// TODO Définir les introductions de méthodes nécessaires pour que les
	// interfaces TreeModel et
	// TreeNode soient correctement implémentées.

	// METHODS ABSTRACT TREEMODEL A COMPLETER
	public void LexicographicTree.addTreeModelListener(TreeModelListener l) {
		this.dTreeModel.addTreeModelListener(l);
	}

	public Object LexicographicTree.getChild(Object parent, int index) {
		return this.dTreeModel.getChild(parent, index);
	}

	public int LexicographicTree.getChildCount(Object parent) {
		return this.dTreeModel.getChildCount(parent);
	}

	public int LexicographicTree.getIndexOfChild(Object parent, Object child) {
		return this.dTreeModel.getIndexOfChild(parent, child);
	}

	public Object LexicographicTree.getRoot() {
		return this.dTreeModel.getRoot();
	}

	public boolean LexicographicTree.isLeaf(Object node) {
		return this.dTreeModel.isLeaf(node);
	}

	public void LexicographicTree.removeTreeModelListener(TreeModelListener l) {
		this.dTreeModel.removeTreeModelListener(l);
	}

	public void LexicographicTree.valueForPathChanged(TreePath path, Object newValue) {
		this.dTreeModel.valueForPathChanged(path, newValue);
	}

	// METHODS ABSTRACT TREENODE A COMPLETER SI BESOIN

	@SuppressWarnings("rawtypes")
	public Enumeration AbstractNode.children() {
		return this.dMutableTreeNode.children();
	}

	public boolean AbstractNode.getAllowsChildren() {
		return this.dMutableTreeNode.getAllowsChildren();
	}

	public TreeNode AbstractNode.getChildAt(int childIndex) {
		return this.dMutableTreeNode.getChildAt(childIndex);
	}

	public int AbstractNode.getChildCount() {
		return this.dMutableTreeNode.getChildCount();
	}

	public int AbstractNode.getIndex(TreeNode node) {
		return this.dMutableTreeNode.getIndex(node);
	}

	public TreeNode AbstractNode.getParent() {
		return this.dMutableTreeNode.getParent();
	}

	public boolean AbstractNode.isLeaf() {
		return this.dMutableTreeNode.isLeaf();
	}

	// TODO Définir l'introduction d'une méthode public void setVue(JTree jt)
	// dans ArbreLexicographique permettant de modifier la valeur de l'attribut vue.
	// Cette méthode peut être appelée depuis la classe d'application graphique.
	

	public void LexicographicTree.setVue(JTree jt) {
		this.vue = jt;
	}

	////////////// 3.2 SYNCHRONISATION
	////////////// DYNAMIQUE//////////////////////////////////

	// TODO Définir des pointcuts et advices de telle sorte que chaque
	// modification de structure dans un
	// ArbreLexicographique soit prise en compte dans le DefaultTreeModel
	// associé.

	// Pointcut et advice pour liaison d'un arbre lexico avec un defaultTreeModel
	// et capter chaque execution du constructeur de la LexicographicTree et que la cible est un arbre
	pointcut LexicographicTreeConstructorExecut(LexicographicTree tree) :  execution (LexicographicTree.new()) && target(tree);																			
	after(LexicographicTree tree) : LexicographicTreeConstructorExecut(tree)   { 
		System.out.println("Pointcut ArbreConstructorExe : un arbre a été créé !");
		tree.dTreeModel = new DefaultTreeModel(new DefaultMutableTreeNode("root")); // on créé le defaultTreeModel associé en donnant le nom de la racine																	
		System.out.println("DefaultTreeModel initialisé !");

	}


	// Pointcut changement de la racine
	pointcut changeRacine(LexicographicTree tree) : this(tree) && set(AbstractNode LexicographicTree.root); // sur cet arbre et lorsque l'on modifie l'attribut root

	// Pointcut et advice pour le Remplacement de la racine lors d'un ajout
	pointcut changeRacineAjout(LexicographicTree tree) : changeRacine(tree) && withincode(boolean LexicographicTree.add(String)); // quand on change la racine et qu'on utilise dans le code la methode add

	after(LexicographicTree tree) : changeRacineAjout(tree){
		((DefaultMutableTreeNode) tree.dTreeModel.getRoot()).insert(tree.root.dMutableTreeNode, 0); // On remplace par la nouvelle racine
		System.out.println("Racine changée lors d'un ajout !");
	}

	// Pointcut et advice pour le Remplacement de la racine lors d'une suppression
	pointcut changeRacineSuppr(LexicographicTree tree) : changeRacine(tree) && withincode(boolean LexicographicTree.remove(String)); // quand on change la racine et qu'on utilise dans le code la methode remove

	before(LexicographicTree tree) : changeRacineSuppr(tree){
		tree.root.dMutableTreeNode.removeFromParent(); // on supprime l'ancienne racine ainsi que ses enfants
	}

	after(LexicographicTree tree) : changeRacineSuppr(tree){
		if (!(tree.root instanceof EmptyNode)){ // si le tree n'est pas vide
			((DefaultMutableTreeNode) tree.dTreeModel.getRoot()).insert(tree.root.dMutableTreeNode, 0); // On insert la nouvelle racine
			System.out.println("Racine changée lors d'une suppression");
		}
	}

	// Pointcut et advice lors de la creation d'une Mark
	pointcut markConstructorExecute(AbstractNode mark) : target(mark) && execution(Mark.new(AbstractNode));

	before(AbstractNode mark) : markConstructorExecute(mark){
		mark.dMutableTreeNode = new DefaultMutableTreeNode(); // on créé un node vide, une mark
		System.out.println("Une mark a été créée ! ");
	}

	// Pointcut et advice pour le création de node
	pointcut nodeConstructorExecute(Node node, AbstractNode brother, AbstractNode child, char value) : target(node) && args(brother, child, value) && execution(Node.new(AbstractNode, AbstractNode, char));

	after(Node node, AbstractNode brother, AbstractNode child, char value) : nodeConstructorExecute(node, brother,  child,  value){
		node.dMutableTreeNode = new DefaultMutableTreeNode(Character.toString(value)); // on affecte le character au node
		node.dMutableTreeNode.add(child.dMutableTreeNode); // on lui ajoute un enfant
		System.out.println("Le noeud : '" + value + "' a été créé ! ");
	}

	//Pointcut lors d'un changement d'un brother
	pointcut changeBrother(AbstractNode node) : target(node) && set(AbstractNode AbstractNode.brother);

	//Pointcut lors d'un changement d'un child
	pointcut changeChild(Node node, AbstractNode n1) : this(node) && target(n1) && set(AbstractNode Node.child);

	//Pointcut et advice lors d'un changement d'un brother lors d'un ajout
	pointcut changeBrotherAjout(AbstractNode node) : target(node) && changeBrother(AbstractNode) && withincode(AbstractNode AbstractNode+.add(String));

	after(AbstractNode node) : changeBrotherAjout(node){
		if (node.getParent() != null) {
			((MutableTreeNode) node.dMutableTreeNode.getParent()).insert(node.brother.dMutableTreeNode, 0);
		}
	}

	//Pointcut et advice lors d'un changement d'un child lors d'un ajout
	pointcut changeChildAjout(Node node) : target(node) &&  changeChild(Node, AbstractNode) && withincode(AbstractNode AbstractNode+.add(String));

	after(Node node) : changeChildAjout(node){
		node.dMutableTreeNode.insert(node.child.dMutableTreeNode,0);
	}

	// Pointcut et advice lors d'un changement d'un child lors d'une suppression
	pointcut changeChildSuppr(Node node) : target(node) &&  changeChild(Node, AbstractNode) && withincode(AbstractNode AbstractNode+.remove(String));

	before(Node node) : changeChildSuppr(node){
		
		if (node.child.dMutableTreeNode.getParent() != null) {
			node.dMutableTreeNode.remove(node.child.dMutableTreeNode);
		}
	}

	after(Node node) : changeChildSuppr(node){
		if(!(node.child instanceof EmptyNode)) {
			node.dMutableTreeNode.insert(node.child.dMutableTreeNode,0);
		}
	}

	//Pointcut et advice lors changement d'un brother lors d'une suppression
	pointcut changeBrotherSuppr(AbstractNode node) : target(node) && changeBrother(AbstractNode) && withincode(AbstractNode AbstractNode.remove(String));

	before(AbstractNode node) : changeBrotherSuppr(node){
		if(!(node.brother instanceof EmptyNode)){
			node.brother.dMutableTreeNode.removeFromParent();
		}
	}

	after(AbstractNode node) :  changeBrotherSuppr(node){
		 if (!(node.brother instanceof EmptyNode)){
			((DefaultMutableTreeNode) node.getParent()).insert(node.brother.dMutableTreeNode, 0);
		}
	}

	// TODO Définir un pointcut et un advice permettant de rafraîchir le JTree
	// associé à un ArbreLexicographique après tout changement de structure.
	

	// Pointcut pour mettre à jours la vue à chaque ajout ou suppression
	 pointcut ModificationTree(LexicographicTree tree) : target(tree)&& (withincode(boolean LexicographicTree.add(String)) ||
	 withincode(boolean LexicographicTree.remove(String)));
	 after(LexicographicTree tree) : ModificationTree(tree) {
		 ((DefaultTreeModel) tree.dTreeModel).reload();
		 
		 // Pour étendre l'arbre à chaque modification pour une meilleur visibilité
		 @SuppressWarnings("rawtypes")
		Enumeration e = ((DefaultMutableTreeNode)tree.dTreeModel.getRoot()).preorderEnumeration();
	        while (e.hasMoreElements()) {
	            //Expand the current node.
	            tree.vue.expandPath(new TreePath(((DefaultMutableTreeNode)e.nextElement()).getPath()));
	        }
		 System.out.println("Nouvelle vue définie !");
	 }

	
	
	
	
	

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
