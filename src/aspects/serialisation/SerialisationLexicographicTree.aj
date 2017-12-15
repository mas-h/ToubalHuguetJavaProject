package aspects.serialisation;

import java.io.*;

import aspects.serialisation.LexicographicTree;

public aspect SerialisationLexicographicTree {

	declare parents : LexicographicTree implements Serializable;

	public void LexicographicTree.sauve(String nomFichier) throws IOException {
		try {
			FileWriter fichierSave = new FileWriter(nomFichier);
			BufferedWriter ecrirefichier = new BufferedWriter(fichierSave);
			ecrirefichier.write(this.toString());
			ecrirefichier.flush();
			ecrirefichier.close();

		} catch (IOException ioe) {
			System.out.println("erreur : " + ioe);
		}
	}

	public void LexicographicTree.charge(String nomFichier) throws IOException {
		try {
			FileReader ficherRead = new FileReader(nomFichier);
			BufferedReader lireFichier = new BufferedReader(ficherRead);
			
			while (lireFichier.lines() != null) {
				this.add(lireFichier.readLine());
			}
			lireFichier.close();
		} catch (Exception ioe) {
			System.out.println("erreur : " + ioe);
		}
	}

	// 2 pointcut de base sur frere et fils sur les methodes set, deux context?
	// enlever ? ajouter?
	// pour interface graphique sympa, deployer le jtree l'étendre, à trouver
	// sur le net. Utiliser des ascenseurs

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