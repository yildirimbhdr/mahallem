import 'package:edufly/core/components/social_media_post_widget.dart';
import 'package:edufly/core/models/post.dart';
import 'package:edufly/core/models/validate.dart';
import 'package:edufly/core/viewModels/post_model.dart';
import 'package:edufly/core/viewModels/user_model.dart';
import 'package:edufly/view/screens/homeView/socialNetworkPage/social_network_post_add_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SocialNetworkPage extends StatefulWidget {
  @override
  _SocialNetworkPageState createState() => _SocialNetworkPageState();
}

class _SocialNetworkPageState extends State<SocialNetworkPage> {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserModel>(context);
    return Consumer<PostModel>(
      builder: (context, postModel, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                      create: (context) => PostModel(),
                      child: SocialNetworkPostAddPage()),
                ),
              );
            },
          ),
          body: ListView(
            children: [
              Divider(),

              Text(
                "Sosyal ağ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenUtil().setSp(40),
                ),
              ),
              Divider(),
              FutureBuilder<Validate>(
                future: postModel.getPost(_userModel.user.quarterId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.data["posts"].length,
                        itemBuilder: (context, index) {
                          Post post = snapshot.data.data["posts"][index];
                          return SocialMediaPostWidget(
                            description: post.postTitle,
                            imageUrl: post.postImageUrl,
                            userName: post.postSharedByName,
                            userImageUrl: post.postSharedByImageUrl,
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget get addTitle => Container(
        height: ScreenUtil().setHeight(200),
        color: Colors.blue,
      );
}
