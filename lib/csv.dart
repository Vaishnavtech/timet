import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timet/box.dart';
import 'package:timet/model.dart';
import 'package:timet/screen2.dart';

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
  });
}
 @override
  void initState() {
    super.initState();
    getDataFromHive(); // Fetch data initially
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FloatingActionButton(
              onPressed: () {
                pickFile();
              },
              tooltip: 'Upload File',
              child: const Icon(Icons.add)),
              
              
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
                for (int i = 0; i < data.length; i++)
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
                  
                  IconButton(
  onPressed: () {
   Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FirestoreManagementScreen()),
            );
  },
  icon: Icon(Icons.delete),
)
              ],
            ),
          ),
        ));
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) return;
    // we will log the name, size and path of the
    // first picked file (if multiple are selected)

    filePath = result.files.first.path!;

    final input = File(filePath!).openRead();
    final fields = await input
        .transform(utf8.decoder)
        .transform(const CsvToListConverter())
        .toList();
    print(fields);

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
