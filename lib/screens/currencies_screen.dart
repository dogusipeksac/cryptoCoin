import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({Key key}) : super(key: key);

  @override
  _CurrenciesScreenState createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  final PageController _pageController=PageController();
  double _currenPosition=0;
  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener(() {
      _currenPosition=_pageController.page;
      setState(() {
      });
    });
    super.initState();
  }

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          title: Text('Your Coins'),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              DotsIndicator(
                position: _currenPosition,
                dotsCount: 4,
                decorator: DotsDecorator(
                  activeColor: Colors.white,
                  size: Size(4, 4),
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(pi*_currenPosition),
                child: Container(
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
              ),
              Expanded(
                child: PageView.builder(
                  controller:_pageController ,
                  itemCount: 4,
                  itemBuilder: (context, index) => Container(
                    child: ListView.separated(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(index.toString()),
                        ),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: 10),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
