import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edufly/core/models/notice.dart';
import 'package:edufly/core/models/post.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';

class FirebaseCloudFireStoreServices {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  signIn(String identificationNumber, String quarterId) async {
    print(identificationNumber);
    DocumentSnapshot snap = await firebaseFirestore
        .collection("quarters")
        .doc(quarterId)
        .collection("persons")
        .doc(identificationNumber)
        .get();
    MyUser user = MyUser.fromJson(snap.data());
    print(user.toJson());
    return Validate(success: true, data: user.toJson(), message: "Başarılı");
  }

  saveUser(MyUser user) async {
    await firebaseFirestore.collection("users").add(user.toJson());
  }

  getUserFromId(String id) async {
    QuerySnapshot querySnap = await firebaseFirestore
        .collection("users")
        .where("userId", isEqualTo: id)
        .get();
    if (querySnap.docs.length > 0) {
      /* DocumentSnapshot doc = querySnap.docs.first;
      MyUser user = MyUser.fromJson(doc.data());

      user.password == null ? user.password = "" : user.password;
      user.userName == null
          ? user.userName = user.email.split("@")[0]
          : user.userName;

      return Validate(message: "Başarılı", data: user.toJson(), success: true);*/
    } else {
      return Validate(
          message: "Böyle bir kullanıcı bulunamadı!", data: {}, success: false);
    }
  }

  Future<Validate> getNotices(String id) async {
    List<Notice> notices = [];
    QuerySnapshot querySnap = await firebaseFirestore
        .collection("notice")
        .where("quarterId", isEqualTo: id)
        .get();
    if (querySnap.docs.length > 0) {
      for (DocumentSnapshot snap in querySnap.docs) {
        notices.add(Notice.fromJson(snap.data()));
      }

      if (notices == null) notices = [];

      return Validate(
          message: "Böyle bir kullanıcı bulunamadı!",
          data: {"notices": notices},
          success: false);
    } else {
      return Validate(
          message: "Böyle bir kullanıcı bulunamadı!",
          data: {"notices": []},
          success: false);
    }
  }

  Future<Validate> addNotices(
      String title, String description, MyUser user) async {
    print(user.toJson());
    DocumentReference reference =
        await firebaseFirestore.collection("notice").add({}).then(
      (value) async {
        await firebaseFirestore.collection("notice").doc(value.id).update(
            Notice(
                    noticeByShare: user.userId,
                    noticeId: value.id,
                    noticeImageUrl: "",
                    noticeTitle: title,
                    quarterId: user.quarterId ?? "0",
                    noticeDescription: description)
                .toJson());
      },
    );
  }

  Future<Validate> getPosts(String id) async {
    List<Post> notices = [];
    print(id);

    QuerySnapshot querySnap = await firebaseFirestore
        .collection("posts")
        .where("quarterId", isEqualTo: id)
        .get();
    if (querySnap.docs.length > 0) {
      for (DocumentSnapshot snap in querySnap.docs) {
        notices.add(Post.fromJson(snap.data()));
      }
      if(notices == null) notices = [];
      return Validate(
          message: "Böyle bir kullanıcı bulunamadı!",
          data: {"posts": notices},
          success: false);
    } else {
      return Validate(
          message: "Böyle bir kullanıcı bulunamadı!", data: {"posts" : []}, success: false);
    }
  }

  addPerson(
      String personName,
      String personEmail,
      String personIdentificationNumber,
      String personPhoneNumber,
      MyUser user) async {
        print(user.quarterId);
    await firebaseFirestore
        .collection("quarters")
        .doc(user.quarterId)
        .collection("persons")
        .doc(personIdentificationNumber)
        .set(MyUser(
                identificationNumber: personIdentificationNumber,
                isAdmin: false,
                quarterId: user.quarterId,
                userEmail: personEmail,
                userId: personIdentificationNumber,
                quarterName: user.quarterName,
                userName: personName)
            .toJson());
  }

  addPost(MyUser user, String title) async {
    String id;
    await firebaseFirestore.collection("posts").add({}).then((value) async {
      await firebaseFirestore.collection("posts").doc(value.id).set(Post(
            postId: value.id,
            postImageUrl: "",
            postSharedById: user.userId,
            postTitle: title,
            quarterId: user.quarterId,
            postSharedByName: user.userName,
            postSharedByImageUrl: user.imageUrl
          ).toJson());
      id = value.id;
    });
    return Validate(
        success: true,
        data: Post(
                postId: id,
                postTitle: title,
                postSharedById: user.userId,
                postImageUrl: "",
                quarterId: user.quarterId)
            .toJson(),
        message: "Başarulı");
  }

  updatePostUrl(String imageUrl, String postId) async {
    await firebaseFirestore
        .collection("posts")
        .doc(postId)
        .update({"postImageUrl": imageUrl});
  }
    updateUserUrl(String imageUrl, String quarterId , String userId) async {
    await firebaseFirestore
        .collection("quarters")
        .doc(quarterId).collection("persons").doc(userId)
        .update({"imageUrl": imageUrl});
  }
}
