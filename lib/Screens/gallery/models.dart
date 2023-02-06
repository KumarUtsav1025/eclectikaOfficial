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
  DataModel("Short Dress", "asset/menu/gallery1.jpg", 300.8),
  DataModel("Office Formals", "asset/menu/gallery2.jpg", 245.2),
  DataModel("Casual Jeans", "asset/menu/gallery3.jpg", 168.2),
  DataModel("Jeans Skirt", "asset/menu/gallery4.jpg", 136.7),
  DataModel("Jeans Skirt", "asset/menu/gallery5.jpg", 136.7),
  DataModel("Jeans Skirt", "asset/menu/gallery6.jpg", 136.7),
  DataModel("Jeans Skirt", "asset/menu/gallery7.jpg", 136.7),
];