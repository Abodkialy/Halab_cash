import 'package:flutter/material.dart';
import 'package:halab_cash/componants/appbar.dart';
import 'package:halab_cash/componants/blaancecard.dart';
import 'package:halab_cash/componants/transferbouttons.dart';
import 'package:halab_cash/componants/transfercard.dart';
import 'package:halab_cash/componants/mynav.dart';
import 'package:halab_cash/screens/profile.dart';
import 'package:halab_cash/screens/search.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    Profile(),
    Center(child: Search()), // إذا بدك تحط شي تاني
    ListView(
      children: [
        Blaancecard(),
        SizedBox(height: 10),
        Transferbouttons(),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(right: 24),
          child: Text(
            'التحويلات',
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 24),
          ),
        ),
        Transfercard(
          amount: 500,
          status: "مستلم",
          userName: "علي",
          userHandle: "@ali",
        ),
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar1(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Mynav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1E6C4C),
        shape: const CircleBorder(
          side: BorderSide(color: Colors.white, width: 5.0),
        ),
        onPressed: () {
          _onItemTapped(1);
        },
        child: const Icon(Icons.search, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    );
  }
}
