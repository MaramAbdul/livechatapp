// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Chatting extends StatelessWidget {
//   //  Chatting({super.key});

// //instance of auth
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   const Chatting({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("home page"),
//       ), //end appBar
//       // body: _buildUserList(),
//     ); //end Scaffold
//   } //end Widget build

// //build a list of users except for the current logged in user/
//   Widget _buildUserList(DocumentSnapshot doucument) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection("users").snapshots(),
//       builder: ((context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text("error");
//         } //end if

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Text("loading");
//         } //end if
//         return ListView(
//           children: [
//             snapshot.data!.docs
//                 .map<Widget>((doc) => _buildUserListItem(doc))
//                 .toList(),
//           ],
//         ); //end listview
//       }),
//     );
//   }
// }
