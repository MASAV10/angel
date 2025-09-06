// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'My CRUD operation App'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

  

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//    final TextEditingController _controller = TextEditingController();

//   void _incrementCounter() {
//     setState(() {
      
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//         leading: Icon(Icons.menu),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:(){
//          AlertDialog(
//           title: Text('Enter Comments'),
//           content: TextField(
//             controller: _controller,
//             decoration: InputDecoration(
//               hintText: "Please enter the comments here...",
//               border: OutlineInputBorder(),
//             ),
//           ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('CANCEL'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('SAVE'),
//               ),
//             ],
//         );       
//         },        
//         tooltip: 'Add Comment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:angel/my_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // auto-generated by FlutterFire CLI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  MyScreen();
  runApp(MyApp());
}


class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScreen(),
    );
  }

}





/*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage
    extends State<CurrencyConverterMaterialPage> {
  String enteredComment = 'No comments yet';

  final TextEditingController textEditingController = TextEditingController();

  CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('test');

//  QuerySnapshot? snapshotComments;
 
//   Future<void> getComments() async {
//     final data =
//         await FirebaseFirestore.instance.collection('test').get();

//     setState(() {
//       snapshotComments = data; // update state so UI rebuilds
//     });
//     debugPrint("Docs count: ${data.docs.length}");
   
//   }

  @override
  void initState() {
   
    super.initState();
  }

  void _cancelComment(){
    textEditingController.text = '';
      Navigator.pop(context);
  }

  void _saveComments() {
    setState(() {
      enteredComment = textEditingController.text;
      addComments(enteredComment);
      textEditingController.text = '';
      Navigator.pop(context);
    });
  }

  Future<void> addComments(String commentsIAdded) async {
    await collectionReference.add({
      'comments_added': commentsIAdded,
    });
  }

  void clearData() {
    setState(() {
      enteredComment = 'Cleared the comments';
    });
  }

  void closeData() {
    setState(() {
      enteredComment = 'No comments yet';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My first APP'),
        backgroundColor: Colors.amber,
        leading: Icon(Icons.menu),
        actions: [
          PopupMenuButton(
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Row(children: [Text('cancel')]),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(children: [Text('close')]),
                  ),
                ],
            onSelected: (value) {
              if (value == 1) {
                clearData();
              } else if (value == 2) {
                closeData();
              }
            },
          ),
        ],
      ),
      body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 250, // give space for the ListView
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('test').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No Users Found"));
            }

            // Display list of users
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return ListTile(
                  title: Text(doc['comments_added']),
                );
              }).toList(),
            );
          },
        ),
      ),
    
    ],
  ),
),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Expanded(
                child: AlertDialog(
                  title: Text('Add Comments Dailog'),
                  content: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Please enter the comments',
                      border: OutlineInputBorder(),
                      labelText: 'Comments',
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: _cancelComment,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shadowColor: Colors.purple,
                        elevation: 10,
                      ),
                      child: Text('CANCEL'),
                    ),
                    ElevatedButton(
                      onPressed: _saveComments,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                      child: Text('SAVE'),
                    ),
                    SizedBox(width: 15),
                  ],
                ),
              );
            },
          );
        },
        icon: Icon(Icons.add),
        tooltip: 'add comments',
        label: Text('Comments'),
      ),
    );
  }
}
*/