import 'package:flutter/material.dart';

class register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return registerState();
  }

}

class registerState extends State <register>{
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
            },
            child: Text("Inscription")
        )
      ],
    );
  }

}