import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timet/box.dart';
import 'package:timet/model.dart';
import 'package:timet/FireButton.dart';
import 'dart:async'; // For StreamSubscription
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';


String mystatus="VaishnavTP";



class bulkUpload extends StatefulWidget {
  const bulkUpload({Key? key}) : super(key: key);

  @override
  State<bulkUpload> createState() => bulkUploadState();
}

class bulkUploadState extends State<bulkUpload> {
  List<List<dynamic>> data = [];
  String? filePath;

Future<void> getDataFromHive() async {

  final box = await Hive.openBox<UploadData>('bulkUploadData');
  final dataList = box.values.map((e) => e.rowData).toList();
  setState(() {
    data = dataList;
   
    mystatus=data[0][7].toString(); 

    
  });
}
 @override
  void initState() {
    super.initState();
    getDataFromHive(); // Fetch data initially
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
         decoration: BoxDecoration(
        gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              
              stops: [0.01, 0.4],
              colors: [ Provider.of<ColorProvider>(context).liveClassColor, const Color.fromARGB(65, 0, 0, 0)])
      
      ),
      child: Scaffold(
          backgroundColor:Colors.transparent ,
          floatingActionButton: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: FloatingActionButton(
                    onPressed: () {
                      pickFile();
                    },
                    tooltip: 'Upload File',
                    child: const Icon(Icons.add)),     
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0,1.0,15.0,10.0),
                child: FirestoreManagementScreen.Floatingbutton(),
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? Axis.vertical
                      : Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      hdr2("1", 40),
                      hdr2("2", 40),
                      hdr2("3", 40),
                      hdr2("4", 40),
                      hdr2("5", 40),
                      hdr2("6", 40),
                    ],
                  ),
                  for (int i = 1; i < 6; i++)
                    Row(
                      children: [
                        box3(data[i][0].toString(), i, data[i][6].toString()),
                        box3(data[i][1].toString(), i, data[i][6].toString()),
                        box3(data[i][2].toString(), i, data[i][6].toString()),
                        box3(data[i][3].toString(), i, data[i][7].toString()),
                        box3(data[i][4].toString(), i, data[i][7].toString()),
                        box3(data[i][5].toString(), i, data[i][7].toString()),
                      ],
                    ),
                    
                    
                ],
              ),
            ),
          )),
    );
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) 
    return;
    else
    {
    final box = await Hive.openBox<UploadData>('bulkUploadData');
    await box.clear();
    }
    // we will log the name, size and path of the
    // first picked file (if multiple are selected)

    filePath = result.files.first.path!;

    final input = File(filePath!).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
   

    setState(() {
      data = fields.sublist(1);
  
    });
    
    await saveDataToHive();
  }

  Future<void> saveDataToHive() async {
   
    final box = await Hive.openBox<UploadData>('bulkUploadData');

    for (var row in data) {
      await box.add(UploadData(row));
    }
  }
}



class ColorProvider extends ChangeNotifier {
  Color _liveClassColor = Colors.grey;

  Color get liveClassColor => _liveClassColor;

  StreamSubscription<QuerySnapshot>? _subscription;

  ColorProvider() {
    _listenForFirestoreChanges();
  }

void _listenForFirestoreChanges() async{
  
final box = await Hive.openBox<UploadData>('bulkUploadData');
  final dataList1 = box.values.map((e) => e.rowData).toList();   
    String Mystatus=dataList1[0][7].toString();
      
  _subscription = FirebaseFirestore.instance
      .collection('liveclass')
      .where('live', isEqualTo:Mystatus)
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
          .where('live', isEqualTo: mystatus)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        _liveClassColor = Colors.greenAccent;
      } else {
        _liveClassColor = Colors.redAccent;
      }
      notifyListeners();
    } catch (e) {
      
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}


