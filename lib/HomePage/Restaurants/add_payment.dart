import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({Key? key}) : super(key: key);

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  final List <Map<String,String>> _paymentMethod =[
    {'img':'https://freelogopng.com/images/all_img/1656235223bkash-logo.png',
     'name':'bkash'
    },
    {'img':'https://seeklogo.com/images/D/dutch-bangla-rocket-logo-B4D1CC458D-seeklogo.com.png',
      'name':'Rocket'
    },
    {'img':'https://cdn-icons-png.flaticon.com/512/5132/5132194.png',
      'name':'Cash'
    },
    {'img':'https://play-lh.googleusercontent.com/Iks014Ul-atatMhWs8rLbtG7cIZLPfpeMDdkLtmq5o7D5_MlFNu5mmIqRHAY45aOhapp',
      'name':'Nagad'
    },
    {'img':'https://play-lh.googleusercontent.com/swNkirJ04el-aBXheIbYmBdmr2Z7QwI3HlFN1rSLPjqe_jAgJvYCH2h8nTNdl2R-C28=w240-h480-rw',
      'name':'1Card'
    }];
  late String _currentOption;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Box box =Hive.box('paymentMethod');
    _currentOption =box.get('name') ??_paymentMethod[2]['name'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Payment method',style:TextStyle(fontWeight:FontWeight.bold,fontSize:19)),
      ),
      body:ListView.builder(
          itemCount:_paymentMethod.length,
          itemBuilder:(context,index){
            return Padding(
              padding:const EdgeInsets.all(10),
              child: ListTile(
                leading:Image.network("${_paymentMethod[index]['img']}",width:50,height:50),
                title:Text('${_paymentMethod[index]['name']}',style:const TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
                trailing:Radio(value:'${_paymentMethod[index]['name']}', groupValue:_currentOption,
                    onChanged:(value){
                      setState(() {
                        Box box =Hive.box('paymentMethod');
                        box.put('name',_paymentMethod[index]['name'].toString());
                        box.put('img',_paymentMethod[index]['img'].toString());
                        //_currentOption = _paymentMethod[index]['name'].toString();
                        Navigator.pop(context);
                      });
                    })
              ),
            );
          })
    );
  }
}
