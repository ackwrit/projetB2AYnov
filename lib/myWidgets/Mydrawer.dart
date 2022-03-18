import 'package:flutter/material.dart';
import 'package:projetclass/functions/FirestoreHelper.dart';
import 'package:projetclass/model/Utilisateur.dart';

class myDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myDrawerState();
  }

}

class myDrawerState extends State<myDrawer>{
  late Utilisateur myProfil;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    FirestoreHelper().getIdentifiant().then((String identifiant){
      setState(() {
        String monId = identifiant;
        FirestoreHelper().getUtilisateur(monId).then((Utilisateur monUser){
          myProfil = monUser;
        });
      });
    });

    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width/2,
      child: Column(
        children: [
          SizedBox(height: 100,),
          //Afficher l'avatar
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://voitures.com/wp-content/uploads/2017/06/Kodiaq_079.jpg.jpg")
              )
            ),

          ),


          SizedBox(height: 20,),

          //Afficher mon nom et prénom
          Text("${myProfil.prenom} ${myProfil.nom}")
        ],
      ),
    );
  }

}