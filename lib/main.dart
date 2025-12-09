import 'package:dino_kino/pages/homepage.dart';
import 'package:dino_kino/pages/moviespage.dart';
import 'package:dino_kino/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "alatsi", colorScheme: ColorScheme.dark()),
      home: MainViewPage(),
    );
  }
}

class MainViewPage extends StatelessWidget {
  const MainViewPage({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: initialIndex,
        length: 3,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [Homepage(), Moviespage(), ProfilePage()],
              ),
            ),
            TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: Color(0xffb5e200),
              unselectedLabelColor: Color(0xffb5e200).withAlpha(100),
              labelColor: Color(0xffb5e200),
              tabs: [
                Tab(icon: Icon(Icons.house)),
                Tab(icon: Icon(Icons.movie_creation)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
