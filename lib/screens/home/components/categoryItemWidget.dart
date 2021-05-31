import 'package:amazon_prime_clone/models/home/homeModal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryItem categoryItem;

  const CategoryWidget({Key key, this.categoryItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, bottom: 10),
            child: Row(
              children: [
                Text(
                  categoryItem.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 22,
                    color: kAmazonOriginalsColor,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: kAmazonOriginalsColor,
                  size: 17,
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                children: [...categoryItem.shows, ...categoryItem.shows]
                    .map(
                      (e) => Container(
                        height: 100,
                        width: 200,
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            image: CachedNetworkImageProvider(e.imagePath),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
