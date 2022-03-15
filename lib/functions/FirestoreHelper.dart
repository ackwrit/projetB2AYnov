
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelper{
  //attributs
  final auth = FirebaseAuth.instance;
  final fire_user = FirebaseFirestore.instance.collection("Utilisateurs");


  //Constructeur



  //--------------------Méthode---------------------------------

//Méthode pour l'inscription

  Future Inscription(String nom, String prenom, String mail, String password) async {
    UserCredential user = await auth.createUserWithEmailAndPassword(email: mail, password: password);
}



//Méthode pour la connexion


//Méthode pour ajouter un utilisateur







}