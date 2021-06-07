import 'package:amazon_prime_clone/models/home/homeModal.dart';
import 'package:amazon_prime_clone/screens/home/components/categoryItemWidget.dart';
import 'package:amazon_prime_clone/screens/showScreen/showScreen.dart';
import 'package:amazon_prime_clone/utilities/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeTabView extends StatefulWidget {
  final List<ShowItem> carouselItems;

  const HomeTabView({Key key, this.carouselItems}) : super(key: key);
  @override
  _HomeTabViewState createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  PageController _carouselController = PageController();
  double currentCarousal = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              ShowScreen.routeName,
              arguments: widget.carouselItems[currentCarousal.toInt()],
            );
          },
          child: Container(
            height: 200,
            child: Stack(
              children: [
                PageView(
                  onPageChanged: (carouselNumber) {
                    setState(() {
                      currentCarousal = carouselNumber.toDouble();
                    });
                  },
                  controller: _carouselController,
                  children: widget.carouselItems.map(
                    (e) {
                      var index = widget.carouselItems.indexOf(e);
                      return AnimatedOpacity(
                        opacity: index == currentCarousal.round() ? 1 : 0.3,
                        duration: Duration(milliseconds: 150),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              image: CachedNetworkImageProvider(e.imagePath),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.white.withOpacity(
                          currentCarousal.round() == 0.0 ? 0.8 : 0.5,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.white.withOpacity(
                          currentCarousal.round() == 1.0 ? 0.8 : 0.5,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.white.withOpacity(
                          currentCarousal.round() == 2.0 ? 0.8 : 0.5,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // cat item
        CategoryWidget(
          categoryItem: categoryItems[0],
        ),
        CategoryWidget(
          categoryItem: categoryItems[1],
        ),
        CategoryWidget(
          categoryItem: categoryItems[2],
        ),
        CategoryWidget(
          categoryItem: categoryItems[0],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
