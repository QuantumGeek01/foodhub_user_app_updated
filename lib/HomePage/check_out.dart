import 'package:flutter/material.dart';
import 'Restaurants/add_payment.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_page.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final TextEditingController _apartmentName = TextEditingController();
  final TextEditingController _optionalInfo = TextEditingController();
  final Map<String, String> _paymentMethod = {};

  void paymentMethod(){
    setState(() {
      Box box = Hive.box('paymentMethod');
      _paymentMethod['name'] = box.get('name') ?? 'Cash';
      _paymentMethod['img'] = box.get('img') ??
          'https://cdn-icons-png.flaticon.com/512/5132/5132194.png';
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentMethod();
  }

  @override
  Widget build(BuildContext context) {
    final isVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        appBar: AppBar(
            title: const ListTile(
          title: Text('Checkout',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
          subtitle: Text('Food Corner'),
        )),
        floatingActionButton: Visibility(
          visible: !isVisible,
          child: Container(
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
                    offset: Offset(5,
                        5), // The offset determines the position of the shadow
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
                child: Column(children: [
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Text('Total',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    trailing: Text('Tk 903',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,MaterialPageRoute(builder:(c)=>const HomeScreen()));
                          Box box = Hive.box('snackBar');
                          box.put('isVisible',true);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Place Order',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ))),
                  ),
                ]),
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.amber,
                    size: 28,
                  ),
                  Text('Delivery address',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _apartmentName,
                decoration: const InputDecoration(
                    label: Text('Apartment name'),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const Text('Delivery instructions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
              const Text('Please give us more information about your address',
                  style: TextStyle(fontSize: 15)),
              const SizedBox(height: 10),
              TextField(
                controller: _optionalInfo,
                decoration: const InputDecoration(
                    label: Text('(Optional) Floor or Apt No'),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 30),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.white,
                  elevation: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        leading: const Icon(Icons.payment, color: Colors.amber),
                        title: const Text('Payment method',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        trailing: InkWell(
                            onTap: () async {
                              Navigator.push(context, MaterialPageRoute(builder: (c) => const AddPayment())).
                              then((value){
                               paymentMethod();
                              });
                            },
                            child: const Icon(Icons.edit, color: Colors.amber)),
                        tileColor: Colors.white,
                      ),
                      ListTile(
                        visualDensity:
                            const VisualDensity(horizontal: 0, vertical: -4),
                        leading: Image.network('${_paymentMethod['img']}',
                            width: 30, height: 30),
                        title: Text('${_paymentMethod['name']}',
                            style: const TextStyle(fontSize: 19)),
                        trailing: const Text('Tk 903',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                        tileColor: Colors.white,
                      )
                    ],
                  )), // payment method
              const SizedBox(height: 20),
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Colors.white,
                  elevation: 2,
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: Icon(Icons.speaker_notes, color: Colors.amber),
                        title: Text('Order summary',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        tileColor: Colors.white,
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: Text('1x',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.normal)),
                        title: Text('Pizza', style: TextStyle(fontSize: 19)),
                        trailing: Text('Tk 320',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                        tileColor: Colors.white,
                      ), // order summary
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: Text('1x',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.normal)),
                        title:
                            Text('Beef Burger', style: TextStyle(fontSize: 19)),
                        trailing: Text('Tk 250',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                        tileColor: Colors.white,
                      ), // order summary
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: Text('1x',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.normal)),
                        title:
                            Text('Corn soup', style: TextStyle(fontSize: 19)),
                        trailing: Text('Tk 320',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                        tileColor: Colors.white,
                      ), // order summary
                      Divider(height: 2),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: Text('Subtotal',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.normal)),
                        trailing: Text('Tk 890',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                        tileColor: Colors.white,
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Delivery fee',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal)),
                            SizedBox(width: 5),
                            Icon(
                              Icons.info_outline,
                              size: 25,
                            )
                          ],
                        ),
                        trailing: Text('Tk 10',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                        tileColor: Colors.white,
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Platform fee',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal)),
                            SizedBox(width: 5),
                            Icon(
                              Icons.info_outline,
                              size: 25,
                            )
                          ],
                        ),
                        trailing: Text('Tk 3',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal)),
                        tileColor: Colors.white,
                      ),
                      SizedBox(height: 130)
                    ],
                  ))
            ],
          ),
        ));
  }
}
