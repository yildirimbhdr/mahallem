class MyUser {
  String userId;
  String userName;
  String userEmail;
  String quarterId;
  String identificationNumber;
  bool isAdmin;
  String quarterName;
  String imageUrl;

  MyUser(
      {this.userId,
      this.userName,
      this.userEmail,
      this.quarterId,
      this.identificationNumber,this.isAdmin,this.imageUrl , this.quarterName});

  MyUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    quarterId = json['quarterId'];
    identificationNumber = json['identificationNumber'];
    isAdmin = json['isAdmin'];
    quarterName = json['quarterName'];
    imageUrl = json['imageUrl'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userEmail'] = this.userEmail;
    data['quarterId'] = this.quarterId;
    data['identificationNumber'] = this.identificationNumber;
    data['isAdmin'] = this.isAdmin;
    data['quarterName'] = this.quarterName;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  

}
