import 'package:flutter/material.dart';

class NestedTabbarOrnek extends StatefulWidget {
  const NestedTabbarOrnek({super.key});

  @override
  State<NestedTabbarOrnek> createState() => _NestedTabbarOrnekState();
}

class _NestedTabbarOrnekState extends State<NestedTabbarOrnek> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("İç İçe Sekmeli Tab"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.red.shade300,
          bottom: const TabBar(
            labelStyle: TextStyle(color: Colors.white),
            tabs: [
              Tab(text: "Kategori 1"),
              Tab(text: "Kategori 2"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InnerTabView(categoryName: "Kategori 1"),
            InnerTabView(categoryName: "Kategori 2"),
          ],
        ),
      ),
    );
  }
}

class InnerTabView extends StatelessWidget {
  final String categoryName;
  const InnerTabView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.green,
            tabs: [
              Tab(text: "Alt Kategori A"),
              Tab(text: "Alt Kategori B"),
              Tab(text: "Alt Kategori C"),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text("$categoryName - Alt Sekme A")),
                Center(child: Text("$categoryName - Alt Sekme B")),
                Center(child: Text("$categoryName - Alt Sekme C")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
