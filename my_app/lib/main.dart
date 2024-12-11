import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/game_screen.dart';

import 'package:flame/game.dart';



Future<void> main() async {
  final game = FlameGame();
  runApp(GameWidget(game:game));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: const FirebaseOptions(
      apiKey: "AIzaSyAn9bTBmku2btocHOHv5b3P17oUU9kCUy0",
      authDomain: "AUTH_DOMAIN",
      projectId: "flutter-login-64b75",
      storageBucket: "flutter-login-64b75.appspot.com",
      messagingSenderId: "MESSAGING_SENDER_ID",
      appId: "1:431817380962:android:5543dd936de22f74962d3b",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage()
      
    );
  }
}

/*
 
Step 1 : create the main layout of the app
Step 2 : Login to My firebase console(if you don't have an account you can create one it's easy and free)
Step 3 : Create a new firebase project 
Step 4 : let's add the Firebase Dependencies for Flutter
Step 5 : let's init the Firebase app 
Step 6 : create the login function
Step 7 : now let's create a user inside our base and test the app 
Step 8 : let's input our user data and test the app
*/

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<FirebaseApp> _initialization;

  @override
  void initState() {
    super.initState();
    _initialization = Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (Firebase.apps.isNotEmpty) {
              return const LoginScreen();
            }else {
              // Handle Firebase not initialized
              return const Center(
                child: Text("Firebase not initialized."),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
  // Appele cette fonction après la connexion réussie 
  void navigateToGameScreen() {
    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const GameScreen()));
  }
}


class LoginScreen extends StatefulWidget {
  const LoginScreen ({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // 

  //Login function 
  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
    print("Starting login process");
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      print("Login success");
    }on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        print("Login failed: ${e.code}");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    //create the textfiled controller
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login to My Drawings App",
            style:TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            )
          ),
          const Text(
            "",
            style: TextStyle(
              color: Colors.black,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
            )
          ),
          const SizedBox( 
            height: 44.0,
          ),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration:  const InputDecoration(
              hintText: "User Email",
              prefixIcon: Icon(Icons.mail, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          TextField(
            controller:passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "User Password",
              prefixIcon: Icon(Icons.lock, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Text(
            "Don't Remember your Password?", 
            style: TextStyle(color: Colors.blue),
          ),
          const SizedBox(
            height: 88.0,
          ),
          SizedBox(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: const Color(0xFF0069FE),
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
              onPressed: () async {
                print("Login button pressed");
                //let's test the app 
                User? user = await loginUsingEmailPassword(email: emailController.text, password: passwordController.text, context: context);
                if(user != null) {
                  print("Navigation to ProfileScreen");
                  // ignore: use_build_context_synchronously
                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const ProfileScreen()));
                  // change cette ligne pour naviguer vers la page du jeu après connexion
                  // par exemple: 
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const GameScreen()));
                  // ou utilise la fonction définie dans _HomePageState
                 //(context as _HomePageState).navigateToGameScreen();
                  // let's make new screen 
                }
              },
              child: const Text("Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
            ),
          ),
        ],
      ),
    );
  }
}