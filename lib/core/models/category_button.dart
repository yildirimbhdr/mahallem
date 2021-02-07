class CategoryButton {
  int buttonId;
  String buttonTitle;
  String buttonImageUrl;

  CategoryButton({this.buttonId, this.buttonTitle, this.buttonImageUrl});

  CategoryButton.fromJson(Map<String, dynamic> json) {
    buttonId = json['buttonId'];
    buttonTitle = json['buttonTitle'];
    buttonImageUrl = json['buttonImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buttonId'] = this.buttonId;
    data['buttonTitle'] = this.buttonTitle;
    data['buttonImageUrl'] = this.buttonImageUrl;
    return data;
  }
}