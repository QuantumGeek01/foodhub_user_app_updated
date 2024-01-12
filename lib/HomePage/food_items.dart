import 'package:flutter/material.dart';

class FoodItemsScreen extends StatefulWidget {
  const FoodItemsScreen({Key? key}) : super(key: key);

  @override
  State<FoodItemsScreen> createState() => _FoodItemsScreenState();
}

class _FoodItemsScreenState extends State<FoodItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding:const EdgeInsets.only(left:5,right:5,top:10),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              elevation: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(
                      "https://img.freepik.com/free-photo/freshly-italian-pizza-with-mozzarella-cheese-slice-generative-ai_188544-12347.jpg",
                      height: 180,
                      fit: BoxFit.fill,
                    ),
                    const Center(child:Text('Pizza',
                    style:TextStyle(
                      fontSize:22,
                      fontWeight:FontWeight.bold
                    ))),
                    const Text('chicken cheese pizza',
                    style:TextStyle(
                      fontSize:17
                    ),),
                    const Text('Tk 450'),
                    const SizedBox(height:5)
                  ])),
          );
        });
  }
}
