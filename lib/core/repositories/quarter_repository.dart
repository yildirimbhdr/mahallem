import 'dart:io';

import 'package:edufly/core/base/repository_base.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';
import 'package:edufly/core/services/firebaseServices/firebase_cloud_firestore_services.dart';

class QuarterRepository extends RepositoryBase {
  addPerson(
      String personName,
      String personEmail,
      String personIdentificationNumber,
      String personPhoneNumber,
      File image,
      MyUser user) async {
    await firebaseCloudFireStoreServices.addPerson(personName, personEmail,
        personIdentificationNumber, personPhoneNumber, user);
    String url = await firebaseStorageServices.uploadUserPhoto(
        personIdentificationNumber, image);
        await firebaseCloudFireStoreServices.updateUserUrl(url ,user.quarterId , personIdentificationNumber);

  }
}
