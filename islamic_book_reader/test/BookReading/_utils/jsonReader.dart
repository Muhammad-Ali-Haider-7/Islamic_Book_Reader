import 'dart:convert';
import 'dart:io';

Map<String,dynamic> jsonReader(String name) {
  final dir = Directory.current.path;

  return jsonDecode(File('$dir/test/BookReading/_utils/dummy/$name').readAsStringSync());
}