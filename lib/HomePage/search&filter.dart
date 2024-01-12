import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool searchOn=false;
  final TextEditingController _controller = TextEditingController();
  final Set<String>showResult={};
  //final Set<Map<String,dynamic>>showSearchResult={};
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id":1,
      "image":
      "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
      "Title":"Pizza",
      "ShoneName": "American Burger",
      "Price":450
    },
    {
      "id":2,
      "image":
      "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
      "Title":"Pizza",
      "ShoneName": "Food corner",
      "Price":350
    },
    {
      "id":3,
      "image":
      "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
      "Title":"Burger",
      "ShoneName": "American Burger",
      "Price":250
    },
    {
      "id": 4,
      "image":
      "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
      "Title":"Burger",
      "ShoneName": "Food corner",
      "Price":250
    },
    {
      "id": 5,
      "image":
      "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
      "Title":"Chili Chicken",
      "ShoneName": "American Burger",
      "Price":80
    },
    {
      "id": 6,
      "image":
      "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
      "Title":"Fried rice",
      "ShoneName": "American Burger",
      "Price":100
    },
    {
      "id": 7,
      "image":
      "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
      "Title":"Fried Chicken",
      "ShoneName": "Food corner",
      "Price":80
    },
  ];


  void _runFilter(String enteredKeyword) {
    List<Map<String,dynamic>>results =[];
    showResult.clear();
    if (enteredKeyword.trim().isNotEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers
          .where((user) =>
          user["Title"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      if(results.isNotEmpty)
      {
        for(var i in results) {
          showResult.add(i["Title"]);
        }
      }
      results = _allUsers
          .where((user) =>
          user["ShoneName"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      if(results.isNotEmpty)
      {
        for(var i in results) {
          showResult.add(i["ShoneName"]);
        }
      }
      // Refresh the UI
      setState((){});
    }
  }
  //void _serchResults(String value){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight:70,
          title:SizedBox(
            height:50,
            child: TextField(
              onChanged:(value) => _runFilter(value),
              controller:_controller,
              textInputAction:TextInputAction.search,
              onSubmitted:(value){
                print('value is $value');
              },
              decoration: InputDecoration(
                prefixIcon:const Icon(Icons.search),
                hintText:'Search for foods & restaurants',
                fillColor:Colors.grey.shade100,
                  filled:true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20.0),
                    borderSide:BorderSide(color:Colors.grey.shade100)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20.0),
                      borderSide:BorderSide(color:Colors.grey.shade100)
                  )
              ),
            ),
          ),
        ),
        body:ListView.builder(
               itemCount: showResult.length,
               itemBuilder: (context, index) {
                  return ListTile(
                    onTap:(){
                      setState(() {
                        _controller.text=showResult.elementAt(index);
                      });
                    },
                    leading:const Icon(Icons.search),
                    title:Text(showResult.elementAt(index))
                  );
               }
        )
    );
  }
}
