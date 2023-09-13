import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';




class hotreload_time {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }


  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/hot_reload_time.txt');
  }
  Future<File> writeDate() async {
    final file = await _localFile;
    print("*"*50);
    print(file);

    // Write the file
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('MM-dd HH:mm').format(now);
    return file.writeAsString('$formattedTime');
  }
  Future<String> loadData() async {
    final String loadedData = await rootBundle.loadString('lib/data/hot_reload_time.txt');


    return ('Hot reload: ${loadedData}');

  }





  // void writeLastHotReloadTime() {
  //   DateTime now = DateTime.now();
  //   String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  //   File file = File('lib/data/hot_reload_time.txt');
  //
  //   if (!file.existsSync()) {
  //     file.writeAsString(formattedTime);
  //     print('Initial hot reload time recorded: $formattedTime');
  //   } else {
  //     print('Hot reload time already exists.');
  //   }
  // }


  // String readLastHotReloadTime() {
  //   File file = File('lib/data/hot_reload_time.txt');
  //   if (file.existsSync()) {
  //     String contents = file.readAsStringSync();
  //     return ('Hot reload: $contents');
  //   } else {
  //     return('Hot reload null');
  //   }
  // }
}

