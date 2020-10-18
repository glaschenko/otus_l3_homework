import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework/models/models.dart';

class CocktailImage extends StatelessWidget {
  final Cocktail cocktail;

  CocktailImage(this.cocktail);

  @override
  Widget build(BuildContext context) {
    var image = Image.network(cocktail.drinkThumbUrl);

    return Stack(children: <Widget>[
      image,
      Container(
          height: 385, //todo надо получать реальный размер изображения или скейлить его
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00000000), Color(0xDD000000)]))),
      Row(children: [
        Expanded(
            child: Container(
                padding: EdgeInsets.fromLTRB(28, 38, 0, 0),
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                  textDirection: TextDirection.rtl,
                ))),
        Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(0, 38, 19, 0),
            child: SvgPicture.asset(
              "assets/logout.svg",
              width: 18,
              height: 18,
              color: Colors.white,
            ))
      ])
    ]);
  }

}
