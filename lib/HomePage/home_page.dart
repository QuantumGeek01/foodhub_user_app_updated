import 'package:flutter/material.dart';
import 'navbar.dart';
import 'Restaurants/restaurants.dart';
import 'search&filter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void snackBar(){
    const snackBar = SnackBar(
        content: Text('Your order is successful!'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    Box box = Hive.box('snackBar');

    box.get('isVisible') ?? false ? WidgetsBinding.instance.addPostFrameCallback((_) {
      snackBar();
      box.put('isVisible',false);
      setState(() {});
    }): null;

    return Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text('4 Sultangonj Rd',
                style: TextStyle(
                    fontFamily: "Lobster",
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w200)),
            centerTitle: true,
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.cyan, Colors.amber],
                        begin: FractionalOffset(0.0, 0.0),
                        end: FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp))),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder:(c)=>const SearchScreen()));
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 5),
                        Text('Search for foods & restaurants')
                      ],
                    ),
                  ),
                ),
              ),
            )),
        body:ListView(
          children:const [
            SizedBox(height: 10),
            Padding(
              padding:EdgeInsets.fromLTRB(10,10,0,0),
              child: Text("Restaurants you'll love",
              style:TextStyle(
                fontSize:23,
                fontWeight:FontWeight.bold
              )
              ),
            ),
            RestaurantsList()
          ],
        ));
  }
}
