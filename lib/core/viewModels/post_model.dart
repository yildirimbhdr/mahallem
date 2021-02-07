import 'dart:io';

import 'package:edufly/core/init/locator/locator.dart';

import 'package:edufly/core/models/post.dart';
import 'package:edufly/core/models/user.dart';
import 'package:edufly/core/models/validate.dart';

import 'package:edufly/core/repositories/post_repository.dart';
import 'package:flutter/foundation.dart';

class PostModel with ChangeNotifier {
  List<Post> _posts;
  PostRepository _noticeRepository = locator<PostRepository>();

  List<Post> get post => _posts;

  Future<Validate> getPost(quarterId) async {
    Validate validate = await _noticeRepository.getPosts(quarterId);
    return validate;
  }

   Future<Validate> addPost(MyUser user , String title , File image) async{
        Validate validate = await _noticeRepository.addPost(user , title  , image);
    return validate;
  }
}
