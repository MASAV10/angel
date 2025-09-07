// import 'package:animated_emoji/animated_emoji.dart';
import 'package:angel/auth_services.dart';
import 'package:angel/open_favorites.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
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
              // Text(
              //   'For Angel ',
              //   style: TextStyle(
              //     color: Color(0xFFC62828),
              //     fontSize: 20,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
              // AnimatedEmoji(AnimatedEmojis.anatomicalHeart),
              Card(
                margin: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            autocorrect: false,
                            autofocus: true,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              label: Text('Enter Your Email'),
                              // errorText: 'Please Enter Valid Email-ID',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              label: Text('Enter Your Password'),
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

      floatingActionButton: FloatingActionButton.extended(
        label: Text('Helpsss'),
        tooltip: 'Help',
        icon: Icon(Icons.help_outline_outlined),
        backgroundColor: Colors.redAccent,
        onPressed: () {},
      ),
    );
  }

  void registerUserToFirebase() async {
    try {
      await authservicesVaraiable.value.createAccount(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
    }
  }
}
