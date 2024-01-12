import 'package:flutter/material.dart';
import 'check_out.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Cart',
                style: TextStyle(fontWeight: FontWeight.bold))),
        floatingActionButton: Container(
            alignment: Alignment.center,
            height: 130,
            width: double.infinity,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius:
                      10, // The higher the blur radius, the more blurred the shadow
                  spreadRadius:
                      1, // The higher the spread radius, the more expanded the shadow
                  offset: Offset(
                      5, 5), // The offset determines the position of the shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children:[
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Text('Total',
                        style:
                        TextStyle(fontSize:19, fontWeight: FontWeight.bold)),
                    trailing: Text('Tk 903',
                        style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                  const Spacer(),
                  SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder:(c)=>const CheckOutScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text('Review Payment and address',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ))),
                ),]
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const Text('Selected Items',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
              const SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  color: Colors.grey.shade100,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove, color: Colors.red)),
                      const Text('1',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: Colors.green)),
                      Image.network(
                          "https://beyond-meat-cms-production.s3.us-west-2.amazonaws.com/1026c2af-dc2f-4688-bf53-0f33d6070851.jpeg",
                          width: 70,
                          height: 70),
                      const SizedBox(width: 10),
                      const SizedBox(
                        width: 120,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child:Text('Pizza',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      const Text('TK 320', style: TextStyle(fontSize: 15))
                    ],
                  )),
              const SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  color: Colors.grey.shade100,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove, color: Colors.red)),
                      const Text('1',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: Colors.green)),
                      Image.network(
                          "https://www.certifiedirishangus.ie/wp-content/uploads/2019/11/TheUltimateBurgerwBacon_RecipePic.jpg",
                          width: 70,
                          height: 70),
                      const SizedBox(width: 10),
                      const SizedBox(
                        width: 120,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child:Text('Beef Burger',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      const Text('TK 250', style: TextStyle(fontSize: 15))
                    ],
                  )),
              const SizedBox(height: 10),
              Container(
                  width: double.infinity,
                  color: Colors.grey.shade100,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove, color: Colors.red)),
                      const Text('1',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: Colors.green)),
                      Image.network(
                          "https://static.toiimg.com/thumb/88198991.cms?imgsize=38134&width=800&height=800",
                          width: 70,
                          height: 70),
                      const SizedBox(width: 10),
                      const SizedBox(
                        width: 120,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child:Text('Corn soup',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      const Text('TK 320', style: TextStyle(fontSize: 15))
                    ],
                  )),
              const SizedBox(height: 30),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text('Subtotal',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                trailing: Text('Tk 890',
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Delivery fee', style: TextStyle(fontSize: 19)),
                    SizedBox(width: 5),
                    Icon(
                      Icons.info_outline,
                      size: 25,
                    )
                  ],
                ),
                trailing: Text('Tk 10', style: TextStyle(fontSize: 19)),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Platform fee', style: TextStyle(fontSize: 19)),
                    SizedBox(width: 5),
                    Icon(
                      Icons.info_outline,
                      size: 25,
                    )
                  ],
                ),
                trailing: Text('Tk 3', style: TextStyle(fontSize: 19)),
              ),
              const SizedBox(height:130)
            ],
          ),
        ));
  }
}
