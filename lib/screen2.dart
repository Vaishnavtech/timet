import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'package:timet/csv.dart';
class box extends StatelessWidget {
  String boxText;
  box(this.boxText);
  final moonLanding = DateTime.parse(DateTime.now().toString());
  Color? metho() {
    return Colors.teal[200];
  }

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: metho(),
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          boxText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      back: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 61, 249, 183),
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          boxText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      direction: FlipDirection.HORIZONTAL,
      speed: 200,
    );
  }
}

class hdr extends StatelessWidget {
  String boxText;
  hdr(this.boxText);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.teal[200],
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        boxText,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }
}

class screenone extends StatelessWidget {
  const screenone({super.key});

  @override
  Widget build(BuildContext context) {
    return bulkUpload();
  }
}
