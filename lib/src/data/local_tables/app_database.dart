import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:servu_api/src/data/static/configuration.dart';
import 'package:sqlite3/sqlite3.dart';

// import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'local_user.dart';
import 'logged_user.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [LocalUser, LoggedUser])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

/// Copied from https://drift.simonbinder.eu/docs/getting-started/
LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // var dbFolder = await getApplicationDocumentsDirectory();
    var dbFolder = await Configuration.dbPath;
    var file = File(p.join(dbFolder, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      // await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    var cachebase = await Configuration.tempDbDirectory;
    //var cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
