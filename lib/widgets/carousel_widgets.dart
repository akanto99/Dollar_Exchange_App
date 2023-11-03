import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidgets extends StatefulWidget {
  const CarouselWidgets({super.key});

  @override
  State<CarouselWidgets> createState() => _CarouselWidgetsState();
}

class _CarouselWidgetsState extends State<CarouselWidgets> {

  final controller = CarouselController();
  int activeIndex = 0;
  final assetImages = [
   'images/card1.png',
   'images/chayalogo.png',
    'images/bcs.gif',
    'images/card2.png',
    'images/freelancing.gif',
    'images/madrasah.png',
  ];

  Widget buildImage(String assetImage, int index) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: DecorationImage(
        image: AssetImage(assetImage),
        fit: BoxFit.cover
      ),
    ),
  );

  buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: assetImages.length,
    onDotClicked: (index) {
      controller.animateToPage(index);
    },
    effect: WormEffect(
      dotWidth: 10,
      dotHeight: 10,
      dotColor: Colors.white70,
      activeDotColor: Colors.purpleAccent,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(143, 148, 251, 40),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text("Why Choose Us",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 15, bottom: 10),
            child: CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
          height:200,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) =>
          setState(() => activeIndex = index)),
          itemCount: assetImages.length,
          itemBuilder: (context, index, realIndex) {
            final assetImage = assetImages[index];
            return buildImage(assetImage, index);
          }
          ),
          ),
          buildIndicator(),
          SizedBox(height: 20,),
          Container(
            height: 1100,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("How TO Send Money",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),),


              //1st Image
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage('images/create.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text("Create An Account",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),),
                    Text("Create you free account in minutes",style: TextStyle( color: Colors.white),),
                  ],
                ),







                //2nd Image
                SizedBox(height: 20,),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage('images/transfer.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text("Set up a transfer ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),),
                    Text("Choose the ammount of money sent and tell us who to send it to.",style: TextStyle( color: Colors.white),),
                  ],
                ),



                //3rd Image
                SizedBox(height: 20,),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage('images/payment2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text("Pay securely ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),),
                    Text("Pay using debit/credit card or bank transfer",style: TextStyle( color: Colors.white),),
                  ],
                ),





                //4th Image
                SizedBox(height: 20,),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage('images/donep.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),

                ),
                Column(
                  children: [
                    Text("That's it",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.white),),
                    Text("We'll notify you when the transfer is complete, usually within minutes",style: TextStyle( color: Colors.white),),
                  ],
                ),




















                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors
                        .white), // Change 'Colors.blue' to your desired background color
                  ),
                  onPressed: () {},
                  child: Text("Create Your Free Account Today"),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ],
      ),
    );
    }
}
