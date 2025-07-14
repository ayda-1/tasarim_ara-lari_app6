import 'dart:math';

import 'package:flutter/material.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({super.key});

  @override
  State<PageViewPage> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  bool yatayEksen = true;
  bool isPageSnapping = true;
  int currentIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            scrollDirection: yatayEksen ? Axis.horizontal : Axis.vertical,
            pageSnapping:
                isPageSnapping, //dokunduğumuzda diğer sayfaya mı geçsin yoksa harekete göre kalsın mı
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
              // debugPrint("Sayfa index: $index");
            },
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.indigo.shade300,
                child: Center(
                  child: Text("Sayfa 0", style: TextStyle(fontSize: 36)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.purple.shade300,
                child: Center(
                  child: Text("Sayfa 1", style: TextStyle(fontSize: 36)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.pink.shade300,
                child: Center(
                  child: Text("Sayfa 2", style: TextStyle(fontSize: 36)),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            width: double.infinity,
            color: Colors.blueGrey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: currentIndex == 2
                          ? null
                          : () {
                              pageController.nextPage(
                                duration: Duration(seconds: 2),
                                curve: Curves.easeIn,
                              );
                            }, //current index son sayfada ise yani 2yse, null olucak yani tıklanamayacak
                      child: Text("İleri"),
                    ),
                    ElevatedButton(
                      onPressed: currentIndex == 0
                          ? null
                          : () {
                              pageController.previousPage(
                                duration: Duration(seconds: 2),
                                curve: Curves.easeIn,
                              );
                            }, //current index son sayfada ise yani 2yse, null olucak yani tıklanamayacak
                      child: Text("Geri"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Yatay eksende çalış"),
                    Checkbox(
                      value: yatayEksen,
                      onChanged: (val) {
                        setState(() {
                          yatayEksen = val!;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Page Snapping Değiştir"),
                    Checkbox(
                      value: isPageSnapping,
                      onChanged: (val) {
                        setState(() {
                          isPageSnapping = val!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
