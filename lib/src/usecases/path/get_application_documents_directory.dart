import 'dart:io';

Future<Directory> getApplicationDocumentsDirectory() async {
  Directory directory;
  if (Platform.isWindows) {
    directory = Directory('${Platform.environment['APPDATA']}\\MyApp\\Documents');
  } else if (Platform.isLinux || Platform.isMacOS) {
    directory = Directory('${Platform.environment['HOME']}/.myapp/documents');
  } else {
    // Add more platform-specific paths if needed
    directory = Directory.current;
  }

  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }
  return directory;
}
