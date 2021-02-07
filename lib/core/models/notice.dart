class Notice {
  String noticeId;
  String noticeTitle;
  String noticeDescription;
  String noticeImageUrl;
  String noticeByShare;
  String quarterId;


  Notice(
      {this.noticeId,
      this.noticeTitle,
      this.noticeImageUrl,
      this.noticeByShare,
      this.quarterId,
      this.noticeDescription
      });

  Notice.fromJson(Map<String, dynamic> json) {
    noticeId = json['noticeId'];
    noticeTitle = json['noticeTitle'];
    noticeImageUrl = json['noticeImageUrl'];
    noticeByShare = json['noticeByShare'];
    quarterId = json['quarterId'];
    noticeDescription = json['noticeDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['noticeId'] = this.noticeId;
    data['noticeTitle'] = this.noticeTitle;
    data['noticeImageUrl'] = this.noticeImageUrl;
    data['noticeByShare'] = this.noticeByShare;
    data['quarterId'] = this.quarterId;
    data['noticeDescription'] = this.noticeDescription;
    return data;
  }
}