class Item_data {
  String bath;
  double price;
  String description;
  String product_Name;
  Item_data(
      {required this.bath,
      required this.price,
      required this.description,required this.product_Name});

}

List<Item_data> items = [
  Item_data(product_Name:"product 1",
      bath: "images/enemy.png",
      price: 12.88,
      description: """Performing hot reload
Syncing files to device Android SDK built for x86
Reloaded 1 of 1620 libraries in 6,631ms compile: 248 ms, reload: 1516 ms, reassemble: 4333 ms.Performing hot reload...
Syncing files to device Android SDK built for x86...
Reloaded 1 of 1620 libraries in 6,631ms (compile: 248 ms, reload: 1516 ms, reassemble: 4333 ms)."""),
  Item_data(product_Name:"product 2",
      bath: "images/logo.png",
      price: 14.88,
      description:
          """                "in this details you will see all data and show all widget in this details you will see all data and show all widgetin this details you will see all data and show all widgetin this details you will see all data and show all widgetin this details you will see all data and show all widgetin this details you will see all data and show all widgetin this details you will see all data and show all widget",
"""),
  Item_data(product_Name:"product 3",
      bath: "images/Screenshot_20230615-195537.png",
      price: 1000.88,
      description:
          """lib/store_app/brain/item.dart:8:12: Error: Too many positional arguments: 0 allowed, but 1 found.
Try removing the extra positional arguments.
  Item_data(bath: "images/enemy.png", price: 12.88,Performing hot reload
lib/store_app/brain/item.dart:4:3: Context: Found this candidate, but the arguments don't match.
Item_data({required this.bath, required this.price});
^^^^^^^^^""")
];

