import 'package:crypto_font_icons/crypto_font_icon_data.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Portfolio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF5F627D), Color(0xFF313347)],
        ),
      ),
      child: Scaffold(
        drawer: Drawer(),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Stack(children: [
                  Positioned(
                      right: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                      )),
                  Icon(Icons.notifications_outlined)
                ]),
                onPressed: () {})
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Container(
                height: 190,
                width: double.infinity,
                margin: EdgeInsets.only(top: 24, bottom: 18),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Colors.black38,
                      spreadRadius: -5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF08AEEA), Color(0xFF2AF598)],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Coins',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Bitcoin',
                                    style: TextStyle(
                                        color: Colors.white),
                                  ),
                                  Text('\$123.45',
                                      style: TextStyle(
                                          color: Colors.white)),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('0.000041',style: TextStyle(color: Colors.grey,fontSize: 14),),
                                    Row(
                                      children: [
                                        Text('12.41%',style: TextStyle(color: Colors.green),),
                                        Icon(Icons.arrow_drop_up,color: Colors.green,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.amber),
                            child: Icon(
                              CryptoFontIcons.BTC,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          color: Colors.white,
                        ),
                    itemCount: 10),
              ),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
