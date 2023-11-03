import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFastContainerExpanded = false;
  bool isSecondContainerExpanded = false;

  // Define additional state variables for the new containers
  bool isThirdContainerExpanded = false;
  bool isFourthContainerExpanded = false;
  bool isFifthContainerExpanded = false;




  void _expandFastContainer() {
    setState(() {
      isFastContainerExpanded = !isFastContainerExpanded;
      isSecondContainerExpanded = false;
      // Reset expansion states for the new containers
      isThirdContainerExpanded = false;
      isFourthContainerExpanded = false;
      isFifthContainerExpanded = false;
    });
  }

  void _expandSecondContainer() {
    setState(() {
      isSecondContainerExpanded = !isSecondContainerExpanded;
      isFastContainerExpanded  = false;
      // Reset expansion states for the new containers
      isThirdContainerExpanded = false;
      isFourthContainerExpanded = false;
      isFifthContainerExpanded = false;
    });
  }

  // Define separate functions for expanding the new containers
  void _expandThirdContainer() {
    setState(() {


      isThirdContainerExpanded = !isThirdContainerExpanded;
      // Reset expansion states for other containers
      isFastContainerExpanded = false;
      isSecondContainerExpanded = false;
      isFourthContainerExpanded = false;
      isFifthContainerExpanded = false;
    });
  }

  void _expandFourthContainer() {
    setState(() {
      isFourthContainerExpanded = !isFourthContainerExpanded;
      // Reset expansion states for other containers
      isFastContainerExpanded = false;
      isSecondContainerExpanded = false;
      isThirdContainerExpanded = false;
      isFifthContainerExpanded = false;
    });
  }

  void _expandFifthContainer() {
    setState(() {
      isFifthContainerExpanded = !isFifthContainerExpanded;
      // Reset expansion states for other containers
      isFastContainerExpanded = false;
      isSecondContainerExpanded = false;
      isThirdContainerExpanded = false;
      isFourthContainerExpanded = false;
    });
  }

  void _resetContainers() {
    setState(() {
      isFastContainerExpanded = false;
      isSecondContainerExpanded = false;
      // Reset expansion states for the new containers
      isThirdContainerExpanded = false;
      isFourthContainerExpanded = false;
      isFifthContainerExpanded = false;
    });
  }

  @override
  Widget   build(BuildContext context) {
    return GestureDetector(
      onTap:_resetContainers ,
      child: Container(
          height: 1250,
          width: MediaQuery.of(context).size.width,
          color: Colors.white70,
          child:  Column(
            children: [
              SizedBox(height: 20,),
              Text("How Much Does It Cost To Transfer Money\n                          To Pakistan ?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, ),),

              SizedBox(height: 20,),
              GestureDetector(
                onTap: _expandFastContainer,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: isFastContainerExpanded ? 210.0 : 200.0,
                  width: isFastContainerExpanded
                      ? MediaQuery.of(context).size.width - 20
                      : MediaQuery.of(context).size.width - 50,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple.shade100, // Color of the border
                      width: 1.0, // Width of the border
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: isFastContainerExpanded
                        ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4.0,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      ),
                    ] : null,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: isFastContainerExpanded ? 210.0 : 200.0,
                        width: 5,
                        color:  Color.fromRGBO(143, 148, 251, 1),
                      ),
                      Anim('images/create.png', 'Pay a small flat fee of \$5', 'To send a money in AUD to Pakistan,you pay a small flat fee of \$5 AUD', Colors.white70)
                    ],
                  ),
                ),
              ),



              SizedBox(height: 20,),
              GestureDetector(
                onTap: _expandSecondContainer,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: isSecondContainerExpanded ? 210.0 : 200.0,
                  width: isSecondContainerExpanded
                      ? MediaQuery.of(context).size.width - 20
                      : MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple.shade100, // Color of the border
                      width: 1.0, // Width of the border
                    ),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: isSecondContainerExpanded
                        ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4.0,
                        offset: Offset(0, 5),
                        spreadRadius: 0,
                      ),
                    ] : null,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: isSecondContainerExpanded ? 210.0 : 200.0,
                        width: 5,
                        color:Color.fromRGBO(143, 148, 251, 1)
                      ),
                      Anim('images/transfer.png', "No Hidden fees","Unlike others, we kept it simple. No big, hidden or surprise fees. Youll see the total cost upfront", Colors.white70),
                    ],
                  ),
                ),
              ),






              SizedBox(height: 20,),
              Text("How Long Will A Money Transfer Take",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, )),




              SizedBox(height: 20,),
              //Rest 3 containers
              Gesture3('images/create.png', "No Hidden fees","Unlike others, we kept it simple. No big, hidden or surprise fees. Youll see the total cost upfront", Colors.white70),



              SizedBox(height: 20,),
              Gesture4('images/donep.jpg', "No Hidden fees","Unlike others, we kept it simple. No big, hidden or surprise fees. Youll see the total cost upfront", Colors.white70),




              SizedBox(height: 20,),
              Gesture5('images/transfer.png', "No Hidden fees","Unlike others, we kept it simple. No big, hidden or surprise fees. Youll see the total cost upfront", Colors.white70),




            ],
          ),
        ),
    );
  }

  Widget Anim( String images,String text1, String text2, Color color){
    return  Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height:50,
            width: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: AssetImage(images),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(text1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
          SizedBox(height: 10,),
          SizedBox(height: 40,width:MediaQuery.of(context).size.width - 80,
            child:Text(text2) ,),
        ],
      ),
    );
  }

  Widget Gesture3( String images,String text1, String text2, Color color){
    return GestureDetector(
      onTap: _expandThirdContainer,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: isThirdContainerExpanded ? 210.0 : 200.0,
          width: isThirdContainerExpanded
              ? MediaQuery.of(context).size.width - 20
              : MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.deepPurple.shade100, // Color of the border
              width: 1.0, // Width of the border
            ),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: isThirdContainerExpanded
                ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4.0,
                offset: Offset(0, 5),
                spreadRadius: 0,
              ),
            ] : null,
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height:50,
                width: 50,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    image: AssetImage(images),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(text1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Text(text2),
              ),
            ],
          ),
      ),
    );
  }

  Widget Gesture4( String images,String text1, String text2, Color color){
    return GestureDetector(
      onTap: _expandFourthContainer,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: isFourthContainerExpanded ? 210.0 : 200.0,
        width: isFourthContainerExpanded
            ? MediaQuery.of(context).size.width - 20
            : MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepPurple.shade100, // Color of the border
            width: 1.0, // Width of the border
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: isFourthContainerExpanded
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4.0,
              offset: Offset(0, 5),
              spreadRadius: 0,
            ),
          ] : null,
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:50,
              width: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(images),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(text1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text(text2),
            ),
          ],
        ),
      ),
    );}

  Widget Gesture5( String images,String text1, String text2, Color color){
    return GestureDetector(
      onTap: _expandFifthContainer,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: isFifthContainerExpanded ? 210.0 : 200.0,
        width: isFifthContainerExpanded
            ? MediaQuery.of(context).size.width - 20
            : MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepPurple.shade100, // Color of the border
            width: 1.0, // Width of the border
          ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: isFifthContainerExpanded
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4.0,
              offset: Offset(0, 5),
              spreadRadius: 0,
            ),
          ] : null,
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:50,
              width: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage(images),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(text1,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 5.0),
              child: Text(text2),
            ),
          ],
        ),
      ),
    );
  }




}
