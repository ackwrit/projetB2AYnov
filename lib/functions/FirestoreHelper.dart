
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
  Future Connexion(String mail, String password) async{
    UserCredential resultat = await auth.signInWithEmailAndPassword(email: mail, password: password);

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







}