import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServices {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  uploadPostPhoto(File file, String postId, String quartedId) async {
    UploadTask task = firebaseStorage
        .ref()
        .child("posts")
        .child(quartedId)
        .child(postId)
        .putFile(file);
        await Future.delayed(Duration(seconds: 2));
    String url = await task.snapshot.ref.getDownloadURL();
    print(url);
    return url;
  }

    uploadUserPhoto(String userId , File image) async {
    UploadTask task = firebaseStorage
        .ref()
        .child("users")
        .child(userId)
        .child(userId)
        .putFile(image);
        await Future.delayed(Duration(seconds: 2));
    String url = await task.snapshot.ref.getDownloadURL();
    return url;
  }
}
