import 'package:dio/dio.dart';
import 'package:reserly_manager/instances/dio_instance.dart';
import 'package:reserly_manager/models/category.dart';

class CategoryService {
  Future<List<Category>> getAll() async {
    try {
      Dio dio = DioInstance().instance;

      final response = await dio.get('/categories');
      print(response);
      print('LISTADO DE CATEGORIAS');
      CategoryResponse categories = CategoryResponse.fromJson(response.data);
      return categories.categories;
    } catch (error) {
      throw error;
    }
  }
}