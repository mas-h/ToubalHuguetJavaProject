package aspects.serialisation;

import java.io.*;
import aspects.serialisation.LexicographicTree;

public aspect SerialisationLexicographicTree {

	declare parents : LexicographicTree implements Serializable; // On implemente l'interface Serializable à la classe LexicographicTree

	public void LexicographicTree.sauve(String nomFichier) throws IOException { // on ajoute une methode sauve à la classe
		try {
			FileWriter fichierSave = new FileWriter(nomFichier); // on créé un fichier où l'on va écrire
			BufferedWriter ecrirefichier = new BufferedWriter(fichierSave); // on créé le flux de données approprié, ici un BufferedWriter
			ecrirefichier.write(this.toString()); // écriture de l'arbre donné en argument 
			ecrirefichier.flush();
			ecrirefichier.close(); // on ferme le flux

		} catch (IOException ioe) {
			System.out.println("erreur : " + ioe);
		}
	}

	public void LexicographicTree.charge(String nomFichier) throws IOException { // on ajoute une méthode charge
		try {
			FileReader ficherRead = new FileReader(nomFichier); // on créé le fichier dont on veut lire le contenu
			BufferedReader lireFichier = new BufferedReader(ficherRead); // on créé le flux de données approprié, ici un BufferedReader
			
			while (lireFichier.lines() != null) { //On ajoute toutes les lignes (chaque ligne est un mot à ajouter dans l'arbre)
				this.add(lireFichier.readLine());
			}
			lireFichier.close(); // on ferme le flux
		} catch (Exception ioe) {
			System.out.println("erreur : " + ioe);
		}
	}


	public static void main(String[] args) {
		LexicographicTree arbre = new LexicographicTree();
		arbre.add("blabla");
		arbre.add("test");
		arbre.add("root");
		LexicographicTree arbreCharge = new LexicographicTree();
		
		System.out.println("arbre :"+arbre.toString());
		System.out.println("arbreCharge : "+arbreCharge.toString());
		try {
			//arbre.sauve("test.txt");
			arbreCharge.charge("test.txt");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("arbreCharge : "+arbreCharge.toString());

	}
}