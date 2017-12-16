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
		
	}
	
	public Object LexicographicTree.getChild(Object parent, int index){
		return parent;
	}

	public int LexicographicTree.getChildCount(Object parent){
		return 0;
	}
	
	public int LexicographicTree.getIndexOfChild(Object parent, Object child){
		return 0;
	}
	
	public Object LexicographicTree.getRoot(){
		return 0;
	}
	
	public boolean LexicographicTree.isLeaf(Object node){
		return true;
	}
	
	public void LexicographicTree.removeTreeModelListener(TreeModelListener l){
		
	}
	public void LexicographicTree.valueForPathChanged(TreePath path, Object newValue){
		
	}
	
	// METHODS ABSTRACT TREENODE A COMPLETER SI BESOIN 
	
	public Enumeration<AbstractNode> AbstractNode.children(){
		Enumeration<AbstractNode> enumerationNode = new Enumeration<AbstractNode>() {
			
			@Override
			public AbstractNode nextElement() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean hasMoreElements() {
				// TODO Auto-generated method stub
				return false;
			}
		};
		return enumerationNode;
	}
	
	public boolean AbstractNode.getAllowsChildren(){
		return true;
	}
	
	public TreeNode AbstractNode.getChildAt(int childIndex){
		return this.mutableTreeNode;
	}
	
	public int AbstractNode.getChildCount(){
		return 0;
	}
	
	public int AbstractNode.getIndex(TreeNode node){
		return 0;
	}
	
	public TreeNode AbstractNode.getParent(){
		return this.mutableTreeNode;
	}
	
	public boolean AbstractNode.isLeaf(){
		return true;
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

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
	// TODO Auto-generated method stub
	
	}

}
