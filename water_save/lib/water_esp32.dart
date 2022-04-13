import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:water_save/firebase_info.dart';
import 'package:water_save/main.dart';

import 'google_sign_in.dart';

/*void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      title: "Water-Animation",
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}*/

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      title: "Water-Animation",
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;


  @override
  void initState() {
    super.initState();

    firstController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    firstAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    secondAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    thirdAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
        CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    fourthAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
        CurvedAnimation(parent: fourthController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

   
    Timer(Duration(seconds: 2), () {
      firstController.forward();
    });

    Timer(Duration(milliseconds: 1600), () {
      secondController.forward();
    });

    Timer(Duration(milliseconds: 800), () {
      thirdController.forward();
    });

    fourthController.forward();

  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 43, 48),
      body: Stack(
        children: [
          CustomPaint(
            painter: MyPainter(
              thirdAnimation.value,
              secondAnimation.value,
              firstAnimation.value,
              fourthAnimation.value,
            ),
            child: SizedBox(
              height: size.height,
              width: size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 20),
            child: 
            Row(
              children: <Widget> [
              const Expanded(
                child: Text('Nivel de Agua: ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w500
                ),
                ),
              ),
              ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: const Image(
                        height: 49.0,
                        width: 49.0,
                        image: AssetImage('assets/logo/desilogo.JPG'),
                        fit: BoxFit.cover),
                  ),
              
            ]
            ),
            ),
            // aca van las gotitas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Row(
                    children: [
                      Icon(Icons.water_drop,color: Colors.white,size: 50,),
                      Icon(Icons.water_drop,color: Colors.orange[300],size: 50),
                      Icon(Icons.water_drop,color: Colors.white,size: 50),
                      Expanded(child:SizedBox(height: 20,)),
                      Text('ESP32\nARDUINO',style: TextStyle(color: Colors.white,fontSize: 22),)
                    ],
                  ),
                ],
              ),
            ),
            FirebaseInfo(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 19, 63, 113),
                      ),
                      icon: const FaIcon(FontAwesomeIcons.doorOpen),
                      label: const Text('Cerrar Sesion'),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                        provider.logout(context);
                        /*Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => MyHomme()));*/
                         
                      },
                    ),
              ], 
            )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;

  MyPainter(
    this.firstValue,
    this.secondValue,
    this.thirdValue,
    this.fourthValue,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color.fromARGB(255, 59, 144, 186).withOpacity(.8)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue)
      ..cubicTo(size.width * .4, size.height / secondValue, size.width * .7,
          size.height / thirdValue, size.width, size.height / fourthValue)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}