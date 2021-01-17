import 'package:flutter/material.dart';

import 'home_contact.dart';
import 'home_model.dart';
import 'home_presenter.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();

}
// [...]

class _HomePageState extends State<HomePage> implements View {

  List<Item> _items;
  HomePresenter _presenter;
  bool _loadingInProgress;

  @override
  void initState() {
    super.initState();
    _loadingInProgress = true;
    _presenter = new HomePresenter(new HomeModel(), this);
    _presenter.viewDisplayed();
  }

  // [...]

  Widget build(BuildContext context) {
    if (_loadingInProgress) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: _items.map((Item item) {
          return _buildListRow(item);
        }).toList(),
      );
    }
  }

  Widget _buildListRow(Item item) {
    return new Container(
        margin: new EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new Expanded(child: new Text(item.title)),
            new Container(
                width: 50.0,
                height: 50.0,
                child: item.currentImage != null?
                new Image.memory(item.currentImage)
                    :new Center(child: new Text('No image available')))
          ],
        )
    );
  }

  @override
  void showImageForItem(Item item) {
    setState(() {
      for (var it in _items) {
        if (it.id == item.id) {
          it.currentImage = item.currentImage;
        }
      }
      _loadingInProgress = false;
    });
  }

  @override
  void showItems(List<Item> items) {
    setState(() {
      _items = items;
      _loadingInProgress = false;
    });
  }







}