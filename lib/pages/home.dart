import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chatting.dart';
import 'contacts.dart';

class HomePage extends StatefulWidget {
  @override
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Home'),
    ),
    body: const Center(
      child: Text(
        'Welcome to the Home Screen!',
        style: TextStyle(fontSize: 24),
      ),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    // Chatting(),
    contacts(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Textme',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Text(
                'Textme',
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
              ),
              title: const Text('Help'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.login_outlined,
              ),
              title: const Text('Logout'),
              onTap: () {
                signOut();
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chatting",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_contact_calendar_sharp), label: "Contacts"),
        ],
      ),
    );
  } //end Widget build
}

void signOut() {
  // var auth;
  // var auth;
  FirebaseAuth.instance.signOut();
} //end HomePageState class
