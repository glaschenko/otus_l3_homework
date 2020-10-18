import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework/models/models.dart';
import 'package:homework/src/cocktail_image.dart';
import 'package:homework/src/cocktail_ingredients.dart';
import 'package:homework/src/cocktail_rating.dart';
import 'package:homework/src/cocktail_details.dart';

import 'src/cocktail_instructions.dart';

class CocktailDetailPage extends StatelessWidget {
  static const MAIN_FONT = "SF Pro Text";

  const CocktailDetailPage(this.cocktail, {
    Key key,
  }) : super(key: key);

  final Cocktail cocktail;

  @override
  Widget build(BuildContext context) {
    var columns = Column(children: <Widget>[
      CocktailImage(cocktail),
      CocktailDetails(cocktail, MAIN_FONT),
      CocktailIngredients(cocktail, MAIN_FONT),
      CocktailInstructions(cocktail, MAIN_FONT),
      CocktailRating(cocktail, 3)
    ]);
    return SingleChildScrollView(child: Center(child: columns));
  }
}
