import 'package:flutter/cupertino.dart';

import '../brain/item.dart';

class Cart_notifier with ChangeNotifier{
  List<Item_data> products_Oncard = [];
  String myName = "ramez malak";
  void delete(item_name){
    products_Oncard.removeAt(item_name);
    notifyListeners();
  }
}