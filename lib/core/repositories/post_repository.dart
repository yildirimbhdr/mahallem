import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edufly/core/base/repository_base.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';

class PostRepository extends RepositoryBase {
  Future<Validate> getPosts(String quarterId) async {
    Validate validate =
        await firebaseCloudFireStoreServices.getPosts(quarterId);
    return validate;
  }

  addPost(MyUser user, String title, File image) async {
    Validate validate =
        await firebaseCloudFireStoreServices.addPost(user, title);

    String url = await firebaseStorageServices.uploadPostPhoto(
        image, validate.data["postId"], validate.data["quarterId"]);


    await firebaseCloudFireStoreServices.updatePostUrl(
       url,  validate.data["postId"]);

    return validate;
  }
}
