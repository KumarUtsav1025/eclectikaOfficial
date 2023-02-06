class DataModel {
  final String title;
  final String imageName;
  final double price;
  DataModel(
    this.title,
    this.imageName,
    this.price,
  );
}

List<DataModel> dataList = [
  DataModel("Gallery 1", "asset/menu/gallery1.jpg", 300.8),
  DataModel("Gallery 2", "asset/menu/gallery2.jpg", 245.2),
  DataModel("Gallery 3", "asset/menu/gallery3.jpg", 168.2),
  DataModel("Gallery 4", "asset/menu/gallery4.jpg", 136.7),
  DataModel("Gallery 5", "asset/menu/gallery5.jpg", 136.7),
  DataModel("Gallery 6", "asset/menu/gallery6.jpg", 136.7),
  DataModel("Gallery 7", "asset/menu/gallery7.jpg", 136.7),
];