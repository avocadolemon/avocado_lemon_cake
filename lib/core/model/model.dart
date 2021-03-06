class MyGroup {
  final String image;
  final String name;
  final String count;
  MyGroup({
    required this.image,
    required this.name,
    required this.count,
  });
}

class AddGroupModel {
  final String image;
  AddGroupModel({
    required this.image,
  });
}

class MenuModel {
  final String text;
  bool isSelected;
  MenuModel({
    required this.text,
    required this.isSelected,
  });
}
