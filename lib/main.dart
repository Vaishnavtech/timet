import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:timet/model.dart';
import 'package:timet/csv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UploadDataAdapter().typeId)) {
    Hive.registerAdapter(UploadDataAdapter());
  }

  runApp(Myapp());
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
  home({super.key});
  final bulkInsta = bulkUploadState();
  @override
  Widget build(BuildContext context) {
    return bulkUpload();
  }
}
