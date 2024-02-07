import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timet/screen2.dart';

main() {
  runApp(const Myapp());
}

class box2 extends StatelessWidget {
  
    String boxText2;
    box2(this.boxText2);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal[200],
                    ),
                    padding: const EdgeInsets.all(8),
                    child:  Text(boxText2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
      ),
    );
  }
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 17, 255),
      ),
      home: home(),
    );
  }
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  box2("hi"),
                  box2("hi"),
                  box2("hi"),
                  box2("hi1"),
                  box2("hi2"),
                  box2("hi3"),
                ],
              ),
              Row(
                children: [
                  box2("hi1"),
                  box2("hi2"),
                  box2("hi3"),
                  box2("hi1"),
                  box2("hi2"),
                  box2("hi3"),
                ],
              ),
              Row(
                children: [
                  box2("hi"),
                  box2("hi"),
                  box2("hi"),
                  box2("hi1"),
                  box2("hi2"),
                  box2("hi3"),
                ],
              ),
              Row(
                children: [
                  box2("hi"),
                  box2("hi"),
                  box2("hi"),
                  box2("hi1"),
                  box2("hi2"),
                  box2("hi3"),
                ],
              ),
              Row(
                children: [
                  box2("hi"),
                  box2("hi"),
                  box2("hi"),
                  box2("hi1"),
                  box2("hi2"),
                  box2("hi3"),
                ],
              ),
              
            
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const screenone()),
                        );
                      },
                      child: Text('click')),],
          ),
        ),
      ),
    );
  }
}
