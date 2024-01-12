import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
       padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Faysal Ahmed"),
            accountEmail: const Text("faysalahmedr@gamil.com"),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
              child: Image.network(
                'https://i.pinimg.com/originals/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg',
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            )),
              decoration:const BoxDecoration(
                  gradient:LinearGradient(
                      begin:Alignment.topRight,
                      end:Alignment.bottomLeft,
                      colors:[
                        Colors.amber,
                        Colors.cyan
                      ]
                  )
              )
          ),
          Padding(
            padding:const EdgeInsets.only(left:5),
            child:ListTile(
              onTap:(){
                Navigator.pop(context);
              },
              leading:const Icon(Icons.home),
              title:const Text('Home'),
              contentPadding:const EdgeInsets.all(5),
            ),
          ),
          const Padding(
            padding:EdgeInsets.only(left:5),
            child: ListTile(
              leading:Icon(Icons.food_bank),
              title:Text('My order'),
              contentPadding:EdgeInsets.all(5),
            ),
          ),
          const Padding(
            padding:EdgeInsets.only(left:5),
            child: ListTile(
              leading:Icon(Icons.person),
              title:Text('View profile'),
              contentPadding:EdgeInsets.all(5),
            ),
          ),
          const Padding(
            padding:EdgeInsets.only(left:5),
            child: ListTile(
              leading:Icon(Icons.history),
              title:Text('History-orders'),
              contentPadding:EdgeInsets.all(5),
            ),
          ),
          const Padding(
            padding:EdgeInsets.only(left:5),
            child: ListTile(
              leading:Icon(Icons.logout),
              title:Text('Logout'),
              contentPadding:EdgeInsets.all(5),
            ),
          ),
        ],
      ),
    );
  }
}
