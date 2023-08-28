import 'package:flutter/material.dart';
import 'package:recipe_ranger_app/models/recipe.dart';
import 'package:recipe_ranger_app/screens/recipe_details_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem({
    super.key,
    required this.recipe,
  });

  String get complexityText {
    return recipe.complexity.name[0].toUpperCase() +
        recipe.complexity.name.substring(1);
  }

  String get affordabilityText {
    return recipe.affordability.name[0].toUpperCase() +
        recipe.affordability.name.substring(1);
  }

  void selectRecipe(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => RecipeDetailsScreen(
          recipe: recipe,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectRecipe(context),
      child: Card(
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Colors.grey,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: recipe.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(recipe.imageUrl),
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    color: Colors.black54,
                    child: Text(
                      recipe.title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InfoWidget(
                    icon: Icons.schedule,
                    text: '${recipe.duration} min',
                  ),
                  InfoWidget(
                    icon: Icons.error_outline_rounded,
                    text: complexityText,
                  ),
                  InfoWidget(
                    icon: Icons.attach_money_outlined,
                    text: affordabilityText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
