import 'package:flutter/material.dart';
import 'package:gastro_galaxy/models/ingredient.dart';
import 'package:gastro_galaxy/models/recipe.dart';
import 'package:gastro_galaxy/services/recipe_service.dart';
import 'package:http/http.dart';

class RecipeStore {
  final RecipeService _service = RecipeService();

  GlobalKey<FormState> recipesFormKey = GlobalKey<FormState>();
  TextEditingController recipesNameController = TextEditingController();
  TextEditingController recipesDescriptionController = TextEditingController();
  TextEditingController recipesImageController = TextEditingController();
  List<Ingredient> markedIngredients = [];
  late List<Recipe> recipes = [];
  late Recipe? recipe;

  Future<List<Recipe>?> loadAll() {
    return _service.getRecipes();
  }

  Future<Recipe?> load(int id) async {
    return await _service.getRecipe(id);
  }

  Future<bool> insertRecipe() async {
    try {
      Response? response = await _service.createRecipe(
        Recipe(
          name: recipesNameController.text,
          description: recipesDescriptionController.text,
          longDescription: recipesDescriptionController.text,
          url: recipesImageController.text,
          categoryId: 1,
        ),
      );

      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateRecipe() async {
    try {
      Response? response = await _service.createRecipe(
        Recipe(
          name: recipesNameController.text,
          description: recipesDescriptionController.text,
          longDescription: recipesDescriptionController.text,
          url: recipesImageController.text,
          categoryId: 1,
        ),
      );

      if (response != null && response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
