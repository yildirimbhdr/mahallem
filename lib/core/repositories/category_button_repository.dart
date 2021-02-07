import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edufly/core/base/repository_base.dart';
import 'package:edufly/core/models/category_button.dart';
import 'package:edufly/core/models/validate.dart';

class CategoryButtonRepository extends RepositoryBase {
  Future<Validate> getCategoryButtonFromFirebase() async {
    List<CategoryButton> buttons = [];
    QuerySnapshot snap = await firebaseCloudFireStoreServices.firebaseFirestore
        .collection("Categories")
        .get();
    for (DocumentSnapshot doc in snap.docs) {
      buttons.add(
        CategoryButton.fromJson(
          doc.data(),
        ),
      );
    }
    
  }
}
