import 'package:hive/hive.dart';
part 'model.g.dart';


@HiveType(typeId: 1)
class UploadData {
  @HiveField(0)
  final List<dynamic> rowData;

  UploadData(this.rowData);
}
