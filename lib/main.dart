

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projetclass/dashboard.dart';
import 'package:projetclass/functions/FirestoreHelper.dart';
import 'package:projetclass/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My First Application'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double maPosition = 0.0;
  late String mail;
  late String password;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(

            child: Container(
              padding: EdgeInsets.all(20),
              child: bodyPage(),
            )

        ),



    );
  }


  popUp(){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context){
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              title: Text("Connexion ??chou??"),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Ok")
                )
              ],
            );
          }
          else
            {
              return AlertDialog(
                title: Text("Connexion ??chou??"),
                actions: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Ok")
                  )
                ],
              );
            }
        }
    );

  }


  Widget bodyPage(){

    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Afficher notre logo
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/Tomb-Raider-definitive-ed-012.jpg",

              ),
              fit: BoxFit.fill


            )
          ),
        ),
        SizedBox(height: 15,),

        //Taper une adresse mail
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
        SizedBox(height: 15,),


        //Taper un mot de passe
        TextField(
          onChanged: (value){
            setState(() {
              password = value;
            });
          },
          obscureText: true,
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
        SizedBox(height: 15,),

        //Taper un bouton connexion
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),

            onPressed: (){
              print("J'ai appuy??");
              FirestoreHelper().Connexion(mail, password).then((value){
                print("Connexion r??ussi");
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return dashboard();
                    }
                ));
              }).catchError((onError){
                print("Connexion ??chou??");
                popUp();
              });
            },
            child: Text("Connexion")
        ),
        SizedBox(height: 15,),

        //Cliquer un lien inscription
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context){
                  return register();
                }
            ));
          },
          child: Text("Inscription",style: TextStyle(color: Colors.blue),),
        ),

      ],
    );



  }
}
