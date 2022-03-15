import 'package:flutter/material.dart';
import 'package:projetclass/functions/FirestoreHelper.dart';

class register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return registerState();
  }

}

class registerState extends State <register>{
  //Variable
  late String mail;
  late String password;
  late String nom;
  late String prenom;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Inscription"),
        centerTitle: true,

      ),
      body:Container(
        padding: EdgeInsets.all(20),
        child: bodyPage(),
      ) 
      
    );
  }



  Widget bodyPage(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextField(
          onChanged: (value){
            setState(() {
              mail = value;
            });

          },

          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Taper une adresse mail",
              hintStyle: TextStyle(color: Colors.red),

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          ),

        ),
        TextField(
          obscureText: true,
          onChanged: (value){
            setState(() {
              password = value;
            });
          },

          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Taper un mot de passe",
              hintStyle: TextStyle(color: Colors.red),

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          ),

        ),
        TextField(
          onChanged: (value){
            setState(() {
              nom = value;
            });
          },

          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Taper votre nom",
              hintStyle: TextStyle(color: Colors.red),

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          ),

        ),
        TextField(
          onChanged: (value){
            setState(() {
              prenom = value;
            });
          },

          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Taper votre prénom",
              hintStyle: TextStyle(color: Colors.red),

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              )
          ),

        ),

        ElevatedButton(
            onPressed: () {
              print("Je suis inscris");
              FirestoreHelper().Inscription(nom, prenom, mail, password);

            },
            child: Text("Inscription")
        )
      ],
    );
  }

}