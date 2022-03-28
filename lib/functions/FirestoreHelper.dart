
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:projetclass/model/Utilisateur.dart';

class FirestoreHelper{
  //attributs
  final auth = FirebaseAuth.instance;
  final fire_user = FirebaseFirestore.instance.collection("Utilisateurs");
  final fireStorage = FirebaseStorage.instance;


  //Constructeur



  //--------------------Méthode---------------------------------

//Méthode pour l'inscription

  Future Inscription(String nom, String prenom, String mail, String password) async {
    UserCredential resultat = await auth.createUserWithEmailAndPassword(email: mail, password: password);
    User? user = resultat.user;
    String uid = user!.uid;
    Map<String,dynamic> value ={
      "NOM":nom,
      "PRENOM":prenom,
      "MAIL":mail,
    };
    addUser(uid, value);
}


//méthode pour se connecter
  Future <String>Connexion(String mail, String password) async{
    UserCredential resultat = await auth.signInWithEmailAndPassword(email: mail, password: password);
    return resultat.user!.uid;

  }



//Méthode pour la connexion


//Méthode pour ajouter un utilisateur
addUser(String uid,Map<String,dynamic>map){
    fire_user.doc(uid).set(map);

}

//Méthode pour update un utilisateur
updateUser(String uid,Map<String,dynamic> map){
    fire_user.doc(uid).update(map);
}

Future <String> getIdentifiant() async {
    String uid = auth.currentUser!.uid;
    return uid;
}

Future <Utilisateur> getUtilisateur(String uid) async{
    DocumentSnapshot snapshot = await fire_user.doc(uid).get();
    return Utilisateur(snapshot);
}

Future <String> stockageImage(String name,Uint8List data) async {
    String? urlChemin;
    TaskSnapshot snapshotTask = await fireStorage.ref("image/$name").putData(data);
    urlChemin = await snapshotTask.ref.getDownloadURL();
    return urlChemin!;

}







}