import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final list = [
    MyImageDetail(
        "https://assets.entrepreneur.com/content/3x2/2000/20191219170611-GettyImages-1152794789.jpeg",
        "First Page"),
    MyImageDetail(
        "https://assets.entrepreneur.com/content/3x2/2000/20191219170611-GettyImages-1152794789.jpeg",
        "Second Page"),
    MyImageDetail(
        "https://assets.entrepreneur.com/content/3x2/2000/20191219170611-GettyImages-1152794789.jpeg",
        "Third Page"),
    MyImageDetail(
        "https://assets.entrepreneur.com/content/3x2/2000/20191219170611-GettyImages-1152794789.jpeg",
        "Fourth Page"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Slider"),
      ),
      body: Card(
        elevation: 10,
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          //height: 220,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              //autoPlayAnimationDuration: Duration(seconds: 5),
              disableCenter: false,
              //enlargeStrategy: CenterPageEnlargeStrategy.height,
              enlargeCenterPage: true,
              //viewportFraction: 0.9,
              autoPlayCurve: Curves.linear,
              aspectRatio: 1.85,
            ),
            items: list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    margin: EdgeInsets.all(1),
                    //decoration: BoxDecoration(color: Colors.amber,),
                    child: Stack(
                      children: [
                        Card(
                          child: Container(
                            child: Image(
                              image: NetworkImage(i.image,),
                              fit: BoxFit.cover,
                              //width: 1000,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            //color: Colors.black45,
                            //width: MediaQuery.of(context).size.width,
                            height: 30,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              i.text,
                              style: TextStyle(color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class MyImageDetail {
  String image;
  String text;

  MyImageDetail(this.image, this.text);
}
