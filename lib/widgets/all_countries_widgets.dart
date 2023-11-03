import 'package:dollar_exchange_app/model/dollar_model.dart';
import 'package:dollar_exchange_app/screens/contriesSelection_Screens.dart';
import 'package:flutter/material.dart';

class CountrySelectionScreen extends StatelessWidget {

  final ScrollController _gridScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Text("     Send Money From Australia To\nOver 170 Countries (And Counting)", style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 20,
            // fontWeight: FontWeight.bold
        ), ),
        SizedBox(height: 20,),
        Container(
          height: 700,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
                controller: _gridScrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.0, // Adjust the aspect ratio as needed
                ),
                itemCount: countryList.length,
                itemBuilder: (context, index) {
                  final country = countryList[index];
                  final truncatedName = country.name.length > 20
                      ? country.name.substring(0, 10) + '...'
                      : country.name;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CurrencyConverterScreen(selectedC: country),
                        ),
                      );
                    },
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 30,
                              width: 30,
                              child: Image.network(country.image, height: 100, width: 100,fit: BoxFit.cover,)),
                          Text(
                              truncatedName,
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

        ),
      ],
    );
  }
}

