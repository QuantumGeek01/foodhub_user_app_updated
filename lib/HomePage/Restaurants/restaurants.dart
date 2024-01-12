import 'package:flutter/material.dart';
import 'show_menu.dart';

class RestaurantsList extends StatefulWidget {
  const RestaurantsList({Key? key}) : super(key: key);

  @override
  State<RestaurantsList> createState() => _RestaurantsListState();
}

class _RestaurantsListState extends State<RestaurantsList> {
  final List<Map<String,dynamic>> _allRestaurants = [
    {
      "id":1,
      "name":"Big Burger",
      "image":
      "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/277655844/original/3a050072606f0f0f95d8d6a21723e62b8f51bea5/do-burgar-logo-specially-for-brand-with-any-copyrights.jpg",
    },
    {
      "id":2,
      "name":"Food Corner",
      "image":
      "https://t3.ftcdn.net/jpg/02/41/30/72/360_F_241307210_MjjaJC3SJy2zJZ6B7bKGMRsKQbdwRSze.jpg",
    },
    {
      "id":3,
      "name":"Cafe Ajmir",
      "image":
      "https://static.vecteezy.com/system/resources/thumbnails/002/412/377/small/coffee-cup-logo-coffee-shop-icon-design-free-vector.jpg",
    },
    {
      "id":4,
      "name":"Pizza point",
      "image":
      "https://img.freepik.com/premium-vector/pizza-logo-vector_25327-119.jpg",
    },
    {
      "id":5,
      "name":"Testy Fast-Food",
      "image":
      "https://img.freepik.com/free-vector/restaurant-tasty-food-logo-design_460848-10307.jpg",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: _allRestaurants.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:const EdgeInsets.only(left:5,right:5,top:10),
            child: InkWell(
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder:(c)=>const ShowMenuScreen()));
              },
              child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  elevation: 5,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          _allRestaurants[index]["image"],
                          height: 180,
                          fit: BoxFit.fill,
                        ),
                        Center(child:Text(_allRestaurants[index]["name"],
                            style:const TextStyle(
                                fontSize:22,
                                fontWeight:FontWeight.bold
                            ))),
                        const SizedBox(height:5)
                      ])),
            ),
          );
        });
  }
}
