import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cleancare/contentpage.dart';
import 'package:cleancare/homepage.dart';
import 'package:cleancare/servicedetail.dart';

class ServiceType extends StatefulWidget {
  @override
  _ServiceTypeState createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  int _currentIndex = 0;

  final List<Widget> _children = [Home(), ServicesDetail(), ContentPage()];

  void _onBottomNavBarTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('HOME')),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service), title: Text('SERVICE.')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('PROFILE'))
        ],
      ),
      body: _children[_currentIndex],

    );
  }
}
