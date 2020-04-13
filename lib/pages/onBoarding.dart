import 'package:flutter/material.dart';
import 'package:newsy/models/pageModel.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {


  List<PageModel> pages = List<PageModel>();

  void addPages() {
    pages.add(PageModel(
      'assets/images/news5.jpg',
      'Your New Reading Experience',
      'All your favorite sources in one place',
    ));
    pages.add(PageModel(
        'assets/images/news6.jpg',
        'Save your articles for later',
        'Hit the bookmark icon on any article to save for later'));
  }

  @override
  Widget build(BuildContext context) {
    addPages();

    return Scaffold(
      backgroundColor: Color(0xffFDFDFE),
      body: Stack(
        children: <Widget>[
          Swiper(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    pages[index].image,
                  ),
                  Container(
                    child: Text(
                      pages[index].title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff544F74),
                          fontSize: 15),
                    ),
                    margin: EdgeInsets.only(top: 40),
                  ),
                  Text(
                    pages[index].description,
                    style: TextStyle(
                      color: Color(0xff544F74),
                    ),
                  )
                ],
              );
            },
            pagination: SwiperPagination(
                //  alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(bottom: 170),
                builder: new SwiperCustomPagination(
                    builder: (BuildContext context, SwiperPluginConfig config) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: new ConstrainedBox(
                      child: new DotSwiperPaginationBuilder(
                              color: Color(0xffA2BCD5),
                              activeColor: Color(0xff00648F),
                              size: 10.0,
                              activeSize: 15.0)
                          .build(context, config),
                      constraints:
                          BoxConstraints.expand(height: 50.0, width: 50),
                    ),
                  );
                })),
            loop: false,
            controller: SwiperController(),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  _updateSeen();
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff00648F),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFDFDFE),
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void _updateSeen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);

  }
}



// --------------- old method instead pageModel --------------------------------

//  List<String> images = [
//    'assets/images/news5.jpg',
//    'assets/images/news6.jpg',
//  ];
//
//  List<String> text1 = [
//    'Your New Reading Experience',
//    'Save your articles for later'
//  ];
//
//  List<String> text2 = [
//    'All your favorite sources in one place',
//    'Hit the bookmark icon on any article to save for later'
//  ];
