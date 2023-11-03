
import 'dart:async';

import 'package:dollar_exchange_app/model/dollar_model.dart';
import 'package:flutter/material.dart';


class TestCurrency extends StatefulWidget {
  const TestCurrency({Key? key}) : super(key: key);


  @override
  State<TestCurrency> createState() => _TestCurrencyState();
}

class _TestCurrencyState extends State<TestCurrency> {
  bool showProgress = true;
  String selectedCountry = "TANZANIA, UNITED REPUBLIC OF (TZS)";
  String selectedService = 'Bank Transfer';
  String currencyName = 'TZS';

  double finalRate = 0.0;
  double fees = 3.00;
  double inputNumber = 0.0;

  TextEditingController thirdContainerController = TextEditingController();
  TextEditingController fourthContainerController = TextEditingController(); // Initialize the TextEditingController
  bool showError = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    updateSelectedCurrencyDetails();

    // Set the initial value of the input field to 100
    thirdContainerController.text = '0.00';
    fourthContainerController.text = '0.00';
    Timer(Duration(seconds: 3), () {
      setState(() {
        showProgress = false; // Hide the progress indicator
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width-10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue
            ),
            child: Center(child: BodyText("International Money Transfer",Colors.white)),
          ),

          //2nd Container
          Stack(
            children: [
              Container(
                height: 510,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    buildCountryDropdown(),
                    const SizedBox(height: 10),
                    buildServiceDropdown(),
                    const SizedBox(height: 10),
                    buildInputFields(),
                    buildResult(),
                    buildSendButton(),
                  ],
                ),
              ),
              // Show the progress indicator if showProgress is true
              Visibility(
                visible: showProgress,
                child: Container(
                    height: 510,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Center(
                      child:  Container(
                          height: 200,
                          width: 200,
                          child: Image.asset('images/cir.gif')),
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  // 1st Container
  Widget buildCountryDropdown() {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width - 50,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black38,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: Row(
                  children: [

                    DropdownButton<String>(
                      value: selectedCountry,
                      items: countryList.map((Country country) {
                        return DropdownMenuItem<String>(
                          value: country.name,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20,
                                width: 30,
                                child: Image.network(country.image),
                              ),
                              SizedBox(width: 10), // Add some spacing between the image and text
                              Text(country.name),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCountry = newValue ?? '';
                          updateSelectedService();
                          updateSelectedCurrencyDetails();

                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.5,
            left: 40,
            child: Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black12,
                  width: 1.0,
                ),
              ),
              child: const Text("Send To"),
            ),
          ),
        ],
      ),
    );
  }


// 2nd Container
  Widget buildServiceDropdown() {
    return Container(
      height: 75,
      width:MediaQuery.of(context).size.width - 50,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black38,
                  width: 1.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: DropdownButton<String>(

                  value: selectedService,
                  items: getDeliveryMethods(selectedCountry).map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedService = newValue ?? '';
                      updateSelectedCurrencyDetails(); // Call the method here
                    });
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.5,
            left: 40,
            child: Container(
              width: 120,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black12,
                  width: 1.0,
                ),
              ),
              child: const Text("Delivery Method"),
            ),
          ),
        ],
      ),
    );
  }

  // 3rd Container
  Widget buildInputFields() {
    return Container(
      height: 77,
      width: MediaQuery.of(context).size.width - 50,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 77,
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: thirdContainerController, // Use the thirdContainerController here
                          onTap: () {
                            thirdContainerController.selection = TextSelection(
                              baseOffset: 0,
                              extentOffset: thirdContainerController.text.length,
                            );
                          },
                          onChanged: (value) {
                            setState(() {
                              double inputValue = double.tryParse(value) ?? 0.0;
                              // Check if inputValue is within limits
                              inputNumber = inputValue;

                              // Update the fourth container based on the input in the third container
                              fourthContainerController.text = (finalRate * inputValue).toStringAsFixed(2);

                              // Call the validation function
                              validateInput(inputValue, getSelectedCountryDetails(selectedCountry));
                            });
                          },

                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 20,
                          child: Text("AUD"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.5,
            left: 40,
            child: Container(
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black12,
                  width: 1.0,
                ),
              ),
              child: const Center(
                child: Text("You Transfer"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validateInput(double inputValue, CurrencyDetails selectedCurrencyDetails) {
    if (inputValue < selectedCurrencyDetails.minimumLimit) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Row(
          children: [
            Icon(Icons.error_outline,color: Colors.deepPurple,),
            SizedBox(width:5 ),
            Text('Valid Minimum Limit of ${selectedCurrencyDetails.minimumLimit} ${selectedCurrencyDetails.currency}.'),
          ],
        ),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (inputValue > selectedCurrencyDetails.maximumLimit) {
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content:  Row(
          children: [
            Icon(Icons.error_outline,color: Colors.deepPurple,),
            SizedBox(width:5 ),
            Text('Valid Maximum Limit of ${selectedCurrencyDetails.maximumLimit} ${selectedCurrencyDetails.currency}.'),
          ],
        ),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }





  // 4th Container
  Widget buildResult() {
    return Container(
      height: 77,
      width: MediaQuery.of(context).size.width - 50,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 60,
              height: 77,
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: fourthContainerController, // Use the thirdContainerController here
                          onTap: () {
                            fourthContainerController.selection = TextSelection(
                              baseOffset: 0,
                              extentOffset: fourthContainerController.text.length,
                            );
                          },
                          // readOnly: true,
                          onChanged: (value) {
                            setState(() {
                              double inputValue = double.tryParse(value) ?? 0.0;
                              // Check if inputValue is within limits
                              inputNumber = inputValue;

                              // Update the Third container based on the input in the third container
                              thirdContainerController.text = (inputValue / finalRate ).toStringAsFixed(2);
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0.5,
            left: 40,
            child: Container(
              width: 110,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black12,
                  width: 1.0,
                ),
              ),
              child: const Center(
                child: Text("Recipient Gets"),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget buildSendButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Exchange rate : "),
            Text("1 AUD = ${finalRate.toStringAsFixed(4)} rate",style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
        SizedBox(height: 10,),
        Text("Total Fees = $fees AUD"),
        SizedBox(height: 10,),
        Text("Total Payable Amount = ${(inputNumber + fees).toStringAsFixed(2)} AUD"),
        SizedBox(height: 10,),
        InkWell(
          onTap: (){},
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width-80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.lightBlue.shade300
            ),
            child: Center(child: BodyText("Send Money",Colors.white)),),
        )
      ],
    );
  }



  void updateSelectedService() {
    final availableMethods = getDeliveryMethods(selectedCountry);
    if (!availableMethods.contains(selectedService)) {
      selectedService = availableMethods.isNotEmpty ? availableMethods.first : '';
    }
  }

  List<String> getDeliveryMethods(String selectedCountry) {
    final country = getCountry(selectedCountry);
    return country.currencyDetails.map((currencyDetail) => currencyDetail.serviceName).toSet().toList();
  }

  Country getCountry(String selectedCountry) {
    return countryList.firstWhere(
          (country) => country.name == selectedCountry,
      orElse: () => Country(
        id: 0,
        name: "",
        code: "",
        image: "",
        currencyDetails: [],
      ),
    );
  }

  void updateSelectedCurrencyDetails() {
    final selectedCountryDetails = getSelectedCountryDetails(selectedCountry);
    final selectedServiceDetails = getSelectedServiceDetails(selectedService, selectedCountryDetails);
    setState(() {
      finalRate = selectedServiceDetails.finalRate;
      print("Exchange rate updated: 1 AUD = $finalRate rate"); // Add this line
    });
  }


  CurrencyDetails getSelectedCountryDetails(String selectedCountry) {
    final country = getCountry(selectedCountry);
    return country.currencyDetails.first;
  }

  CurrencyDetails getSelectedServiceDetails(String selectedService, CurrencyDetails selectedCountryDetails) {
    return selectedCountryDetails;
  }


  Widget BodyText(String text,Color color){
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 20, // Adjust the font size as needed
        fontWeight: FontWeight.bold, // Adjust the font weight as needed
        // You can add more text styling properties here
      ),
    );
  }
}
