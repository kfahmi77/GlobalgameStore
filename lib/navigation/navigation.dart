import 'package:flutter/material.dart';
import 'package:globalgamestore/home/home.dart';
import 'package:globalgamestore/notifikasi/notifikasi.dart';
import 'package:globalgamestore/profile/profile.dart';


class NavAppBar extends StatefulWidget {
  const NavAppBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavAppBar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const NotifikasiApp(),
    const ProfileApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],

        //Selected menu style.
        // backgroundColor: Colors.orange,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        selectedItemColor: const Color(0xFFEE4532),
        // unselectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
