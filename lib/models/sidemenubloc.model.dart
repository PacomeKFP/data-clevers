part of models;


class SideBlock {
  String title = "";
  List<SideBlockItem> items = [];
  SideBlock(this.title, this.items);
}

class SideBlockItem {
  String title = "", itemId = "";
  SideBlockItem(this.title, this.itemId);
}