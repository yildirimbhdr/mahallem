import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edufly/core/base/repository_base.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';

class NoticeRepository extends RepositoryBase {
  Future<Validate> getNotices(String quarterId) async {
    Validate validate = await firebaseCloudFireStoreServices.getNotices(quarterId);
    return validate;
  }

  Future<Validate> addNotice(
      String title, String description, MyUser user) async {
    Validate validate = await firebaseCloudFireStoreServices.addNotices(
        title, description, user);
    return validate;
  }
}
