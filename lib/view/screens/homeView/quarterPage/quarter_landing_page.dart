import 'package:edufly/core/viewModels/quarter_model.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/homeView/quarterPage/quarterPageForPerson/quarter_page.dart';
import 'package:edufly/view/screens/homeView/quarterPage/quarterPageForAdmin/quarter_page_for_admin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuarterLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    return _userModel.user.isAdmin == null
        ? QuarterPage()
        : _userModel.user.isAdmin
            ? ChangeNotifierProvider(
                create: (context) => QuarterModel(),
                child: QuarterPageForAdmin())
            : QuarterPage();
  }
}
