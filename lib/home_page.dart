import 'package:flutter/material.dart';
import 'package:drawer/pages/PageView/my_profile.dart';
import 'pages/PageView/bag_page.dart';
import 'pages/PageView/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          HomeScreen(),
          BagPage(),
          MyProfile(),
        ],
      ),
      drawer: Drawer(
        // ListView, utilizamos quando queremos uma lista de Widgets
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Teofilo"),
              accountEmail: Text("theodev@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                child: Text('T'),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              trailing: const Icon(Icons.home),
              onTap: () {
                _pageController.jumpToPage(0);
                // Minimizar o drawer após ser clicado
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Bag'),
              trailing: const Icon(Icons.shopping_bag),
              onTap: () {
                _pageController.jumpToPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('My profile'),
              trailing: const Icon(Icons.person),
              onTap: () {
                _pageController.jumpToPage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
