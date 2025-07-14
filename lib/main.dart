import 'package:app6/widgets/expansion_tile_page.dart';
import 'package:app6/widgets/filter_menu_with_chips.dart';
import 'package:app6/widgets/image_and_tabbar_page.dart';
import 'package:app6/widgets/liste_ornek.dart';
import 'package:app6/widgets/nested_tabbar_ornek.dart';
import 'package:app6/widgets/page_view_page.dart';
import 'package:app6/widgets/settings_expansion_menu.dart';
import 'package:app6/widgets/simple_image_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilterMenuWithChips(),
    );
  }
}

class MyProject extends StatefulWidget {
  const MyProject({super.key});

  @override
  State<MyProject> createState() => _MyProjectState();
}

class _MyProjectState extends State<MyProject> {
  int bottomIndex = 0;
  var keyList = PageStorageKey(
    "key liste",
  ); //bunlar sayfadan sayfaya geçişte diğer sayfada kalınan yerin 0lanmaması için
  var keyExpansion = PageStorageKey("key expansion");
  late List<Widget> sayfalar;
  @override
  void initState() {
    //key yapısına ulasabilmesi icin ,listeyi initstate'de dolduruyoruz, bu key'ler için yani, baska sayfa geçişinde önceki sayfanın nerde oldugu bilgisi veriliyor
    // TODO: implement initState
    super.initState();
    sayfalar = [
      ListeOrnek(listKey: keyList),
      //ExpansionTilePage(expansionKey: keyExpansion),
      SettingsExpansionMenu(),
      //PageViewPage(),
      SimpleImageSlider(),
    ];
  }

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
