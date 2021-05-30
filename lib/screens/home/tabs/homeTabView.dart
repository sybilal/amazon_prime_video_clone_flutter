import 'package:amazon_prime_clone/models/home/homeModal.dart';
import 'package:amazon_prime_clone/screens/home/components/categoryItemWidget.dart';
import 'package:amazon_prime_clone/utilities/constants.dart';
import 'package:flutter/material.dart';

class HomeTabView extends StatefulWidget {
  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  PageController _carouselController = PageController();
  double currentCarousal = 0;

  @override
  void initState() {
    _carouselController.addListener(() {
      setState(() {
        currentCarousal = _carouselController.page;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          child: Stack(
            children: [
              PageView(
                  controller: _carouselController,
                  children: carouselItems
                      .map((e) => Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                                image: NetworkImage(e.imagePath),
                              ),
                            ),
                          ))
                      .toList()),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: currentCarousal.round() == 0.0
                          ? Colors.white
                          : Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: currentCarousal.round() == 1.0
                          ? Colors.white
                          : Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: currentCarousal.round() == 2.0
                          ? Colors.white
                          : Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        // cat item
        Expanded(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              CategoryWidget(
                categoryItem: categoryItems[0],
              ),
              CategoryWidget(
                categoryItem: categoryItems[1],
              ),
              CategoryWidget(
                categoryItem: categoryItems[2],
              ),
            ],
          ),
        )
      ],
    );
  }
}
