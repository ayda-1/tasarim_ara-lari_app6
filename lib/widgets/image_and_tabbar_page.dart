import 'package:flutter/material.dart';

class ImageAndTabbarPage extends StatefulWidget {
  const ImageAndTabbarPage({super.key});

  @override
  State<ImageAndTabbarPage> createState() => _ImageAndTabbarPageState();
}

class _ImageAndTabbarPageState extends State<ImageAndTabbarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resim + Tabbar"),
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            //resim alanı
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/id/1011/800/400"),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: const Text(
                "Ürün başlığı",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  shadows: [Shadow(blurRadius: 8, color: Colors.yellowAccent)],
                ),
              ),
            ),
            const TabBar(
              tabs: [
                Tab(text: "Açıklama"),
                Tab(text: "Yorumlar"),
                Tab(text: "Detay"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Ürün Açıklaması")),
                  Center(child: Text("Ürün Yorumları")),
                  Center(child: Text("Ürün Detayı")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
