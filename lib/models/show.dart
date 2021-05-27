import 'package:amazon_prime_clone/models/category.dart';

class Show {
  int id;
  String name;
  List<Season> seasons;
  Category category;
  List<String> genres;
}

class Season {
  int id;
  List<Episode> episodes;
}

class Episode {
  int id;
  String name;
  String rated;
  String thumb;
}
