import 'package:flutter_mvp/home_contact.dart';

class HomePresenter implements Presenter{
  Model _model;
  View _view;
  HomePresenter(this._model, this._view);
  @override
  Future viewDisplayed() async{
    List<Item> items = await _model.getItems();
    _view.showItems(items);
    for(var item in items){
      _view.showImageForItem(await _model.getImageForItems(item));
    }
  }
  
}