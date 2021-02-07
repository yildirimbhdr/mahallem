import 'package:edufly/core/init/locator/locator.dart';
import 'package:edufly/core/models/category_button.dart';
import 'package:edufly/core/models/notice.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';
import 'package:edufly/core/repositories/category_button_repository.dart';
import 'package:edufly/core/repositories/notice_repository.dart';
import 'package:flutter/foundation.dart';

class NoticeModel with ChangeNotifier {
  List<Notice> _notices;
  NoticeRepository _noticeRepository = locator<NoticeRepository>();

  List<Notice> get notices => _notices;

  Future<Validate> getNotices(String quarterId) async {
    Validate validate = await _noticeRepository.getNotices(quarterId);
    return validate;
  }
   Future<Validate> addNotice(String title , String description , MyUser user) async {
    Validate validate = await _noticeRepository.addNotice(title , description , user );
    return validate;
  }
}
