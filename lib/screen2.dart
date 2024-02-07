import 'package:flutter/material.dart';

class box extends StatelessWidget {
  
    String boxText;
    box(this.boxText);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal[200],
                  ),
                  padding: const EdgeInsets.all(8),
                  child:  Text(boxText),
    );
  }
}

class screenone extends StatelessWidget {
  const screenone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SizedBox(
            height: 600,
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              primary: true,
              padding: const EdgeInsets.all(8),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 5,
              children: [
                box("test1"),
                box("test2"),
                box("test3"),
                box("test4"),
                box("test5"),
                box("test6"),
                box("test7"),
                box("test8"),
                box("test9"),
                box("test10"),
                box("test11"),
                box("test12"),
                box("test13"),
                box("test14"),
                box("test15"),
                box("test16"),
                box("test17"),
                box("test18"),
                box("test19"),
                box("test20"),
                box("test21"),
                box("test22"),
                box("test23"),
                box("test24"),
                box("test25"),
                box("test26"),
                box("test27"),
                box("test28"),
                box("test29"),
                box("test30"),
              ],
            ),
          ),
        ));
  }
}
