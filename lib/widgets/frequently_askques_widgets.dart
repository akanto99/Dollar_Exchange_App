import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class FreAskQuestions extends StatefulWidget {
  const FreAskQuestions({Key? key}) : super(key: key);

  @override
  _FreAskQuestionsState createState() => _FreAskQuestionsState();
}

class _FreAskQuestionsState extends State<FreAskQuestions> {
  bool isClicked = false;
  bool isClickedS = false;
  bool isClicked3 = false;
  bool isClicked4 = false;
  bool isClicked5 = false;

  final Stream<DocumentSnapshot> documentStream = FirebaseFirestore.instance
      .collection('final_collection')
      .doc('TIS')
      .snapshots();

  String? selected;
  List<String> questionList = []; // Store question titles

  void toggleExpansion(String id) {
    if (selected == id) {
      // If the same tile is clicked again, close it.
      setState(() {
        selected = null;
      });
    } else {
      // If a different tile is clicked, toggle it open and close the others.
      setState(() {
        selected = id;
      });
    }
  }

  Color facebookColor = Colors.black; // Default color
  Color instagramColor = Colors.black; // Default color
  Color youtubeColor = Colors.black; // Default color

  void selectSocialMedia(String platform, String url) async {
    setState(() {
      // Reset all colors to the default (grey) state
      facebookColor = Colors.black;
      instagramColor = Colors.black;
      youtubeColor = Colors.black;

      // Set the color of the selected platform to a different color (e.g., blue)
      if (platform == 'facebook') {
        facebookColor = Colors.blue;
      } else if (platform == 'instagram') {
        instagramColor = Colors.blue;
      } else if (platform == 'youtube') {
        youtubeColor = Colors.blue;
      }
    });

    await launch(url);
  }

  String _urlyou = 'https://youtube.com/channel/UCgmZ_vMLTxy6aZ-Jedt2Ecw';
  String _urlfb = 'https://youtube.com/channel/UCgmZ_vMLTxy6aZ-Jedt2Ecw';
  String _urlins = 'https://youtube.com/channel/UCgmZ_vMLTxy6aZ-Jedt2Ecw';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<DocumentSnapshot>(
        stream: documentStream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;
          final dataMap = data['data'] as Map<String, dynamic>;

          return Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Text("Frequently Asked Questions",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 20,),


                //Map Questions
              ...dataMap.entries.map((entry) {
                final id = entry.key;
                final item = entry.value;
                final question = item['question'];
                final description =
                    item['description'].toString().replaceAll("_n", "\n");

                questionList.add(question); // Add the title to the list

                return Column(
                  children: <Widget>[
                    CustomExpansionTile(
                      id: id,
                      selected: selected,
                      onExpansionChanged: toggleExpansion,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height:50,
                                width: MediaQuery.of(context).size.width-30,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    question,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_drop_down_outlined),
                            ],
                          ),
                          if (selected == id)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(description),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),


              SizedBox(height: 20,),
              Container(
                height: 300,
                color: Colors.lightBlue,
                width: 500,
                child: Image.asset("images/fa.png", fit: BoxFit.cover),
              ),

              //Footer Section

              Container(
                height: 700,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey.shade900,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Container(
                        height: 100,
                        width: 200,
                        child:
                            Image.asset('images/Denish.png', fit: BoxFit.cover),
                      ),
                      SizedBox(height: 10,),
                      Text(
                          "Unlike the banks, our focus is only on money transfer",style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => selectSocialMedia('facebook', _urlfb),
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: facebookColor,
                                border: Border.all(
                                  color: Colors.blue.shade300,
                                  width: 1
                                )
                              ),
                              child: Icon(
                                Icons.facebook,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),

                          SizedBox(width: 10,),

                          GestureDetector(
                            onTap: () =>
                                selectSocialMedia('instagram', _urlins),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: instagramColor,
                                  border: Border.all(
                                      color: Colors.blue.shade300,
                                      width: 1
                                  )
                              ),
                              child: Icon(
                                Icons.desktop_windows,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () => selectSocialMedia('youtube', _urlyou),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: instagramColor,
                                  border: Border.all(
                                      color: Colors.blue.shade300,
                                      width: 1
                                  )
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Quick Links",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 20,
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked = !isClicked; // Toggle the clicked state
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height:
                              isClicked ? 30 : 20, // Adjust the size as needed
                          width:
                              isClicked ? 80 : 50, // Adjust the size as needed
                          margin: isClicked
                              ? EdgeInsets.only(
                                  left: 20) // Shift a little to the right
                              : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: isClicked
                                ? Colors.white54
                                : null, // Change the color as needed
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //2nd home
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClickedS =
                                !isClickedS; // Toggle the clicked state
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height:
                              isClickedS ? 30 : 20, // Adjust the size as needed
                          width: isClickedS
                              ? 140
                              : 120, // Adjust the size as needed
                          margin: isClickedS
                              ? EdgeInsets.only(
                                  left: 20) // Shift a little to the right
                              : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: isClickedS
                                ? Colors.white54
                                : null, // Change the color as needed
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "How it is work",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //3rd
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked3 =
                                !isClicked3; // Toggle the clicked state
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height:
                              isClicked3 ? 30 : 20, // Adjust the size as needed
                          width: isClicked3
                              ? 140
                              : 120, // Adjust the size as needed
                          margin: isClicked3
                              ? EdgeInsets.only(
                                  left: 20) // Shift a little to the right
                              : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: isClicked3
                                ? Colors.white54
                                : null, // Change the color as needed
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Buy Currency",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //4th
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked4 =
                                !isClicked4; // Toggle the clicked state
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height:
                              isClicked4 ? 30 : 20, // Adjust the size as needed
                          width: isClicked4
                              ? 140
                              : 120, // Adjust the size as needed
                          margin: isClicked4
                              ? EdgeInsets.only(
                                  left: 20) // Shift a little to the right
                              : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: isClicked4
                                ? Colors.white54
                                : null, // Change the color as needed
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "About Us",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //5th
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isClicked5 =
                                !isClicked5; // Toggle the clicked state
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height:
                              isClicked5 ? 30 : 20, // Adjust the size as needed
                          width: isClicked5
                              ? 140
                              : 120, // Adjust the size as needed
                          margin: isClicked5
                              ? EdgeInsets.only(
                                  left: 20) // Shift a little to the right
                              : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: isClicked5
                                ? Colors.white54
                                : null, // Change the color as needed
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "How it is work",
                            style: TextStyle(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Contact Info",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                      SizedBox(
                        height: 20,
                      ),
                      FooterText("Email:daneshexchange@gmail.com"),
                      SizedBox(
                        height: 20,
                      ),
                      FooterText("phone: +0434 247 236"),
                      SizedBox(
                        height: 20,
                      ),
                      FooterText("Address:Shop 19, 236 lonsdale Street, Dandenong, Victoria Australia 3175"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                color: Colors.white54,
                child:
                    Text("Copyright @ 2023 DaneshExchange.All rights reserved"),
              )
            ],
          );
        },
      ),
    );
  }

  Widget FooterText(String text){
    return Text(
      text,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String id;
  final String? selected;
  final Function(String id) onExpansionChanged;
  final Widget title;

  CustomExpansionTile({
    required this.id,
    required this.selected,
    required this.onExpansionChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(

          onTap: () {
            onExpansionChanged(id);
          },
          child: title,
        ),
        Divider(height: 2,)
      ],
    );
  }
}
