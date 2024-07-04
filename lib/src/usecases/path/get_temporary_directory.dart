import 'dart:io';

Future<Directory> getTemporaryDirectory() async {
  Directory directory;
  if (Platform.isWindows) {
    directory = Directory('${Platform.environment['TEMP']}\\MyApp');
  } else if (Platform.isLinux || Platform.isMacOS) {
    directory = Directory.systemTemp.createTempSync('myapp');
  } else {
    // Add more platform-specific paths if needed
    directory = Directory.systemTemp;
  }

  if (!await directory.exists()) {
    await directory.create(recursive: true);
  }
  return directory;
}
