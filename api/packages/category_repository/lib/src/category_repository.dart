import 'package:models/models.dart';

class CategoryRepository {
  Future<Category> getCategoryById(String categoryId) async {
    //TODO: Connect with the Database to retrieve the data by Category Id
    return Category.sampleData
        .firstWhere((category) => category.id == categoryId);
  }

  Future<List<Category>> getCategories() async {
    //TODO: Connect with the Database to retrieve the data by Category Id
    return Category.sampleData;
  }
}
