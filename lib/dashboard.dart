import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetclass/functions/FirestoreHelper.dart';
import 'package:projetclass/model/Utilisateur.dart';

class dashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dashboardState();
  }

}

class dashboardState extends State<dashboard>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: bodyPage(),
    );
  }

  Widget bodyPage(){
    return StreamBuilder<QuerySnapshot>(
      stream: FirestoreHelper().fire_user.snapshots(),
        builder: (context,snapshot){
        if(!snapshot.hasData){
          return CircularProgressIndicator();
        }
        else
          {
            List documents = snapshot.data!.docs;
            return ListView.builder(
              itemCount: documents.length,
                itemBuilder: (context,index){
                Utilisateur user = Utilisateur(documents[index]);
                return ListTile(
                  title: Text("${user.nom}  ${user.prenom}"),
                );
                }
            );
          }
        }
    );
  }

}