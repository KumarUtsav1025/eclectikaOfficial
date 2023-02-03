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
  DataModel("Short Dress", "asset/menu/human.jpg", 300.8),
  DataModel("Office Formals", "asset/menu/human.jpg", 245.2),
  DataModel("Casual Jeans", "asset/menu/human.jpg", 168.2),
  DataModel("Jeans Skirt", "asset/menu/human.jpg", 136.7),
];