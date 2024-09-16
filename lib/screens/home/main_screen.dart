import 'package:app_de_estudio/screens/home/home_screen.dart';
import 'package:app_de_estudio/screens/temas/temas_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  static List<Widget> tabBarPages = [
    const HomeScreen(),
    const TemasScreen(),
    const HomeScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBarPages[selectedIndex],
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  BottomNavigationBar bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Get.isDarkMode ? Colors.black : Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        selectedFontSize: 16,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quizzes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: 'Temas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil')
        ]);
  }
}
