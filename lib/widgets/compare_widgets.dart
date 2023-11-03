

import 'package:dollar_exchange_app/model/dollar_model.dart';
import 'package:dollar_exchange_app/widgets/bank_widgets.dart';
import 'package:flutter/material.dart';


class CompareDollar extends StatefulWidget {
  const CompareDollar({super.key});

  @override
  State<CompareDollar> createState() => _CompareDollarState();
}

class _CompareDollarState extends State<CompareDollar> {
  String selectedCountry = "TZS";
  String selectedService = 'Bank Transfer';
  double finalRate = 0.0;
  double fees = 3.00;
  double inputNumber = 0.0;

  TextEditingController inputController = TextEditingController();

  String result = "0.00"; // Initialize result with 0.00

  // This function will update the selected country and its details
  void updateSelectedCountry(String code) {
    setState(() {
      // Reset the input data and result
      inputController.clear();
      inputNumber = 0.0;
      result = "0.00";

      selectedCountry = code;

      // Find the corresponding country object in the countryList
      Country selectedCountryObject = countryList.firstWhere(
            (country) => country.code == selectedCountry,
      );

      // Update the final rate and any other details you need
      finalRate = selectedCountryObject.currencyDetails
          .firstWhere((details) => details.serviceName == selectedService)
          .finalRate;
    });
  }


  void compareDollar() {
    // Get the input number from the controller
    inputNumber = double.tryParse(inputController.text) ?? 0.0;

    double amount = inputNumber * finalRate * 5;
    setState(() {
      // Update the result
      result = amount.toStringAsFixed(2);
    });
  }

  void resetData() {
    setState(() {
      inputController.clear();
      inputNumber = 0.0;
      result = "0.00";
    });
  }

  Widget _Header(String image, int flex,String name) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 80,
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 70,
              child: Image.asset(image),
            ),
            Text(name,style: TextStyle(color: Colors.deepPurple),)
          ],
        ),
      ),
    );
  }

  Widget _rowHeader(String text, int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        height: 70,
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  final List<Map<String, String>> userData = [
    {
      'fullName': 'John Doe',
      'email': 'john@example.com',
      'address': '123 Main St',
      'phoneNumber': '555-1234',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Compare us with other Providers",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(
             height: 30,
          ),

          // 1st Container

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200, // You can adjust the width as needed
                height: 40, // You can adjust the height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black38, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Container (
                      height: 30,
                      width: 50,
                      child:  Image.network("https://remit.daneshexchange.com/assets/uploads/country/632bd789423571663817609.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:
                          10.0), // Add padding for spacing
                      child: Text(
                        'AUD',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.currency_exchange),
              Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black38,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  width: 200,
                  child: Center(
                    child: DropdownButton<String>(
                      value: selectedCountry,
                      items: countryList
                          .map((country) => DropdownMenuItem<String>(
                        value: country.code,
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 30,
                              child: Image.network(country.image),
                            ),
                            SizedBox(width: 10),
                            Text(country.code,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ))
                          .toList(),
                      onChanged: (String? value) {
                        if (value != null) {
                          updateSelectedCountry(value);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
      SizedBox(
        height: 10,),
             Text("Amount",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 10,),
          // 2nd Container
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 200,
                child: TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                    labelText: 'Input',
                    labelStyle: TextStyle(color:Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        // color: Colors.white,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              Icon(Icons.calculate_outlined),
              // Button
              Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black38, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: TextButton(
                  onPressed: compareDollar,
                  child: const Text("Compare"),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),

          Divider(height: 2,),
          Row(
            children: [
              _rowHeader('Transfer\nMoney\nWith', 3),
              _rowHeader('Recipient\nGets', 2),
              _rowHeader('Transfer\nfee', 2),
              _rowHeader('Exchange\nrate', 2),
              _rowHeader('Difference', 3),
            ],
          ),
          Divider(height: 2,),
          Row(
            children: [
              _Header('images/card1.png', 3,"Danesh Remit"),
              _rowHeader('Ammount = $result Tk ', 2),
              _rowHeader('3', 2),
              _rowHeader('${finalRate.toStringAsFixed(4)}', 2),
              _rowHeader('phoneNumber', 3),
            ],
          ),
          Divider(height: 2,),
          Row(
            children: [
              _Header('images/card1.png', 3,"Estern Bank"),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 3),
            ],
          ),
          Divider(height: 2,),
          Row(
            children: [
              _Header('images/card1.png', 3,"Danesh Remit"),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 3),
            ],
          ),
          Divider(height: 2,),
          Row(
            children: [
              _Header('images/card1.png', 3,"Danesh\Remit"),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 3),
            ],
          ),
          Divider(height: 2,),
          Row(
            children: [
              _Header('images/card1.png', 3,"Danesh\Remit"),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 3),
            ],
          ),
          Divider(height: 2,),
          Row(
            children: [
              _Header('images/card1.png', 3,"Danesh\Remit"),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 2),
              _rowHeader('N/A', 3),
            ],
          ),

          // // Result
          // Text("Amount = $result TK"),
        ],
      ),
    );
  }
}
