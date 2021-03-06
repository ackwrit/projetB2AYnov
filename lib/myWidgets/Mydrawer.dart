import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
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
  Utilisateur myProfil = Utilisateur.vide();
  Uint8List? byteFile;
  String? nameFile;
  String? urlFile;



  //Function

  //Récupérer l'image sur notre téléphone
  getImage() async{
    FilePickerResult? resultat = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image
    );
    if(resultat != null){
      nameFile = resultat.files.first.name;
      byteFile = resultat.files.first.bytes;
      popImage();
    }

  }
  
  //Afficher l'image choisie
  popImage(){
    showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("Voulez-vous enrgistrer cette image"),
            content: Image.memory(byteFile!),
            actions: [
              ElevatedButton(
                  onPressed: (){
                    //Annuler
                    Navigator.pop(context);
                  },
                  child: Text("Annuler"),
              ),
              ElevatedButton(
                  onPressed: (){
                    //enregsiter notre image dans la base de donnée
                    FirestoreHelper().stockageImage(nameFile!, byteFile!).then((String urlImage){
                      setState(() {
                        urlFile = urlImage;
                        Map<String,dynamic> map = {
                          "AVATAR":urlFile,
                        };
                        FirestoreHelper().updateUser(myProfil.uid, map);
                      });
                    });

                    Navigator.pop(context);

                  },
                  child: Text("Enregisterment")
              )


            ],
          );
        }
    );
    
  }



  ///
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    FirestoreHelper().getIdentifiant().then((String identifiant){
      setState(() {
        String monId = identifiant;
        FirestoreHelper().getUtilisateur(monId).then((Utilisateur monUser){
          setState(() {
            myProfil = monUser;
          });

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

          InkWell(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: (myProfil.avatar == null)?NetworkImage("https://voitures.com/wp-content/uploads/2017/06/Kodiaq_079.jpg.jpg"):NetworkImage(myProfil.avatar!)
                  )
              ),

            ),
            onTap: (){
              //Récuperer image
              print("Je vais récupérer l'image");
              getImage();
            },

          ),



          SizedBox(height: 20,),

          //Afficher mon nom et prénom
          Text("${myProfil.prenom} ${myProfil.nom}")
        ],
      ),
    );
  }

}