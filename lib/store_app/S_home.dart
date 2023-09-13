import 'package:firebase_cat/store_app/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'S_checkout.dart';
import 'constants/S_colors.dart';
import 'brain/item.dart';
import 'S_details_screen.dart';
import 'S_resusable_widgets/S_app_bar.dart';



class S_Home extends StatefulWidget {
  static String id = "S_home";
  const S_Home({Key? key}) : super(key: key);

  @override
  State<S_Home> createState() => _S_HomeState();
}



class _S_HomeState extends State<S_Home> {


  @override
  Widget build(BuildContext context) {
    Cart_notifier theclass = Provider.of<Cart_notifier>(context, listen: true);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // row item count
            childAspectRatio: 3 / 2, // item height and
            crossAxisSpacing: 23,
            mainAxisSpacing: 33,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              // to let the screen clicked
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Details_S(product_Data: items[index])));



              },
              child: GridTile(
                footer: GridTileBar(
                  // backgroundColor: Color.fromARGB(66, 73, 127, 110),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      print("adding the item");
                      setState(() {


                        bool found_or_no = theclass.products_Oncard.contains(items[index]);

                        if (found_or_no){
                          print("the item already added");

                        }else{
                          theclass.products_Oncard.add(items[index]);
                        }
                      });
                    },

                  ),

                  leading: Text(items[index].price.toString(),style: const TextStyle(color: Colors.white),),
                  title: const Text(""),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -3,
                      bottom: -9,
                      right: 0,
                      left: 0,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                              color: Colors.grey,
                              child: Image.asset(items[index].bath))),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("images/logo.png"),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "images/Screenshot_20230615-195537.png"),
                          fit: BoxFit.cover),
                    ),
                    accountName: Text("ramez"),
                    accountEmail: Text("ramezmalak@gmail.com")),
                ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("My Products"),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const My_check_out()));
                  },
                ),
                ListTile(
                  title: const Text("About"),
                  leading: const Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Logout"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {},
                ),
              ],
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 12),
                child: const Text(
                  "Developed By Ramez Malak 2023",
                  style: TextStyle(fontSize: 15),
                )),
          ],
        ),
      ),
      appBar: AppBar(
        title:Text(theclass.myName),
        actions: const [
          Navigation_bar_component()
        ],
        backgroundColor: appbargreen,
      ),
    );
  }
}
