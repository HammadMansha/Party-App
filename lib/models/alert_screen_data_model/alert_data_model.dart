
import 'dart:convert';


class AlertJobsModel {
  List<Result> results;
  int page;
  int limit;
  int totalPages;
  int totalResults;

  AlertJobsModel({
    required this.results,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.totalResults,
  });

  factory AlertJobsModel.fromJson(Map<String, dynamic> json) => AlertJobsModel(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    totalResults: json["totalResults"],
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "totalPages": totalPages,
    "totalResults": totalResults,
  };
}

class Result {
  String source;
  String platform;
  String channel;
  String language;
  String programName;
  String programType;
  DateTime programDate;
  String programTime;
  DateTime broadcastDate;
  String thumbnailPath;
  String videoPath;
  String jobId;
  Shared shared;
  String id;

  Result({
    required this.source,
    required this.platform,
    required this.channel,
    required this.language,
    required this.programName,
    required this.programType,
    required this.programDate,
    required this.programTime,
    required this.broadcastDate,
    required this.thumbnailPath,
    required this.videoPath,
    required this.jobId,
    required this.shared,
    required this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    source: json["source"],
    platform: json["platform"],
    channel: json["channel"],
    language: json["language"],
    programName: json["programName"],
    programType: json["programType"],
    programDate: DateTime.parse(json["programDate"]),
    programTime: json["programTime"],
    broadcastDate: DateTime.parse(json["broadcastDate"]),
    thumbnailPath: json["thumbnailPath"],
    videoPath: json["videoPath"],
    jobId: json["jobId"],
    shared: Shared.fromJson(json["shared"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "platform": platform,
    "channel": channel,
    "language": language,
    "programName": programName,
    "programType": programType,
    "programDate": programDate.toIso8601String(),
    "programTime": programTime,
    "broadcastDate": broadcastDate.toIso8601String(),
    "thumbnailPath": thumbnailPath,
    "videoPath": videoPath,
    "jobId": jobId,
    "shared": shared.toJson(),
    "id": id,
  };
}

class Shared {
  SharedBy sharedBy;
  String platform;
  DateTime sharedTime;
  dynamic voiceNote;
  bool isHidden;
  List<SharedTo> sharedTo;
  String shareType;
  SharedData sharedData;

  Shared({
    required this.sharedBy,
    required this.platform,
    required this.sharedTime,
    this.voiceNote,
    required this.isHidden,
    required this.sharedTo,
    required this.shareType,
    required this.sharedData,
  });

  factory Shared.fromJson(Map<String, dynamic> json) => Shared(
    sharedBy: SharedBy.fromJson(json["sharedBy"]),
    platform: json["platform"],
    sharedTime: DateTime.parse(json["sharedTime"]),
    voiceNote: json["voiceNote"],
    isHidden: json["isHidden"],
    sharedTo: List<SharedTo>.from(json["sharedTo"].map((x) => SharedTo.fromJson(x))),
    shareType: json["shareType"],
    sharedData: SharedData.fromJson(json["sharedData"]),
  );

  Map<String, dynamic> toJson() => {
    "sharedBy": sharedBy.toJson(),
    "platform": platform,
    "sharedTime": sharedTime.toIso8601String(),
    "voiceNote": voiceNote,
    "isHidden": isHidden,
    "sharedTo": List<dynamic>.from(sharedTo.map((x) => x.toJson())),
    "shareType": shareType,
    "sharedData": sharedData.toJson(),
  };
}

class SharedBy {
  String id;
  String name;

  SharedBy({
    required this.id,
    required this.name,
  });

  factory SharedBy.fromJson(Map<String, dynamic> json) => SharedBy(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class SharedData {
  String title;
  String comments;
  String startDuration;
  String endDuration;

  SharedData({
    required this.title,
    required this.comments,
    required this.startDuration,
    required this.endDuration,
  });

  factory SharedData.fromJson(Map<String, dynamic> json) => SharedData(
    title: json["title"],
    comments: json["comments"],
    startDuration: json["startDuration"],
    endDuration: json["endDuration"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "comments": comments,
    "startDuration": startDuration,
    "endDuration": endDuration,
  };
}

class SharedTo {
  DateTime time;
  bool read;
  String id;
  String name;

  SharedTo({
    required this.time,
    required this.read,
    required this.id,
    required this.name,
  });

  factory SharedTo.fromJson(Map<String, dynamic> json) => SharedTo(
    time: DateTime.parse(json["time"]),
    read: json["read"],
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "time": time.toIso8601String(),
    "read": read,
    "id": id,
    "name": name,
  };
}
