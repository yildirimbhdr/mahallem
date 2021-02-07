import 'dart:io';

import 'package:edufly/core/init/locator/locator.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/repositories/quarter_repository.dart';
import 'package:flutter/foundation.dart';

class QuarterModel with ChangeNotifier {
  QuarterRepository _quarterRepository = locator<QuarterRepository>();

  addPerson(
      String personName,
      String personEmail,
      String personIdentificationNumber,
      String personPhoneNumber,
      File image,
      MyUser user) async {
    await _quarterRepository.addPerson(personName, personEmail,
        personIdentificationNumber, personPhoneNumber,image, user);
  }
}
