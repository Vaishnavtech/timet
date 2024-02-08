import 'package:flutter/material.dart';

class box extends StatelessWidget {
  
    String boxText;
    box(this.boxText);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.teal[200],
                  ),
                  padding: const EdgeInsets.all(8),
                  child:  Text(boxText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
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
                    color:Colors.teal[200],
                  ),
                  padding: const EdgeInsets.all(8),
                  
                  child:  Text(boxText,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
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
              crossAxisCount: 6,
              children: [
                hdr("1"),
                box("LAB 1"),
                box("TEXT2"),
                box("TEXT3"),
                box("TEXT4"),                
                box("TEXT5"),

                hdr("2"),
                box("LAB 10"),           
                box("TEXT6"),
                box("TEXT7"),
                box("TEXT8"),
                box("TEXT9"),

                hdr("3"),
                box("LAB 11"),
                box("TEXT12"),
                box("TEXT13"),
                box("TEXT14"),
                box("TEXT15"),

                hdr("4"),
                box("OS 16"),
                box("TEXT17"),
                box("TEXT18"),
                box("TEXT19"),
                box("TEXT20"),

                hdr("5"),
                box("TEXT21"),
                box("TEXT22"),
                box("TEXT23"),
                box("TEXT24"),
                box("TEXT25"),

                hdr("6"),
                box("TEXT26"),
                box("TEXT27"),
                box("TEXT28"),
                box("TEXT29"),
                box("TEXT30"),
              ],
            ),
          ),
        ));
  }
}
