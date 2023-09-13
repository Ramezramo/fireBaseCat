import 'package:firebase_cat/store_app/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'S_resusable_widgets/S_app_bar.dart';
// import 'brain/item.dart';
import 'constants/S_colors.dart';


class My_check_out extends StatefulWidget {
  const My_check_out({Key? key}) : super(key: key);
  static String id = "S_check_out_screen";

  @override
  State<My_check_out> createState() => _My_check_outState();
}

class _My_check_outState extends State<My_check_out> {
  @override
  Widget build(BuildContext context) {
    Cart_notifier theclass = Provider.of<Cart_notifier>(context, listen: false);
    double prices_incart(){
      double wholePrice = 0;
      for (var price in theclass.products_Oncard) {
        wholePrice += price.price;
      }
      return wholePrice;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("check out"),
        backgroundColor: appbargreen,
        actions: const [Navigation_bar_component()],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 400,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: theclass.products_Oncard.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(

                      child: ListTile(
                        subtitle: Text(theclass.products_Oncard[index].price.toString()),
                        leading: CircleAvatar(backgroundImage: AssetImage(theclass.products_Oncard[index].bath),),
                        title: Text(theclass.products_Oncard[index].product_Name),
                        trailing: IconButton(
                          onPressed: (){
                            setState(() {
                              theclass.delete(index);
                            });



                          },
                          icon: const Icon(Icons.remove),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          ElevatedButton(onPressed: (){},style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(BTNpink),
              padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)))
          ), child: Text("pay \$${prices_incart()}"),)
        ],
      ),
    );
  }
}


//
// class My_check_out extends StatefulWidget {
//   const My_check_out({Key? key}) : super(key: key);
//
//
//   @override
//
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
//
//
// }
