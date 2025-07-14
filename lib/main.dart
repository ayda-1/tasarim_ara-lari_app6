import 'package:app6/widgets/expansion_tile_page.dart';
import 'package:app6/widgets/liste_ornek.dart';
import 'package:app6/widgets/page_view_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyProject());
  }
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  List<Widget> sayfalar = [ListeOrnek(), ExpansionTilePage(), PageViewPage()];
  int bottomIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasarım Araçları"),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
      ),
      body: sayfalar[bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Liste"),
          BottomNavigationBarItem(
            icon: Icon(Icons.expand_less_outlined),
            label: "Expansion",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: "PageView"),
        ],
        selectedItemColor: Colors.orange.shade900,
        unselectedItemColor: Colors.orange.shade300,
        currentIndex: bottomIndex,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
      ),
    );
  }
}
