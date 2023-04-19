import 'package:flutter/material.dart';
import 'package:free_study_books_app/Screens/ChatScreen/chatScreen.dart';
import 'package:free_study_books_app/Screens/FIndBookScreen.dart';
import 'package:free_study_books_app/Screens/postYourBookScreen/PostBookPhtosScreen.dart.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          FindBookScreen(),
          PostBookPhotosScreen(),
          ChatScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_rounded),
            label: "Sell book",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "chat",
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 16),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
