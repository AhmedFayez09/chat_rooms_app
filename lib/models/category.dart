class Category {
  static const String SportId = 'sports';
  static const String musicId = 'music';
  static const String moviesId = 'movies';

  late String title;
  late String image;

  Category(this.title, this.image);
  Category.get(String catId){
    title=catId;
    image='assets/images/$catId.png';
  }

  static List<Category> getCategories() {
    return [
      Category('Sports', 'assets/images/room_head.png'),
      Category('Music', 'assets/images/room_head.png'),
      Category('Movie', 'assets/images/room_head.png'),
    ];
  }
}
