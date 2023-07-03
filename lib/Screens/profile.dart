import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:managment/Screens/login_screen.dart';
import 'package:managment/net/flutterfire.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: [
              Color.fromARGB(255, 47, 125, 121),
              Color.fromARGB(255, 17, 90, 56),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          new Scaffold(
            backgroundColor: Colors.transparent,
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.center,
                    child: new Padding(
                      padding: new EdgeInsets.only(top: _height / 15),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            child: Icon(
                              Icons.person_3_sharp,
                              size: 100,
                              color: const Color.fromARGB(255, 216, 215, 215),
                            ),
                            radius: _height / 10,
                          ),
                          new SizedBox(
                            height: _height / 30,
                          ),
                          new Text(
                            'Abhijeet Kushwaha',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: _height / 2.2),
                    child: new Container(
                      color: Colors.white,
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 2.6,
                        left: _width / 20,
                        right: _width / 20),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 2.0,
                                    offset: new Offset(0.0, 2.0))
                              ]),
                          child: new Padding(
                            padding: new EdgeInsets.all(_width / 20),
                            child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  headerChild('Income', 10000000),
                                  headerChild('Expense', 5000000),
                                  headerChild('Balance', 5000000),
                                ]),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: _height / 20),
                          child: new Column(
                            children: <Widget>[
                              infoChild(
                                  _width, Icons.email, 'Abhijeet108@gmail.com'),
                              infoChild(_width, Icons.call, '+12-1234567890'),
                              infoChild(
                                  _width, Icons.group_add, 'Add to group'),
                              infoChild(_width, Icons.chat_bubble,
                                  'Show all Expenses'),
                              SizedBox(height: 1.0),
                              _isSigningOut
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    )
                                  : ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          Color.fromARGB(255, 25, 97, 86),
                                        ),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _isSigningOut = true;
                                        });
                                        await Authentication.signOut(
                                            context: context);
                                        setState(() {
                                          _isSigningOut = false;
                                        });
                                        Navigator.of(context).pushReplacement(
                                            _routeToSignInScreen());
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(
                                          'Sign Out',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerChild(String header, int value) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(header),
          new SizedBox(
            height: 8.0,
          ),
          new Text(
            '$value',
            style: new TextStyle(
                fontSize: 14.0,
                color: const Color(0xFF26CBE6),
                fontWeight: FontWeight.bold),
          )
        ],
      ));

  Widget infoChild(double width, IconData icon, data) => new Padding(
        padding: new EdgeInsets.only(bottom: 8.0),
        child: new InkWell(
          child: new Row(
            children: <Widget>[
              new SizedBox(
                width: width / 10,
              ),
              new Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 26.0,
              ),
              new SizedBox(
                width: width / 20,
              ),
              new Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
