import 'package:mysql1/mysql1.dart';
import 'dart:async';

Future main() async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      user: "root",
      password: "Huzaifa.123",
      db: "book_search_engine",
      host: "localhost",
      port: 3306));

  var results = await conn.query("SELECT * FROM users");

  for (var row in results) {
    print(
        "Id = ${row[0]} : name = ${row[1]} : email = ${row[2]} : pass = ${row[3]}");
  }

  conn.close();
}
