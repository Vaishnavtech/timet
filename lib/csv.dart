import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, rootBundle;
import 'package:csv/csv.dart';
import 'package:timet/box.dart';

class bulkUpload extends StatefulWidget {
  const bulkUpload({Key? key}) : super(key: key);

  @override
  State<bulkUpload> createState() => bulkUploadState();
}

class bulkUploadState extends State<bulkUpload> {
  List<List<dynamic>> data = [];
  String? filePath;

  // This function is triggered when the  button is pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FloatingActionButton(
          onPressed:(){ pickFile();},
          tooltip: 'Upload File',
          child: const Icon(Icons.add)),
        ),
        body: SafeArea(
          child:
       SingleChildScrollView(
        
        
        scrollDirection:MediaQuery.of(context).orientation == Orientation.landscape?Axis.vertical: Axis.horizontal,

        
         child: Column(
          children: [ Row(
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
    // print(result.files.first.name);
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
  }
}

