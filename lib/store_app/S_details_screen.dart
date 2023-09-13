// import 'package:firebase_cat/store_app/provider/cart.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'S_resusable_widgets/S_app_bar.dart';
import 'constants/S_colors.dart';
import 'brain/item.dart';

class Details_S extends StatefulWidget {
  static String id = "S_details";
  Item_data product_Data;
  Details_S({super.key, required this.product_Data});

  @override
  State<Details_S> createState() => _detailsState();
}

class _detailsState extends State<Details_S> {
  bool show_More = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('product details'),
          actions: const [
            Navigation_bar_component()
          ],
          backgroundColor: appbargreen,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(widget.product_Data.bath),

              const SizedBox(
                height: 11,
              ),
              Text(
                widget.product_Data.price.toString(),
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("New", style: TextStyle(fontSize: 15)),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.edit_location,
                        size: 26,
                        color: Color.fromARGB(168, 3, 65, 27),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      // Consumer<Cart_notifier>(builder: ((context, theclass,child){return Text("${theclass.myName}");}),),
                      Text(
                        "Flower shop",
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "details :",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Text(widget.product_Data.description,
                style: const TextStyle(fontSize: 16),
                maxLines: show_More ? 4 : null,
                overflow: TextOverflow.fade,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      // show_More = false;
                      // show_More = show_More == true ? false : true;
                      show_More = !show_More;// this is more professional in apposing the bool
                    });

                  },
                  child: Text(
                    show_More ? "show more": "show less",
                    style: const TextStyle(fontSize: 16),
                  )),
            ],
          ),
        ));
  }
}
