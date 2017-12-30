package aspects.serialisation;

import java.util.Enumeration;

import javax.swing.JTree;
import javax.swing.event.TreeModelListener;
import javax.swing.tree.*;


public aspect VisualisationLexicographicTree {
	
////////////////3.1 DECLARATIONS INTER-TYPE//////////////////////////////////
	
	// Déclaration inter-type de deux interfaces (TreeModel,TreeNode) dans les classes AbstractNode et LexicographicTree
	declare parents : LexicographicTree implements TreeModel;
	declare parents : AbstractNode implements TreeNode;
	
	// Introductions de 3 attributs private dans 2 classes
	public JTree LexicographicTree.vue; // attribut vue de type Jtree dans LexicographicTree
	private DefaultTreeModel LexicographicTree.dTreeModel; // attribut treeModel de type TreeModel dans LT
	private DefaultMutableTreeNode AbstractNode.dMutableTreeNode; // attribut mutableTreeNode dans AbstractNode
	
//	TODO Définir les introductions de méthodes nécessaires pour que les interfaces TreeModel et
//	TreeNode soient correctement implémentées.
	
	// METHODS ABSTRACT TREEMODEL A COMPLETER
	public void LexicographicTree.addTreeModelListener(TreeModelListener l){
		this.dTreeModel.addTreeModelListener(l);
	}
	
	public Object LexicographicTree.getChild(Object parent, int index){
		return this.dTreeModel.getChild(parent,index);
	}

	public int LexicographicTree.getChildCount(Object parent){
		return this.dTreeModel.getChildCount(parent);
	}
	
	public int LexicographicTree.getIndexOfChild(Object parent, Object child){
		return this.dTreeModel.getIndexOfChild(parent, child);
	}
	
	public Object LexicographicTree.getRoot(){
		return this.dTreeModel.getRoot();
	}
	
	public boolean LexicographicTree.isLeaf(Object node){
		return this.dTreeModel.isLeaf(node);
	}
	
	public void LexicographicTree.removeTreeModelListener(TreeModelListener l){
		this.dTreeModel.removeTreeModelListener(l);
	}
	public void LexicographicTree.valueForPathChanged(TreePath path, Object newValue){
		this.dTreeModel.valueForPathChanged(path, newValue);
	}
	
	// METHODS ABSTRACT TREENODE A COMPLETER SI BESOIN 
	
	@SuppressWarnings("rawtypes")
	public Enumeration AbstractNode.children(){
		 return this.dMutableTreeNode.children();
	}
	
	public boolean AbstractNode.getAllowsChildren(){
		return this.dMutableTreeNode.getAllowsChildren();
	}
	
	public TreeNode AbstractNode.getChildAt(int childIndex){
		return this.dMutableTreeNode.getChildAt(childIndex);
	}
	
	public int AbstractNode.getChildCount(){
		return this.dMutableTreeNode.getChildCount();
	}
	
	public int AbstractNode.getIndex(TreeNode node){
		return this.dMutableTreeNode.getIndex(node);
	}
	
	public TreeNode AbstractNode.getParent(){
		return this.dMutableTreeNode.getParent();
	}
	
	public boolean AbstractNode.isLeaf(){
		return this.dMutableTreeNode.isLeaf();
	}
	
//	TODO Définir l'introduction d'une méthode public void setVue(JTree jt) dans
//	ArbreLexicographique permettant de modifier la valeur de l'attribut vue. Cette méthode peut
//	être appelée depuis la classe d'application graphique.
	
	public void LexicographicTree.setVue(JTree jt){
		this.vue = jt;
	}
	
//////////////3.2 SYNCHRONISATION DYNAMIQUE//////////////////////////////////	
	
// TODO	Définir des pointcuts et advices de telle sorte que chaque modification de structure dans un
//	ArbreLexicographique soit prise en compte dans le DefaultTreeModel associé.
	
	// Pointcut et advice pour liaison d'un arbre lexico avec un defaultTreeModel
	pointcut LexicographicTreeConstructorExecut() :  execution (LexicographicTree.new()); // à chaque appelle du constructeur de LexicographicTree
	after (LexicographicTree tree) : LexicographicTreeConstructorExecut() && target(tree)  {
		System.out.println("Point cut ArbreCréé : un arbre a été créé !");
		tree.dTreeModel= new DefaultTreeModel(new DefaultMutableTreeNode("racine"));
		System.out.println("DefaultTreeModel initialisé !");
		JTree newVue = new JTree(tree.dTreeModel);
		tree.setVue(newVue);
		System.out.println("Nouvelle vue définie !");
	}
// TODO	Définir un pointcut et un advice permettant de rafraîchir le JTree associé à un
//	ArbreLexicographique après tout changement de structure.
	
	// 2 pointcut de base sur frere et fils sur les methodes set, deux context?
		// enlever ? ajouter?
		// pour interface graphique sympa, deployer le jtree l'étendre, à trouver
		// sur le net. Utiliser des ascenseurs

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
	// TODO Auto-generated method stub
	
	}

}
