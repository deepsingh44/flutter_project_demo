import 'package:carousel_slider/carousel_slider.dart';
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
        child: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              height: 320.0,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 5),
              disableCenter: true,
              //enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 1.0,
            ),
            items: list.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(i.image),
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Colors.transparent,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            i.text,
                            style: TextStyle(fontSize: 20,color: Colors.white),
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
