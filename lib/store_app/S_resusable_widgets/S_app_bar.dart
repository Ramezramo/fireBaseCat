
import 'package:firebase_cat/store_app/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../S_checkout.dart';

class Navigation_bar_component extends StatefulWidget {
  const Navigation_bar_component({Key? key}) : super(key: key);

  @override
  State<Navigation_bar_component> createState() => _Navigation_bar_componentState();
}

class _Navigation_bar_componentState extends State<Navigation_bar_component> {



  @override
  Widget build(BuildContext context) {
    Cart_notifier theclass = Provider.of<Cart_notifier>(context, listen: true);
    double prices_incart(){
      double whole_price = 0;
      for (var price in theclass.products_Oncard) {
        whole_price += price.price;
      }
      return whole_price;
    }
    return Row(
      children: [
        Stack(
          children: [
            Container(
              child: Text(
                theclass.products_Oncard.length.toString(),
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color.fromARGB(211, 164, 255, 193),
                  shape: BoxShape.circle),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => My_check_out()));
                }, icon: Icon(Icons.add_shopping_cart)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 13.0),
          child: Text(
            "\$ ${prices_incart().round()}",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
//
// class Navigation_Bar_components extends StatelessWidget {
//   const Navigation_Bar_components({
//     super.key,
//     required this.theclass,
//   });
//
//
// }
