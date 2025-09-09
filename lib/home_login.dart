// import 'package:animated_emoji/animated_emoji.dart';
import 'package:angel/auth_services.dart';
import 'package:angel/open_favorites.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeLogin extends StatefulWidget {
  const HomeLogin({super.key});

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  var errorMessageFromFirebaseForEmail = '';
  var errorMessageFromFirebaseForPassword = '';

  Stream<QuerySnapshot> collectionReferenceOfUsers =
      FirebaseFirestore.instance.collection('learnFlutterUsers').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: SelectableText('Login Page'),
        foregroundColor: Colors.black87,
        backgroundColor: Colors.blueGrey[200],
        actions: [Icon(Icons.arrow_back_outlined)],
      ),
      body: Card.filled(
        margin: EdgeInsets.all(50),
        color: Color(0xFFDA70D6),
        child: StreamBuilder(
          stream: collectionReferenceOfUsers,
          builder: (context, AsyncSnapshot snapshot!){

          },
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Help'),
        tooltip: 'Help',
        icon: Icon(Icons.help_outline_outlined),
        backgroundColor: Colors.redAccent,
        onPressed: () {},
      ),
    );
  }

  Widget getAuthenticatedPage() {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 30,
                  left: 30,
                ),
                width: 200,
                child: Image.asset('Assests/masa.jpg'),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            autocorrect: false,
                            autofocus: true,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: Text('Enter Your Email'),
                              errorText: errorMessageFromFirebaseForEmail,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              label: Text('Enter Your Password'),
                              errorText: errorMessageFromFirebaseForPassword,
                              // errorText: 'Please Enter Correct Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: registerUserToFirebase,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent[200],
                              shadowColor: const Color.fromARGB(
                                255,
                                232,
                                176,
                                242,
                              ),
                              elevation: 5,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createLoginPage() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  // errorText: 'Not a vaild name',
                  label: Text('Enter Your Name'),
                  fillColor: Color(0xFF6A5ACD),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text('Enter Your Phone Number'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              SizedBox(height: 5),
              //radio
              SizedBox(height: 5),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text('Enter Your Email'),
                  // errorText: errorMessageFromFirebaseForEmail,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              SizedBox(height: 5),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  label: Text('Enter Your Password'),
                  errorText: errorMessageFromFirebaseForPassword,
                  // errorText: 'Please Enter Correct Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent[700],
                  fixedSize: Size(200, 10),
                ),
                onPressed: () {},
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void registerUserToFirebase() async {
    try {
      await authservicesVaraiable.value.createAccount(
        email: emailController.text,
        password: passwordController.text,
      );
      emailController.clear();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      if (e.message!.contains('email')) {
        setState(() {
          errorMessageFromFirebaseForEmail = e.message.toString();
          emailController.clear();
        });
      } else if (e.message!.contains('Password')) {
        setState(() {
          errorMessageFromFirebaseForPassword = e.message.toString();
          emailController.clear();
          passwordController.clear();
        });
      }
    }
  }
}
