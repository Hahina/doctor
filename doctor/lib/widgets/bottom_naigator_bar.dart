
import 'package:doctor/screen/calendar_screen.dart';
import 'package:doctor/screen/preparat_screen.dart';
import 'package:doctor/screen/today_screen.dart';
import 'package:flutter/material.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedTab = 0;
    
  void onSelectTab(int index){
    if(_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GRAPE DOCTOR'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const CalendarScreen(),
          TodayScreen(),
          const PreparatScreen(),
        ],
      ), 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Календар',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Сьогодні',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Препарати',
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}