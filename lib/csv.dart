import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, rootBundle;
import 'package:csv/csv.dart';


class bulkUpload extends StatefulWidget {
  const bulkUpload({Key? key}) : super(key: key);

  @override
  State<bulkUpload> createState() => _bulkUploadState();
}

class _bulkUploadState extends State<bulkUpload> {
  List<List<dynamic>> data = [];
   String? filePath;

  // This function is triggered when the  button is pressed

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        title: const Text(".csv Upload",
            style: TextStyle(color: Color.fromARGB(255, 16, 212, 16),
              fontSize: 20.0,)
        ),
      ),
        body: Column(
          children: [
            ElevatedButton(
            child: const Text("Upload FIle"),
              onPressed:(){
               pickFile();
              },
            ),

            ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return DataTable(
                  
                 columns: [DataColumn(label: Text("1")),
                           DataColumn(label: Text("2")),
                           DataColumn(label: Text("3")),
                           DataColumn(label: Text("4")), 
                           DataColumn(label: Text("5")),
                           DataColumn(label: Text("6")), ],

                  rows: [DataRow(cells: [
                    DataCell(Text(data[index][0].toString(),textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold ,color:Colors.black),)),DataCell(Text(data[0][0].toString(),textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold ,color:Colors.black),)),DataCell(Text(data[0][1].toString(),textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold ,color:Colors.black),)),DataCell(Text(data[0][2].toString(),textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold ,color:Colors.black),)),DataCell(Text(data[0][3].toString(),textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold ,color:Colors.black),)),DataCell(Text(data[0][4].toString(),textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold ,color:Colors.black),)), ]),],

                );

              },

            ),
            Container(
              child:  ElevatedButton(
                onPressed: ()async{
                // set loading to true here

                   for (var element in data.skip(1))  // for skip first value bcs its contain name
                  {
                    // var mydata = {
                    //   "data": {
                    //     "certificateType": "ProofOfEducation",
                    //     "membershipNum": element[0],   if you want to iterate only name then use element[0]
                    //     "registrationNum": element[1],
                    //     "serialNum": element[2],
                    //     "bcName": element[3],
                    //     "bcExam": element[4],
                    //     "date":element[5]
                    //   },
                    //
                    // };
                    ScaffoldMessenger.of(context).showSnackBar(  SnackBar(
                      content: Text(element.toString()),
                    ));
                  }

                }, child: const Text("Iterate Data"),

              ),
            ),
          ],
        )
    );

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
        data = fields;
      });
  }

}