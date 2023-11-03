
import 'package:dollar_exchange_app/screens/home_screens.dart';
import 'package:dollar_exchange_app/screens/login_screen/auth_controller.dart';
import 'package:dollar_exchange_app/screens/login_screen/register_screen.dart';
import 'package:dollar_exchange_app/screens/login_screen/show_snackBar.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = AuthController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;
  late String password;

  bool _isLoading = false;

  _loginUser() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      String res = await _authController.loginUsers(email, password);

      if (res == 'success') {
        return Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return HomeScreen();
            }));
      } else {
        setState(() {
          _isLoading = false;
        });
        return showSnack(context, res);
      }
    } else {

      return showSnack(context, 'Please Field Must not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold  (
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/background.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeAnimation(1, Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/light-1.png')
                            )
                        ),
                      )),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(1.3, Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/light-2.png')
                            )
                        ),
                      )),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: FadeAnimation(1.5, Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/clock.png')
                            )
                        ),
                      )),
                    ),
                    Positioned(
                      child: FadeAnimation(1.6, Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                        ),
                      )),
                    )
                  ],
                ),
              ),


              /// For address field

              Padding(padding: EdgeInsets.all(30),
                child: FadeAnimation(1.8, Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10)
                        )
                      ]
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color:
                            Colors.grey.shade100))
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Email must not be empty';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter email address",
                              hintStyle: TextStyle(color: Colors.grey[400])
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please password must not be empty';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400])
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              ),

              /// Password field work here


              SizedBox(height: 30,),

              /// Login Button work here

              InkWell(
                onTap: (){
                  _loginUser();
                },
                child: FadeAnimation(2, Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ]
                      )
                  ),
                  child: Center(
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white,)
                        : Text("Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                )),
              ),

              SizedBox(height: 70,),
              /// Need account work here

              FadeAnimation(1.5, Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Need an account?',
                    style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return BuyerRegisterScreen();
                          }));
                    },
                    child: Text('Register'),
                  ),
                ],
              ),),

            ],
          ),
        ),
      ),

    );
  }
}


class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    Future.delayed(Duration(milliseconds: (500 * widget.delay).round()), () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    final opacityTween = Tween<double>(begin: 0.0, end: 1.0);
    final translationTween = Tween<Offset>(begin: Offset(0, -30), end: Offset.zero);

    return FadeTransition(
      opacity: opacityTween.animate(curve),
      child: SlideTransition(
        position: translationTween.animate(curve),
        child: widget.child,
      ),
    );
  }
}