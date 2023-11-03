

import 'package:flutter/material.dart';


class DialogUtils {
 static void showBankSelectionDialog(BuildContext context) {
  showDialog(
   context: context,
   builder: (BuildContext context) {
    return AlertDialog(
     backgroundColor: Colors.red, // Set the background color
     contentPadding: EdgeInsets.all(0), // Remove padding around the content

     // You can set the height and width using the content constraints
     content: Container(
      height: 50, // Set the height
      width: 300,  // Set the width
      child: InkWell(
       onTap: () {},
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         Text("Bank Transfer"),
         Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
           shape: BoxShape.circle,
           border: Border.all(color: Colors.black, width: 2), // Black border
           color: Colors.black, // Black background
          ),
          child: Center(
           child: Container(
            decoration: BoxDecoration(
             shape: BoxShape.circle,
             border: Border.all(color: Colors.white70, width: 2), // White border
             color: Colors.white, // White center
            ),
            child: Center(
             child: Container(
              decoration: BoxDecoration(
               shape: BoxShape.circle,
               border: Border.all(color: Colors.blue, width: 2), // Blue border
               color: Colors.blue, // Blue center
              ),
             ),
            ),
           ),
          ),
         ),
        ],
       ),
      ),
     ),
    );
   },
  );
 }
}
