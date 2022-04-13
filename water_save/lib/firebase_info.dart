import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseInfo extends StatefulWidget {
  FirebaseInfo({Key? key}) : super(key: key);

  @override
  State<FirebaseInfo> createState() => _FirebaseInfoState();
  
}

List<int> _valor = [];
List<int> get datos => _valor;

class _FirebaseInfoState extends State<FirebaseInfo> {
  
  final databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    getdata();
    super.initState();
    setState(() {
      
    });
  }

  getdata() async {
    // TODO: implement initState
     final snapshot = await databaseReference.child('Sensores').get();
     if (snapshot.exists){
       var datos = snapshot.value as Map;
       print('${datos['lecturas']}'); 
       _valor.add(datos['lecturas']);
     } else {
       print('a llorarrrrrrrrrrrrrrr weonaaaaaaaaaaa');
     }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${datos[0]} %',style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    wordSpacing: 3,
                    color: Colors.white),
                textScaleFactor: 7),
    );
  }
}