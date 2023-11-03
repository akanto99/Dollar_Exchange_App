import 'package:flutter/material.dart';

class AfterAnimatedContainer extends StatelessWidget {
  const AfterAnimatedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(143, 148, 251, 40),
          height: 550,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 210,
                      width: 210,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                            image: AssetImage("images/mobile.png"),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Text(
                      "Save Time & Money With This App", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You can transfer money at home or on the move with our award-winning app",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),

                    SizedBox(
                      height: 10,
                    ),
                    rText("Get the best rates with currency alert"),
                    SizedBox(
                      height: 10,
                    ),
                    rText("Track your money, every step of the way"),
                    SizedBox(
                      height: 10,
                    ),
                    rText("Save your card details securely and pay in seconds"),
                    SizedBox(
                      height: 10,
                    ),
                    rText("Get the best rates with currency alerts"),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 70,
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                        image: DecorationImage(image: AssetImage("images/google.png",),fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1,1),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 70,
                      width: 190,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                        image: DecorationImage(image: AssetImage("images/app.png",),fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1,1),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: 500,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 270,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("images/customer.jpg",fit: BoxFit.cover,)),
                Text("Global support in a range of language",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "The quick brown fox jumped over the lazy dog.It was a sunny day in the park, and the birds were chirping. People strolled by, enjoying the pleasant weather. A picnic blanket was spread out under a shady tree, inviting visitors to relax. In the distance, a children's playground echoed with laughter.",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.lightBlue.shade300,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Center(child: Text("Contact Us",style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),))),),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget rText(String text) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.energy_savings_leaf_outlined,color: Colors.white,),
        Text(
          text,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
