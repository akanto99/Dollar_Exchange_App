

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dollar_exchange_app/screens/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';




class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('buyers');


  void _logoutUser() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('showHome');

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text('Profile',
                style: GoogleFonts.libreBaskerville(
                    textStyle: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan
                    )
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                SizedBox(height: 25,),
                Center(
                  child: CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.cyan,
                    backgroundImage: NetworkImage(data['profileImage']),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(data['fullName'],
                    style: GoogleFonts.bebasNeue(
                        textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 5
                            //color: Colors.cyan
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(data['email'],
                    style: GoogleFonts.libreBaskerville (
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey.shade200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: ListTile(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage()));
                    },
                    leading: Icon(Icons.settings),
                    title: Text('SETTINGS'),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('PHONE'),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('CART'),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: ListTile(
                    onTap: _logoutUser,

                    leading: Icon(Icons.logout_rounded),
                    title: Text('LOGOUT'),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: ListTile(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
                    },
                    leading: Icon(Icons.keyboard_command_key_sharp),
                    title: Text('ABOUT US'),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return Center(
          child: Container(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}



getShowHomw() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool showHome = preferences.getBool('showHome') ?? false;
  return showHome;
}