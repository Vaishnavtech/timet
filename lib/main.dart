import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:timet/screen2.dart';
import 'package:timet/model.dart';
import 'package:timet/csv.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UploadDataAdapter().typeId)) {
    Hive.registerAdapter(UploadDataAdapter());
  }
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);


   runApp(
    ChangeNotifierProvider(
      create: (context) => ColorProvider()..getColor(),
      child: Myapp(),
    ),
  );
}

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

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
