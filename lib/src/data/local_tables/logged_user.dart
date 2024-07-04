import 'package:drift/drift.dart';

class LoggedUser extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get email => text().unique().withLength(
        min: 1,
      )();

  TextColumn get name => text().nullable()();
}
