import 'dart:async';
import 'dart:typed_data';
abstract class View{
  void showItems(List<Item> items);
  void showImageForItem(Item item);
}
abstract class Model{
  Future<List<Item>> getItems();
  Future<Item> getImageForItems(Item item);
}
abstract class Presenter{
  Future viewDisplayed();
}

class Item{
  final int id;
  final String title;
  final int numImages;
  Uint8List currentImage;
  int currentImageNumber;
  Item(this.id,this.title,this.numImages);
}