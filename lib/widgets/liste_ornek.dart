import 'package:flutter/material.dart';

class ListeOrnek extends StatefulWidget {
  final PageStorageKey
  listKey; //final yazmak istemiosak constu silmezsek hataoluyor alttaki, ayrıca final yazmak daha mantıklı cünkü key değişmicek ztn
  const ListeOrnek({super.key, required this.listKey});

  @override
  State<ListeOrnek> createState() => _ListeOrnekState();
}

class _ListeOrnekState extends State<ListeOrnek> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: widget.listKey,
      //llistviewla kullanmak sacma sadece suanlık göstermelik olarak
      itemCount: 10,
      itemExtent: 300,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(10),
            color: index % 2 == 0
                ? Colors.orangeAccent.shade200
                : Colors.indigo.shade200,
            child: Center(child: Text("Kutu $index")),
          ),
        );
      },
    );
  }
}
