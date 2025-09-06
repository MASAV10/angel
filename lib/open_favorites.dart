import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OpenFavorites extends StatefulWidget {
  const OpenFavorites({super.key});

  @override
  State<OpenFavorites> createState() => _OpenFavoritesState();
}

class _OpenFavoritesState extends State<OpenFavorites> {
  final TextEditingController addFav = TextEditingController();
  CollectionReference collectionReferenceForFav = FirebaseFirestore.instance
      .collection('learnFav');

  // Future<void> addCommentsFromFirebase(String enteredFavorites) async {
  //   await FirebaseFirestore.instance.collection('learnFav').add({
  //     'entered_fav': enteredFavorites,
  //   });
  // }

  // void simpleDailog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Expanded(
  //         child: SimpleDialog(
  //           title: Text('Add Favorites'),
  //           children: [
  //             SimpleDialogOption(

  //               onPressed: () {
  //                 Navigator.pop(context, 'user01@gmail.com');
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SelectableText('My Grid view/Bottom sheet'),
        foregroundColor: Colors.black87,
        backgroundColor: Colors.blueGrey[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance
                        .collection('learnFav')
                        .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('We Stuck with ${snapshot.error}'),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text("No Comments Found"));
                  }
                  return ListView(
                    children:
                        snapshot.data!.docs.map((doc) {
                          return ListTile(
                            title: Text(doc['entered_fav']),
                            trailing: Icon(Icons.update),
                            onTap: () {},
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
        onPressed: () {},
        label: Text('Add Favorites'),
        icon: Icon(Icons.add),
        tooltip: 'add comments',
      ),
    );
  }
}
