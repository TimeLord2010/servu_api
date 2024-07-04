import 'package:servu_api/src/usecases/path/get_application_documents_directory.dart';
import 'package:servu_api/src/usecases/path/get_temporary_directory.dart';

import '../enums/operations_mode.dart';

class Configuration {
  static OperationsMode get mode => OperationsMode.offline;

  static String? _dbPath;
  static Future<String> get dbPath async {
    if (_dbPath != null) {
      return _dbPath!;
    }
    var dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  static String? _tempDbDirectory;
  static Future<String> get tempDbDirectory async {
    if (_tempDbDirectory != null) {
      return _tempDbDirectory!;
    }
    var dir = await getTemporaryDirectory();
    return dir.path;
  }
}
