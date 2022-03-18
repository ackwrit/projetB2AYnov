import 'package:flutter/material.dart';
import 'package:projetclass/model/Utilisateur.dart';

class detail extends StatefulWidget{
  Utilisateur user;
  detail({required Utilisateur this.user});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailState();
  }

}

class detailState extends State<detail>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("NOM et prénom de l'utilisateur"),
      ),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return Text("Détail du profil");
  }

}