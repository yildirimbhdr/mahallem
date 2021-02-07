import 'package:edufly/core/init/locator/locator.dart';
import 'package:edufly/core/models/category_button.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';
import 'package:edufly/core/repositories/category_button_repository.dart';
import 'package:flutter/foundation.dart';

class CategoryButtonModel with ChangeNotifier {
  List<CategoryButton> _buttons;
  CategoryButtonRepository _userRepository =
      locator<CategoryButtonRepository>();

  List<CategoryButton> get buttons => _buttons;

  Future<Validate> getCategoryButtonFromFirebase() async {}
}
