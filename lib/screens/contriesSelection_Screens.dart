import 'package:dollar_exchange_app/model/dollar_model.dart';
import 'package:dollar_exchange_app/widgets/after_animCon_widgets.dart';
import 'package:dollar_exchange_app/widgets/carousel_widgets.dart';
import 'package:dollar_exchange_app/widgets/compare_widgets.dart';
import 'package:dollar_exchange_app/widgets/frequently_askques_widgets.dart';
import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  final Country selectedC;

  CurrencyConverterScreen({required this.selectedC});

  @override
  State<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {

  String selectedCountry = 'TANZANIA, UNITED REPUBLIC OF (TZS)';
  String selectedService = 'Bank Transfer';
  String currencyName = 'TZS';

  double finalRate = 0.0;
  double fees = 3.00;
  double inputNumber = 0.0;

  TextEditingController inputController = TextEditingController(); // Initialize the TextEditingController

  @override
  void initState() {
    super.initState();
    updateSelectedCurrencyDetails();

    // Set the initial value of the input field to 100
    inputController.text = '0.00';
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    height: 100,
                    width: 200,
                    child:
                    Image.asset('images/Denish.png', fit: BoxFit.cover),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Go Home",style: TextStyle(color: Colors.blue),),),
                  TextButton(onPressed: (){}, child: Text("About Us",style: TextStyle(color: Colors.blue),),),
                  TextButton(onPressed: (){}, child: Text("Contact Us",style: TextStyle(color: Colors.blue),),),
                ],
              ),
              Stack(
                children: [
                  Column(

                    children: [
                      Container(
                        height: 950,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(143, 148, 251, 40),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainText('Send Money to :\n${widget.selectedC.name}',Colors.white),

                              SizedBox(
                                height: 10,
                              ),

                              Text(
                                  'Lorem ipsum dolor sit amet ${widget.selectedC.name}, consectetur adipiscing elit Lorem ipsum dolor sit amet ${widget.selectedC.name}'
                                    'Quisque posuere quam in nunc sollicitudin ${widget.selectedC.name},',style: TextStyle(color: Colors.white70,fontSize: 16),),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: (){},
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
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.handshake_outlined,color: Colors.white70,),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("5 Flat fee",style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ],
                              ),

                              Row(
                                children: [
                                  Icon(Icons.handshake_outlined,color: Colors.white70,),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("5 Star service",style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ],
                              ),

                              Row(
                                children: [
                                  Icon(Icons.handshake_outlined,color: Colors.white70,),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Top Rated company",style:TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  height: 50,
                                  width:MediaQuery.of(context).size.width-70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white
                                  ),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      BodyText('See Our 805 Reviews on ', Color.fromRGBO(143, 148, 251, 1)),
                                      Icon(Icons.arrow_forward,color: Color.fromRGBO(143, 148, 251, 1),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 5,
                    top: 480,
                    child:Column(
                      children: [
                        Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width-10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.lightBlue
                          ),
                          child: Center(
                              child:
                          Column(
                            children: [
                              BodyText("Exchange rate",Colors.white),
                              MainText("1 AUD = ${finalRate.toStringAsFixed(4)} rate",Colors.white),
                            ],
                          )),
                        ),
                        Container(
                          height: 520,
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            children: [
                              SizedBox(height: 16.0),
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
                      ],
                    ),
                  )
                ],
              ),

              //Compare Dollar
              CompareDollar(),


              //How to Send Money
              AfterAnimatedContainer(),

              CarouselWidgets(),
              Container(
                // height: 1000,
                  width: 600,
                  child: FreAskQuestions()),



            ],
          ),
        ),
      ),
    );
  }

  // 1st Container
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
              child: Container(
                width: 350,
                // color: Colors.redAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('${widget.selectedC.name}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
    final availableMethods = getDeliveryMethods(widget.selectedC.name);
    if (!availableMethods.contains(selectedService)) {
      selectedService = availableMethods.isNotEmpty ? availableMethods.first : '';
    }

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
                padding: EdgeInsets.only(left: 10),
                child: DropdownButton<String>(
                  value: selectedService,
                  items: availableMethods.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedService = newValue ?? '';
                      updateSelectedCurrencyDetails();
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
    // Get selected country details from the currently selected country
    final selectedCountryDetails = getSelectedCountryDetails(selectedCountry);
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
                          controller: inputController,
                          onTap: () {
                            inputController.selection = TextSelection(
                              baseOffset: 0,
                              extentOffset: inputController.text.length,
                            );
                          },
                          onChanged: (value) {
                            setState(() {
                              double inputValue = double.tryParse(value) ?? 0.0;
                              // Check if inputValue is within limits

                              inputNumber = inputValue;
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
                          controller: TextEditingController(
                            text: (finalRate * inputNumber).toStringAsFixed(2),
                          ),
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.black,
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

  void showLimitsDialog(String country) {
    final selectedCountryDetails = getSelectedCountryDetails(country);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Minimum and Maximum Limits'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Minimum Limit: ${selectedCountryDetails.minimumLimit}'),
              Text('Maximum Limit: ${selectedCountryDetails.maximumLimit}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
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
    final selectedCountryDetails = getSelectedCountryDetails(widget.selectedC.name);
    final selectedServiceDetails = getSelectedServiceDetails(selectedService, selectedCountryDetails);
    setState(() {
      finalRate = selectedServiceDetails.finalRate;
      print("Exchange rate updated: 1 AUD = $finalRate rate");
    });
  }


  CurrencyDetails getSelectedCountryDetails(String selectedCountry) {
    final country = getCountry(selectedCountry);
    return country.currencyDetails.first;
  }

  CurrencyDetails getSelectedServiceDetails(String selectedService, CurrencyDetails selectedCountryDetails) {
    return selectedCountryDetails;
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

