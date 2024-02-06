import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timet/screen2.dart';

main() {
  runApp(const Myapp());
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
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 25, 247),
        centerTitle: true,
        title: Text('Time'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav1',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 118, 228, 1)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav4',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 250, 217)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav7',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 1, 172, 6)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const screenone()),
                      );
                    },
                    child: Text('click')),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav2',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 93, 229, 1)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav5',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 5, 249, 123)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav8',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 0, 229, 8)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav3',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 117, 255, 18)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav6',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 255, 179)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav9',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 255, 8)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav3',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 117, 255, 18)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav6',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 255, 179)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav9',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 255, 8)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav3',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 117, 255, 18)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav6',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 255, 179)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav9',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 255, 8)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav3',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 117, 255, 18)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav6',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 255, 179)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text('vaishnav9',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 0, 255, 8)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
