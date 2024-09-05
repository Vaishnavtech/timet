import 'dart:async'; // For StreamSubscription

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        .where('live', isEqualTo: "gtxe")
        .get();

    if (querySnapshot.docs.isEmpty) {
      try {
        await _firestore.collection('liveclass').add(
          Item(live:"gtxe").toJson(),
        );
       
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Item added successfully!'),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error adding item: $e'),
        ));
      }
    } else {
      print("already exists");
    }
  }

  Future<void> delete(String out) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('liveclass')
          .where('live', isEqualTo: out)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        await querySnapshot.docs.first.reference.delete();
        print('Document deleted successfully!');
      } else {
        print('No document found for the specified date.');
      }
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ColorProvider>(context).liveClassColor,
      appBar: AppBar(
        title: const Text("Firestore Management"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () => delete("gtxe"),
                    child: const Text("delete")),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorProvider extends ChangeNotifier {
  Color? _liveClassColor = Colors.grey;

  Color? get liveClassColor => _liveClassColor;

  StreamSubscription<QuerySnapshot>? _subscription;

  ColorProvider() {
    _listenForFirestoreChanges();
  }

void _listenForFirestoreChanges() {
  _subscription = FirebaseFirestore.instance
      .collection('liveclass')
      .where('live', isEqualTo: "gtxe")
      .snapshots()
      .listen((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      _liveClassColor = Colors.greenAccent;
    } else {
      _liveClassColor = Colors.redAccent;
    }
    notifyListeners();
  });
}

  Future<void> getColor() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('liveclass')
          .where('live', isEqualTo: "gtxe")
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        _liveClassColor = Colors.greenAccent;
      } else {
        _liveClassColor = Colors.redAccent;
      }
      notifyListeners();
    } catch (e) {
      print('Error getting live class color: $e');
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

