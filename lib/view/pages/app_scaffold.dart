import 'package:flutter/material.dart';
import 'package:task/view/pages/api_example.dart';
import 'package:task/view/pages/home_page.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int bottomBarIndex = 0;
  List pages = [const MyHomePage(), const ApiExample()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[bottomBarIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomBarIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                  color: Colors.pink,
                )),
            BottomNavigationBarItem(
                label: 'Api',
                icon: Icon(
                  Icons.api,
                  color: Colors.pink,
                )),
          ],
          onTap: (pageIndex) {
            setState(() {
              bottomBarIndex = pageIndex;
            });
          },
        ));
  }
}
