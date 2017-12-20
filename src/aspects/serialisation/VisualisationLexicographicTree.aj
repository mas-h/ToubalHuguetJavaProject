package aspects.serialisation;

import aspects.serialisation.LexicographicTree;
import javax.swing.tree.TreeModel;
import javax.swing.tree.TreeNode;
import javax.swing.tree.TreePath;
import java.util.Enumeration;
import javax.swing.JTree;
import javax.swing.event.TreeModelListener;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;

import aspects.serialisation.AbstractNode;

public aspect VisualisationLexicographicTree {
	
////////////////3.1 DECLARATIONS INTER-TYPE//////////////////////////////////
	
	// Déclaration inter-type de deux interfaces (TreeModel,TreeNode) dans les classes AbstractNode et LexicographicTree
	declare parents : LexicographicTree implements TreeModel;
	declare parents : AbstractNode implements TreeNode;
	
	// Introductions de 3 attributs private dans 2 classes
	private JTree LexicographicTree.vue; // attribut vue de type Jtree dans LexicographicTree
	private DefaultTreeModel LexicographicTree.treeModel; // attribut treeModel de type TreeModel dans LT
	private DefaultMutableTreeNode AbstractNode.mutableTreeNode; // attribut mutableTreeNode dans AbstractNode
	
//	TODO Définir les introductions de méthodes nécessaires pour que les interfaces TreeModel et
//	TreeNode soient correctement implémentées.
	
	// METHODS ABSTRACT TREEMODEL A COMPLETER
	public void LexicographicTree.addTreeModelListener(TreeModelListener l){
		this.treeModel.addTreeModelListener(l);
	}
	
	public Object LexicographicTree.getChild(Object parent, int index){
		return this.treeModel.getChild(parent,index);
	}

	public int LexicographicTree.getChildCount(Object parent){
		return this.treeModel.getChildCount(parent);
	}
	
	public int LexicographicTree.getIndexOfChild(Object parent, Object child){
		return this.treeModel.getIndexOfChild(parent, child);
	}
	
	public Object LexicographicTree.getRoot(){
		return this.treeModel.getRoot();
	}
	
	public boolean LexicographicTree.isLeaf(Object node){
		return this.treeModel.isLeaf(node);
	}
	
	public void LexicographicTree.removeTreeModelListener(TreeModelListener l){
		this.treeModel.removeTreeModelListener(l);
	}
	public void LexicographicTree.valueForPathChanged(TreePath path, Object newValue){
		this.treeModel.valueForPathChanged(path, newValue);
	}
	
	// METHODS ABSTRACT TREENODE A COMPLETER SI BESOIN 
	
	@SuppressWarnings("rawtypes")
	public Enumeration AbstractNode.children(){
		 return this.mutableTreeNode.children();
	}
	
	public boolean AbstractNode.getAllowsChildren(){
		return this.mutableTreeNode.getAllowsChildren();
	}
	
	public TreeNode AbstractNode.getChildAt(int childIndex){
		return this.mutableTreeNode.getChildAt(childIndex);
	}
	
	public int AbstractNode.getChildCount(){
		return this.mutableTreeNode.getChildCount();
	}
	
	public int AbstractNode.getIndex(TreeNode node){
		return this.mutableTreeNode.getIndex(node);
	}
	
	public TreeNode AbstractNode.getParent(){
		return this.mutableTreeNode.getParent();
	}
	
	public boolean AbstractNode.isLeaf(){
		return this.mutableTreeNode.isLeaf();
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
