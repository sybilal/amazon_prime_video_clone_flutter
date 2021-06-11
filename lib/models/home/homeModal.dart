class CategoryItem {
  int id;
  String name;
  List<ShowItem> shows;

  CategoryItem({this.id, this.name, this.shows});
}

class ShowItem {
  int id;
  String name;
  String imagePath;
  String videoId;

  ShowItem({this.id, this.name, this.imagePath, this.videoId});
}

List<CategoryItem> categoryItems = [
  CategoryItem(
    id: 1,
    name: 'Amazon Originals',
    shows: originals,
  ),
  CategoryItem(
    id: 2,
    name: 'Recommended movies',
    shows: movie123,
  ),
  CategoryItem(
    id: 4,
    name: 'TV Shows you\'ll like',
    shows: showItem456,
  ),
];

List<ShowItem> originals = [
  ShowItem(
    id: 1,
    name: 'The Boys',
    imagePath: 'https://pbs.twimg.com/media/EgpInGdU0AAXde7.jpg',
    videoId: 'tcrNsIaQkb4',
  ),
  ShowItem(
    id: 2,
    name: 'Invincible',
    imagePath:
        'https://m.media-amazon.com/images/I/818kzWXxO8L._AC_UY545_FMwebp_QL65_.jpg',
    videoId: '-bfAVpuko5o',
  ),
  ShowItem(
    id: 3,
    name: 'Mirzapur',
    imagePath:
        'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/0c430172c4f561b28d8afff7eac5d400b0212cf7d3222acb70609ace00e4fdf2._UY500_UX667_RI_V_TTW_.jpg',
    videoId: '4iao_ZoPuXk',
  ),
];

List<ShowItem> carouselMovieItems = [
  ShowItem(
    id: 1,
    name: 'The Boys',
    imagePath:
        'https://nerdist.com/wp-content/uploads/2021/05/The-Boys-Season1.jpg',
    videoId: 'tcrNsIaQkb4',
  ),
  ShowItem(
    id: 2,
    name: 'Invincible',
    imagePath:
        'https://m.media-amazon.com/images/I/818kzWXxO8L._AC_UY545_FMwebp_QL65_.jpg',
    videoId: '-bfAVpuko5o',
  ),
  ShowItem(
    id: 3,
    name: 'Mirzapur',
    imagePath:
        'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/0c430172c4f561b28d8afff7eac5d400b0212cf7d3222acb70609ace00e4fdf2._UY500_UX667_RI_V_TTW_.jpg',
    videoId: '4iao_ZoPuXk',
  ),
];

List<ShowItem> showItem456 = [
  ShowItem(
    id: 4,
    name: 'The Night Of',
    imagePath:
        'https://images-na.ssl-images-amazon.com/images/S/sgp-catalog-images/region_US/hbo-PMRS1006260-SB-Full-Image_GalleryCover-en-US-1484001247606._UY500_UX667_RI_V9153cddbb489779d3c155ea74aaf4527_TTW_.jpg',
    videoId: 'Z5uv7_ysu9M',
  ),
  ShowItem(
    id: 5,
    name: 'Goliath',
    imagePath:
        'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/01ab184a1c6036c135abd1a3af273850e5fb847f0e00633c134a14201910c30e._UY500_UX667_RI_V_TTW_.jpg',
    videoId: '3rhynm3kk18',
  ),
  ShowItem(
      id: 6,
      name: 'Without Remorse',
      imagePath:
          'https://cdn.iphoneincanada.ca/wp-content/uploads/2021/03/tom-clancys-without-remorse.jpeg',
      videoId: 'e-rw2cxFVLg'),
];

List<ShowItem> movie123 = [
  ShowItem(
      id: 6,
      name: 'Sound of Metal',
      videoId: 'VFOrGkAvjAE',
      imagePath:
          'https://images.squarespace-cdn.com/content/v1/53818302e4b06dea673351b9/1607363847346-XGADWLNVD71DORAGAI1Q/ke17ZwdGBToddI8pDm48kFTEgwhRQcX9r3XtU0e50sUUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcW7uEhC96WQdj-SwE5EpM0lAopPba9ZX3O0oeNTVSRxdHAmtcci_6bmVLoSDQq_pb/Sound%2BOf%2BMetal%2Bbanner.jpg'),
  ShowItem(
      id: 7,
      name: 'Terminator 2',
      videoId: 'CRRlbK5w8AE',
      imagePath:
          'https://primevideoaanbod.nl/wp-content/uploads/2019/12/Terminator-2-Judgment-Day-Amazon-Prime-Video.jpg'),
  ShowItem(
      id: 8,
      name: 'The Founder',
      videoId: 'AX2uz2XYkbo',
      imagePath:
          'https://images-na.ssl-images-amazon.com/images/S/sgp-catalog-images/region_US/lionsgate-7DD6-241F-EA57-6AF1-9CA7-B-Full-Image_GalleryCover-en-US-1490904271230._UY500_UX667_RI_VtH1Qd3ooLDX3TihTT274k1YDrenzZmd_TTW_.jpg'),
];
