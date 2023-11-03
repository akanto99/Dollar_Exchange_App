import 'package:dollar_exchange_app/screens/home_screens.dart';
import 'package:dollar_exchange_app/screens/login_screen/login_screen.dart';
import 'package:dollar_exchange_app/screens/login_screen/register_screen.dart';
import 'package:flutter/material.dart';

class DrawerDenish extends StatefulWidget {
  const DrawerDenish({super.key});

  @override
  State<DrawerDenish> createState() => _DrawerDenishState();
}

class _DrawerDenishState extends State<DrawerDenish> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      child: ListView(children: [

       Container(
         height: 100,
         width: 120,
         child: Image.asset("images/Denish.png"),
       ),

       SizedBox(height: 20,),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            }, child: Text("Home",style: TextStyle(color: Colors.white),),),
            TextButton(onPressed: (){}, child: Text("Exchange Rate",style: TextStyle(color: Colors.white),),),
            TextButton(onPressed: (){}, child: Text("About Us",style: TextStyle(color: Colors.white),),),
            TextButton(onPressed: (){}, child: Text("Contact Us",style: TextStyle(color: Colors.white),),),
          ],
        ),
      ),

       Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           InkWell(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>BuyerRegisterScreen()));
             },
             child: Container(
               height: 40,
               width: 100,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(5),
                 color: Colors.white70,
               ),
               child: Center(child: Text("Register")),
             ),
           ),
           Container(
             height: 40,
             width: 100,
             child: ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => LoginScreen()));
                 },
                 child: Text(
                   'Login',
                 )),
           )
         ],
       )
      ]),
    );
  }
}
