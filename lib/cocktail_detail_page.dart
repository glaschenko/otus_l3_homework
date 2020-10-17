import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';

class CocktailDetailPage extends StatelessWidget {
  static const MAIN_FONT = "SF Pro Text";

  const CocktailDetailPage(this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    var columns = Column(
        children: <Widget>[
          _buildImageFrame(),
          _buildCocktailDetailsFrame(),
          _buildCocktailIngredientsFrame(),
          _buildRatingFrame()]);
    return SingleChildScrollView(child: Center(child: columns));

    /// TODO: Сделать верстку экрана "Карточка коктейля" по модели Cocktail cocktail
    /// Ссылка на макет
    /// https://www.figma.com/file/d2JJUBFu7Dg0HOV30XG7Z4/OTUS-FLUTTER.-%D0%A3%D1%80%D0%BE%D0%BA-3-%D0%94%D0%97?node-id=20%3A590
    ///для того что бы весь контент поместился, необходимо использовать SingleChildScrollView()
    ///
    ///
  }

  Widget _buildImageFrame() {
    return Stack(children: <Widget>[
      Image.network(cocktail.drinkThumbUrl),
      Container(
          height: 343,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00000000), Color(0xDD000000)])))
    ]);
  }

  Widget _buildCocktailDetailsFrame() {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(cocktail.name,
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: MAIN_FONT)),
            SizedBox(height: 10),
            Text("id:${cocktail.id}",
                style: TextStyle(
                    color: Color(0xFF848396),
                    fontSize: 13,
                    fontFamily: MAIN_FONT)),
            ..._createCocktailDetailsEntry(
                "Категория коктейля", cocktail.category.value),
            ..._createCocktailDetailsEntry(
                "Тип коктейля", cocktail.cocktailType.value),
            ..._createCocktailDetailsEntry(
                "Тип стекла", cocktail.glassType.value),
          ]),
      color: Color(0xFF1A1927),
      padding: EdgeInsets.fromLTRB(32, 33, 0, 0),
      width: double.infinity,
      height: 300,
    );
  }

  Widget _buildCocktailIngredientsFrame() {
    return Container(
        color: Colors.black,
        width: double.infinity,
        child: Column(
          children: _generateIngredientsEntries(),
        )
    );
  }

  Widget _buildRatingFrame() {
    return Container(
      height: 113,
      width: double.infinity,
      color: Color(0xFF1A1927),
      child: Row(
          children: _generateStarWidgets()
      ),
    );
  }

  List<Widget> _createCocktailDetailsEntry(String sectionName,
      String sectionContent) {
    var res = List<Widget>();
    res.add(SizedBox(height: 20));
    res.add(
      Text(sectionName,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontFamily: MAIN_FONT)),
    );
    res.add(SizedBox(height: 8));
    res.add(Container(
        padding: EdgeInsets.fromLTRB(18, 6, 18, 6),
        decoration: BoxDecoration(
            color: Color(0xFF15151C),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Text(sectionContent,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontFamily: MAIN_FONT))));
    return res;
  }

  List<Widget> _generateIngredientsEntries() {
    var res = List<Widget>();
    for (var each in cocktail.ingredients) {
      res.add(
          Text(each.ingredientName, style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: MAIN_FONT,
              decoration: TextDecoration.underline))
      );
    }
    return res;
  }

  List<Widget> _generateStarWidgets() {
    var res = List<Widget>();
    _addStar(res, true);
    _addStar(res, true);
    _addStar(res, true);
    _addStar(res, false);
    _addStar(res, false);
    return res;
  }

  void _addStar(List<Widget> res, bool ticked) {
    res
      ..add(SizedBox(width: 16,))
      ..add(_generateStarWidget(ticked));
    }

  Widget _generateStarWidget(bool ticked) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          color: Color(0xFF2A293A),
          borderRadius: BorderRadius.all(Radius.circular(24))),
      alignment: Alignment.center,
      child: Icon(
          Icons.star,
          color: ticked ? Colors.white : Color(0xFF1A1927),
          size: 32
      ),
    );
  }
}

