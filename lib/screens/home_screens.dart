import 'package:dollar_exchange_app/screens/drawer_danish_screen.dart';
import 'package:dollar_exchange_app/screens/login_screen/account_screen.dart';
import 'package:dollar_exchange_app/screens/login_screen/login_screen.dart';
import 'package:dollar_exchange_app/widgets/after_animCon_widgets.dart';
import 'package:dollar_exchange_app/widgets/all_countries_widgets.dart';
import 'package:dollar_exchange_app/widgets/animated_container_widgets.dart';
import 'package:dollar_exchange_app/widgets/carousel_widgets.dart';
import 'package:dollar_exchange_app/widgets/compare_widgets.dart';
import 'package:dollar_exchange_app/widgets/currency_converter_widgets.dart';
import 'package:dollar_exchange_app/widgets/frequently_askques_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool containerClicked = false;
  bool containerClicked2 = false;
  String _urlyou = 'https://youtube.com/channel/UCgmZ_vMLTxy6aZ-Jedt2Ecw';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dollar Exchange"),

            //Acount Button
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountScreen()));
            }, icon: Icon(Icons.people_rounded))
          ],
        ),
      ),
      drawer: DrawerDenish(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 700,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(143, 148, 251, 40),
                      child: Column(
                        children: [
                          MainText('Send Money in a fast,\nconvenient and safe Way',Colors.white),

                          SizedBox(
                            height: 10,
                          ),

                          BodyText(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit'
                              ' Nulla facilisi. Sed nec eleifend quam.'
                              'Quisque posuere quam in nunc sollicitudin, non dapibus elit scelerisque.',Colors.white),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                            },
                            child: Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white
                              ),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  BodyText('Click Me', Color.fromRGBO(143, 148, 251, 1)),
                                  Icon(Icons.arrow_forward,color: Color.fromRGBO(143, 148, 251, 1),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.handshake_outlined,color: Colors.white70,),
                              normalText("Low fess",Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.add_box_outlined,color: Colors.white70,),
                              normalText("Trusted Service",Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.hourglass_top,color: Colors.white70,),
                              normalText("Top Rated company",Colors.white),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white10,
                    ),
                  ],
                ),
                Positioned(
                  right: 5,
                  top: 300,
                  child: CurrencyConverter(),
                )
              ],
            ),

            //Populer Countries
            Container(
              color: Color.fromRGBO(143, 148, 251, 40),
              height: 800,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Populer Countries",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),


                  SizedBox(
                    height: 30,
                  ),
              Container(
              height: 150,
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: containerClicked ? Color.fromRGBO(143, 148, 251, 1) : Colors.white, // Change color when clicked
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1, 1),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  // Toggle the containerClicked variable when the container is clicked
                  setState(() {
                    containerClicked = !containerClicked;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Container(
                            height: 40,
                            width: 80,
                            child: Image.network(
                              "https://cdn.pixabay.com/photo/2016/10/04/19/11/pakistan-1715201_1280.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          containerClicked ? "Clicked" : "Pakistan", // Change text when clicked
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 80,
                      color: containerClicked ?Colors.white:Colors.lightBlue.shade300,
                      child: Center(
                        child: Text(
                          "1 AUD = 153.0483 PKR",
                          style: TextStyle(color:containerClicked ? Color.fromRGBO(143, 148, 251, 1):Colors.white,),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 80,
                      child: Center(child: Text( "Send Money Securely On Online", style: TextStyle(fontSize: 16,color:containerClicked ? Colors.black:Colors.blue,fontWeight: FontWeight.w500))),
                    ),
                  ],
                ),
              ),
            ),


                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: containerClicked2 ? Color.fromRGBO(143, 148, 251, 1) : Colors.white, // Change color when clicked
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Toggle the containerClicked variable when the container is clicked
                        setState(() {
                          containerClicked2 = !containerClicked2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Container(
                                  height: 40,
                                  width: 80,
                                  child:Image.asset("images/india.jpg",fit: BoxFit.cover,)),
                              ),
                              SizedBox(width: 20),
                              Text(
                                containerClicked2 ? "Clicked" : "India", // Change text when clicked
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 80,
                            color: containerClicked2 ?Colors.white:Colors.lightBlue.shade300,
                            child: Center(
                              child: Text(
                                    "1 AUD = 54.0483 INR",
                                style: TextStyle(color:containerClicked2 ? Color.fromRGBO(143, 148, 251, 1):Colors.white,),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 80,
                            child: Center(child: Text( "Send Money Securely On Online", style: TextStyle(fontSize: 16,color:containerClicked2 ? Colors.black:Colors.blue,fontWeight: FontWeight.w500))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1,1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(left:20),
                              child: Container(
                                height: 40,
                                width: 80,
                                child: Image.asset("images/phili.jpg",fit: BoxFit.cover,)),
                            ),
                            SizedBox(width: 20,),
                            Text("Philippiines",style: TextStyle(fontSize: 16,),),
                          ],
                        ),
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 80,
                            color: Colors.lightBlue.shade300,
                            child:Center(
                              child: Text("1 AUD = 38.8069 PHP",style: TextStyle(color: Colors.white),),
                            )
                        ),

                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 80,
                            child:TextButton(
                              onPressed: (){},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Send Money",style: TextStyle(fontSize: 16,),),
                                  Icon(Icons.arrow_forward)
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width - 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1,1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:EdgeInsets.only(left:20),
                              child: Container(
                                height: 40,
                                width: 80,
                                child: Image.asset("images/thai.jpg",fit: BoxFit.cover,)),
                            ),
                            SizedBox(width: 20,),
                            Text("Thailand",style: TextStyle(fontSize: 16,),),
                          ],
                        ),

                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 80,
                            color: Colors.lightBlue.shade300,
                            child:Center(
                              child: Text("1 AUD = 25.1172 THB",style: TextStyle(color: Colors.white),),
                            )
                        ),

                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width - 80,
                            child:TextButton(
                              onPressed: (){},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Send Money",style: TextStyle(fontSize: 16,),),
                                  Icon(Icons.arrow_forward)
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //Compare us with other Providers
            CompareDollar(),


            CarouselWidgets(),


            //Animated Container-1
            MyHomePage(),

            //After Animated Container

            AfterAnimatedContainer(),


            //CountrySelection
            CountrySelectionScreen(),


            //Rating & Reviews
            Container(
              height: 600,
              width: MediaQuery.of(context).size.width,
              color:Color.fromRGBO(143, 148, 251, 40),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text("Ratings & Reviews",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20,),
                  Text(
                      "Check out our Rating on Trustpilot and other Platform" ,style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                  )),


                  SizedBox(height: 20,),
                  InkWell(
                    onTap: _launchURLyou,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Half of the height for a circular shape
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey, // Add a border color
                          width: 2, // Adjust the border width
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0, 3), // Offset of the shadow
                          ),
                        ],
                      ),
                      child: Image.asset("images/Trustpilot.png"),
                    ),
                  ),



                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: _launchURLyou,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Half of the height for a circular shape
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey, // Add a border color
                          width: 2, // Adjust the border width
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0, 3), // Offset of the shadow
                          ),
                        ],
                      ),
                      child: Image.asset("images/Facebook.png"),
                    ),
                  ),


                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: _launchURLyou,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          "images/Goo1.png",
                        ),
                      ),
                    ),
                  ),




                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: _launchURLyou,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Half of the height for a circular shape
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey, // Add a border color
                          width: 2, // Adjust the border width
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 5, // Spread radius
                            blurRadius: 7, // Blur radius
                            offset: Offset(0, 3), // Offset of the shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset("images/pro1.png",),
                      ),
                    ),
                  ),



                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            Container(
              // height: 1000,
                width: 600,
                child: FreAskQuestions()),

          ],
        ),
      ),
    );
  }

  void _launchURLyou() async {
    if (!await launch(_urlyou)) throw 'Couldnot launch $_urlyou';
  }

  Widget MainText(String text,Color color){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 26, // Adjust the font size as needed
          fontWeight: FontWeight.bold, // Adjust the font weight as needed
          // You can add more text styling properties here
        ),
      ),
    );
  }
  Widget BodyText(String text,Color color){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 16,
        ),
      ),
    );
  }
  Widget normalText(String text,Color color){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 14, // Adjust the font size as needed
          fontWeight: FontWeight.normal, // Adjust the font weight as needed
          // You can add more text styling properties here
        ),
      ),
    );
  }
}
