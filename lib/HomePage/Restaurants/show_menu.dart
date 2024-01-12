import 'package:flutter/material.dart';
import '../cart.dart';

class ShowMenuScreen extends StatefulWidget {
  const ShowMenuScreen({Key? key}) : super(key: key);

  @override
  State<ShowMenuScreen> createState() => _ShowMenuScreenState();
}

class _ShowMenuScreenState extends State<ShowMenuScreen> {
  final List<Map<String,dynamic>> _allRestaurants = [
    {
      "id":1,
      "name":"Pizza",
      "description":"Sausage, Mushroom, Spice.",
      "price":320,
      "image":
      "https://beyond-meat-cms-production.s3.us-west-2.amazonaws.com/1026c2af-dc2f-4688-bf53-0f33d6070851.jpeg",
    },
    {
      "id":2,
      "name":"Beef Burger",
      "description":"Prepared with 1x single beef patty,secret sauce.",
      "price":250,
      "image":
      "https://www.certifiedirishangus.ie/wp-content/uploads/2019/11/TheUltimateBurgerwBacon_RecipePic.jpg",
    },
    {
      "id":3,
      "name":"Crispy Chicken",
      "description":"Prepared with boneless chicken, breasts, lemon juice & egg",
      "price":80,
      "image":
      "https://www.tbsnews.net/sites/default/files/styles/big_2/public/images/2021/10/22/fried_chicken-1024x536.png",
    },
    {
      "id":4,
      "name":"Corn Soup",
      "description":"Healthy soup simmered with special ingredients, corn & mild spices.",
      "price":130,
      "image":
      "https://static.toiimg.com/thumb/88198991.cms?imgsize=38134&width=800&height=800",
    },
    {
      "id":5,
      "name":"Chicken Chowmein",
      "description":"A classic chinese stir-fry dish with \nshredded chicken & veggies",
      "price":210,
      "image":
      "https://hintofhelen.com/wp-content/uploads/2021/01/Actifry-Chicken-Chow-Mein-Recipe-Hint-of-Helen-2-e1610378434717-735x678.jpg",
    }
  ];
  final List<Map<String,dynamic>> _carItems=[];
  int count=0;
  num price=0;

  void addToCart(Map<String,dynamic>index){
    _carItems.add(index);
    count++;
    price=price+index["price"];
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:const Text("Food Corner",
          style: TextStyle(
              fontFamily: "Lobster",
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.w200),
      ),
          centerTitle: true,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.cyan, Colors.amber],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp)))
      ),
      floatingActionButton:Container(
        alignment:Alignment.center,
        height:100,
        width:double.infinity,
        decoration:const BoxDecoration(
          shape:BoxShape.rectangle,
          boxShadow:[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10, // The higher the blur radius, the more blurred the shadow
              spreadRadius:3, // The higher the spread radius, the more expanded the shadow
              offset: Offset(5, 5), // The offset determines the position of the shadow
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(16),
            topRight:Radius.circular(16),
          ),
          color:Colors.white,
        ),
        child:Padding(
          padding:const EdgeInsets.all(10),
          child: SizedBox(
            width:double.infinity,
            height:60,
            child: ElevatedButton(
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder:(c)=>CartScreen()));
              },
              style:ElevatedButton.styleFrom(
                backgroundColor:Colors.amber,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(10)
                )
              ),
              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text("$count",
                  style:const TextStyle(
                    fontSize:19,
                    color:Colors.white,
                  )),
                  const Text('View to cart',
                        style:TextStyle(
                          fontSize:20,
                          color:Colors.white,
                        )),
                  Text('Tk $price',
                      style:const TextStyle(
                        fontSize:19,
                        color:Colors.white,
                      ))
                ],
              ),
            ),
          ),
        )
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      body:ListView.builder(
        itemCount:_allRestaurants.length,
        itemBuilder:(context,index){
          return Padding(
            padding:const EdgeInsets.all(10),
            child: SizedBox(
              height:130,
              child: Card(
                elevation:5.0,
                shadowColor:Colors.black,
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize:MainAxisSize.min,
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text(_allRestaurants[index]["name"],
                           style:const TextStyle(
                               fontSize:20,
                               fontWeight:FontWeight.bold)),
                          SizedBox(
                              height:50,
                              width:230,
                              child: Text(_allRestaurants[index]["description"],)),
                          Text("Tk ${_allRestaurants[index]["price"]}",
                              style:const TextStyle(
                                fontWeight:FontWeight.bold
                              ))
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        const SizedBox(
                          width:100,
                          height:double.infinity,
                        ),
                        Center(
                          child: Image.network(_allRestaurants[index]["image"],
                              width:70, height:70),
                        ),
                        Positioned(
                          top:50,
                          left:45,
                          child:IconButton(
                            onPressed:(){
                              addToCart(_allRestaurants[index]);
                            },
                            color:Colors.white,
                            icon:const Icon(Icons.add,),
                            style:IconButton.styleFrom(
                              backgroundColor:Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ),
          );
        }
    )
    );
  }
}
