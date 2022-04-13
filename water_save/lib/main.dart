import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:water_save/google_sign_in.dart';
import 'package:water_save/water_esp32.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  
}

Widget _logoapp() {
  return Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: const Image(
          width: 130.0,
          image: AssetImage('assets/logo/agua_1.png'),
          fit: BoxFit.cover),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget Title_WA() {
  return SafeArea(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Water Saver',
            style: TextStyle(
                color: Color.fromARGB(255, 88, 175, 127),
                fontSize: 30.0,
                fontWeight: FontWeight.bold))
      ],
    ),
  );
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();}
  @override
  Widget build(BuildContext context) =>ChangeNotifierProvider(
    create: (context)=>GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomme(),
    ),
  );
}

class MyHomme extends StatefulWidget {
  MyHomme({Key? key}) : super(key: key);

  @override
  State<MyHomme> createState() => _MyHommeState();
}

class _MyHommeState extends State<MyHomme> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            color: Colors.black87,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _logoapp(),
                  const SizedBox(
                    height: 30,
                  ),
                  Title_WA(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 19, 63, 113),
                    ),
                    icon: const FaIcon(FontAwesomeIcons.google),
                    label: const Text('Sign in with Google'),
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                      provider.googleLogin();
                      /*Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => HomePage1()));*/
                       
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}*/