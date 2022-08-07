import 'package:clonetiktok/constant.dart';
import 'package:clonetiktok/views/screens/auth/CustomIcon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: (index){
          setState((){
            pageIndex = index;
          });
        },
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(icon:  Icon(Icons.home,size: 30,),label: 'Home'),
          BottomNavigationBarItem(icon:  Icon(Icons.search,size: 30,),label: 'Search'),
          BottomNavigationBarItem(icon:  CustomIcon(),label: ''),
          BottomNavigationBarItem(icon:  Icon(Icons.message,size: 30,),label: 'Message'),
          BottomNavigationBarItem(icon:  Icon(Icons.person,size: 30,),label: 'Profile'),
        ],
      ),
      body: Center(child: pages[pageIndex]),
    );
  }
}
