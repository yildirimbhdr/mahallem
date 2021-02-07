class Post {
  String postId;
  String postImageUrl;
  String postTitle;
  String postSharedById;
  String quarterId;
  String postSharedByName;
  String postSharedByImageUrl;
  Post(
      {this.postId,
      this.postImageUrl,
      this.postTitle,
      this.postSharedById,
      this.quarterId,
      this.postSharedByName,
      this.postSharedByImageUrl});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    postImageUrl = json['postImageUrl'];
    postTitle = json['postTitle'];
    postSharedById = json['postSharedById'];
    quarterId = json['quarterId'];
    postSharedByName = json['postSharedByName'];
    postSharedByImageUrl = json['postSharedByImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['postImageUrl'] = this.postImageUrl;
    data['postTitle'] = this.postTitle;
    data['postSharedById'] = this.postSharedById;
    data['quarterId'] = this.quarterId;
    data['postSharedByName'] = this.postSharedByName;
    data['postSharedByImageUrl'] = this.postSharedByImageUrl;
    return data;
  }
}
