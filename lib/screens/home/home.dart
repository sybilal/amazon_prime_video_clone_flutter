import 'package:amazon_prime_clone/models/home/homeModal.dart';
import 'package:amazon_prime_clone/screens/about/about_page.dart';
import 'package:amazon_prime_clone/screens/home/tabs/homeTabView.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  static const routeName = '/home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 20,
                        child: Image(
                          width: 80,
                          image: AssetImage('assets/images/prime_logo.png'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AboutPage.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Icon(Icons.info, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: Colors.white,
                    labelPadding: EdgeInsets.zero,
                    tabs: [
                      Tab(text: 'Home'),
                      Tab(text: 'TV Shows'),
                      Tab(text: 'Movies'),
                      Tab(text: 'Kids'),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              HomeTabView(
                carouselItems: carouselMovieItems,
              ),
              HomeTabView(
                carouselItems: List.from(carouselMovieItems.reversed),
              ),
              HomeTabView(
                carouselItems: carouselMovieItems,
              ),
              HomeTabView(
                carouselItems: List.from(carouselMovieItems.reversed),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
