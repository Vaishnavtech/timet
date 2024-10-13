import 'dart:async'; 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timet/csv.dart';

class Item {
  String live;

  Item({required this.live});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      live: json['live'],
    );
  }

  Map<String, dynamic> toJson() => {
        'live': live,
      };
}

class FirestoreManagementScreen extends StatefulWidget {
  const FirestoreManagementScreen({Key? key}) : super(key: key);

  @override
  _FirestoreManagementScreenState createState() =>
      _FirestoreManagementScreenState();

    FirestoreManagementScreen.Floatingbutton();  
}

class _FirestoreManagementScreenState extends State<FirestoreManagementScreen> {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    
    super.dispose();
  }

  

  Future<void> _addItem() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('liveclass')
        .where('live', isEqualTo: mystatus)
        .get();

    if (querySnapshot.docs.isEmpty) {
      try {
        await _firestore.collection('liveclass').add(
          Item(live:mystatus).toJson(),
        );
  
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error adding item: $e'),
        ));
      }
    } else {
      
    }
  }

  Future<void> delete() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('liveclass')
          .where('live', isEqualTo:mystatus)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await querySnapshot.docs.first.reference.delete();
        
       
      } else {
        print('No document found for the specified date.');
      }
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(onLongPress: () => delete(),
                 child: FloatingActionButton(
                           onPressed: _addItem,
                           splashColor: Color.fromARGB(255, 87, 183, 171),
                           enableFeedback: true,
                           child: const Icon(Icons.online_prediction),
                           ));
  }
}

