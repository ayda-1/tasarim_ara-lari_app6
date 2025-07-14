import 'package:flutter/material.dart';

class ExpansionTilePage extends StatefulWidget {
  const ExpansionTilePage({super.key});

  @override
  State<ExpansionTilePage> createState() => _ExpansionTilePageState();
}

class _ExpansionTilePageState extends State<ExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text("Başlık ${index + 1}"),
          leading: Icon(Icons.wb_sunny),
          //sağ kosedeki iconu değiştirir
          //initiallyExpanded:true yaparsak ful acık gelir ilk
          //maintainStateÇ icerk temizlensinmi
          //tilePadding: baslik alaninin icini doldurur
          //onExpansionChanged: acılıp acılmadıgınıon bilgisini verir acıksa kapalıyosa fln örn adam birini acarsa dierinide acar gibi gibi
          children: [
            Container(
              height: 200,
              color: index % 2 == 0
                  ? Colors.blue.shade300
                  : Colors.yellow.shade300,
            ),
          ],
        );
      },
    );
  }
}
