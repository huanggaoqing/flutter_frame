// To parse this JSON data, do
//
//     final detail = detailFromJson(jsonString);

import 'dart:convert';

Detail detailFromJson(String str) => Detail.fromJson(json.decode(str));

String detailToJson(Detail data) => json.encode(data.toJson());

class Detail {
    Detail({
        required this.courseName,
        required this.courseDifficulty,
        required this.courseExtInfoObj,
        required this.simpleUserInfo,
        required this.trainCourseNum,
        required this.comboNum,
        required this.perfectNum,
        required this.goodNum,
        required this.okNum,
        this.bestActionName,
        this.bestSkeletonImg,
        this.bestSkeletonVideo,
        this.bestSkeletonGif,
        required this.beginAt,
        required this.endAt,
        required this.weekday,
        required this.monday,
        required this.sunday,
        required this.courseScore,
        this.courseScoreShowLevel,
        this.highlightMoment,
        required this.newRecord,
        required this.likeNum,
        required this.danmuNum,
        required this.trainingMinutes,
        required this.trainingCount,
        required this.trainingKcal,
        required this.positiveWords,
        required this.weeklyRank,
    });

    String courseName;
    String courseDifficulty;
    CourseExtInfoObj courseExtInfoObj;
    SimpleUserInfo simpleUserInfo;
    int trainCourseNum;
    int comboNum;
    int perfectNum;
    int goodNum;
    int okNum;
    dynamic bestActionName;
    dynamic bestSkeletonImg;
    dynamic bestSkeletonVideo;
    dynamic bestSkeletonGif;
    String beginAt;
    String endAt;
    String weekday;
    DateTime monday;
    DateTime sunday;
    int courseScore;
    dynamic courseScoreShowLevel;
    dynamic highlightMoment;
    bool newRecord;
    int likeNum;
    int danmuNum;
    int trainingMinutes;
    int trainingCount;
    int trainingKcal;
    String positiveWords;
    WeeklyRank weeklyRank;

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        courseName: json["courseName"],
        courseDifficulty: json["courseDifficulty"],
        courseExtInfoObj: CourseExtInfoObj.fromJson(json["courseExtInfoObj"]),
        simpleUserInfo: SimpleUserInfo.fromJson(json["simpleUserInfo"]),
        trainCourseNum: json["trainCourseNum"],
        comboNum: json["comboNum"],
        perfectNum: json["perfectNum"],
        goodNum: json["goodNum"],
        okNum: json["okNum"],
        bestActionName: json["bestActionName"],
        bestSkeletonImg: json["bestSkeletonImg"],
        bestSkeletonVideo: json["bestSkeletonVideo"],
        bestSkeletonGif: json["bestSkeletonGif"],
        beginAt: json["beginAt"],
        endAt: json["endAt"],
        weekday: json["weekday"],
        monday: DateTime.parse(json["monday"]),
        sunday: DateTime.parse(json["sunday"]),
        courseScore: json["courseScore"],
        courseScoreShowLevel: json["courseScoreShowLevel"],
        highlightMoment: json["highlightMoment"],
        newRecord: json["newRecord"],
        likeNum: json["likeNum"],
        danmuNum: json["danmuNum"],
        trainingMinutes: json["trainingMinutes"],
        trainingCount: json["trainingCount"],
        trainingKcal: json["trainingKcal"],
        positiveWords: json["positiveWords"],
        weeklyRank: WeeklyRank.fromJson(json["weeklyRank"]),
    );

    Map<String, dynamic> toJson() => {
        "courseName": courseName,
        "courseDifficulty": courseDifficulty,
        "courseExtInfoObj": courseExtInfoObj.toJson(),
        "simpleUserInfo": simpleUserInfo.toJson(),
        "trainCourseNum": trainCourseNum,
        "comboNum": comboNum,
        "perfectNum": perfectNum,
        "goodNum": goodNum,
        "okNum": okNum,
        "bestActionName": bestActionName,
        "bestSkeletonImg": bestSkeletonImg,
        "bestSkeletonVideo": bestSkeletonVideo,
        "bestSkeletonGif": bestSkeletonGif,
        "beginAt": beginAt,
        "endAt": endAt,
        "weekday": weekday,
        "monday": "${monday.year.toString().padLeft(4, '0')}-${monday.month.toString().padLeft(2, '0')}-${monday.day.toString().padLeft(2, '0')}",
        "sunday": "${sunday.year.toString().padLeft(4, '0')}-${sunday.month.toString().padLeft(2, '0')}-${sunday.day.toString().padLeft(2, '0')}",
        "courseScore": courseScore,
        "courseScoreShowLevel": courseScoreShowLevel,
        "highlightMoment": highlightMoment,
        "newRecord": newRecord,
        "likeNum": likeNum,
        "danmuNum": danmuNum,
        "trainingMinutes": trainingMinutes,
        "trainingCount": trainingCount,
        "trainingKcal": trainingKcal,
        "positiveWords": positiveWords,
        "weeklyRank": weeklyRank.toJson(),
    };
}

class CourseExtInfoObj {
    CourseExtInfoObj({
        required this.trainSiteList,
        required this.trainFunctionList,
        required this.trainInstrumentList,
        required this.personalizedLabelList,
        this.leadsCourseStyle,
        this.leadsCourseLabel,
        this.bgmType,
        required this.coverImage,
        required this.difficultyLabel,
        required this.labelList,
        required this.trainSiteIconList,
    });

    List<String> trainSiteList;
    List<dynamic> trainFunctionList;
    List<dynamic> trainInstrumentList;
    List<dynamic> personalizedLabelList;
    dynamic leadsCourseStyle;
    dynamic leadsCourseLabel;
    dynamic bgmType;
    String coverImage;
    String difficultyLabel;
    List<String> labelList;
    List<String> trainSiteIconList;

    factory CourseExtInfoObj.fromJson(Map<String, dynamic> json) => CourseExtInfoObj(
        trainSiteList: List<String>.from(json["trainSiteList"].map((x) => x)),
        trainFunctionList: List<dynamic>.from(json["trainFunctionList"].map((x) => x)),
        trainInstrumentList: List<dynamic>.from(json["trainInstrumentList"].map((x) => x)),
        personalizedLabelList: List<dynamic>.from(json["personalizedLabelList"].map((x) => x)),
        leadsCourseStyle: json["leadsCourseStyle"],
        leadsCourseLabel: json["leadsCourseLabel"],
        bgmType: json["bgmType"],
        coverImage: json["coverImage"],
        difficultyLabel: json["difficultyLabel"],
        labelList: List<String>.from(json["labelList"].map((x) => x)),
        trainSiteIconList: List<String>.from(json["trainSiteIconList"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "trainSiteList": List<dynamic>.from(trainSiteList.map((x) => x)),
        "trainFunctionList": List<dynamic>.from(trainFunctionList.map((x) => x)),
        "trainInstrumentList": List<dynamic>.from(trainInstrumentList.map((x) => x)),
        "personalizedLabelList": List<dynamic>.from(personalizedLabelList.map((x) => x)),
        "leadsCourseStyle": leadsCourseStyle,
        "leadsCourseLabel": leadsCourseLabel,
        "bgmType": bgmType,
        "coverImage": coverImage,
        "difficultyLabel": difficultyLabel,
        "labelList": List<dynamic>.from(labelList.map((x) => x)),
        "trainSiteIconList": List<dynamic>.from(trainSiteIconList.map((x) => x)),
    };
}

class SimpleUserInfo {
    SimpleUserInfo({
        required this.userId,
        required this.nickName,
        required this.avatarUrl,
    });

    int userId;
    String nickName;
    String avatarUrl;

    factory SimpleUserInfo.fromJson(Map<String, dynamic> json) => SimpleUserInfo(
        userId: json["userId"],
        nickName: json["nickName"],
        avatarUrl: json["avatarUrl"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "nickName": nickName,
        "avatarUrl": avatarUrl,
    };
}

class WeeklyRank {
    WeeklyRank({
        required this.myRank,
        required this.rankList,
    });

    int myRank;
    List<RankList> rankList;

    factory WeeklyRank.fromJson(Map<String, dynamic> json) => WeeklyRank(
        myRank: json["myRank"],
        rankList: List<RankList>.from(json["rankList"].map((x) => RankList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "myRank": myRank,
        "rankList": List<dynamic>.from(rankList.map((x) => x.toJson())),
    };
}

class RankList {
    RankList({
        required this.userId,
        required this.nickName,
        required this.avatarUrl,
        required this.courseScore,
        required this.rank,
        this.order,
    });

    int userId;
    String nickName;
    String avatarUrl;
    int courseScore;
    int rank;
    dynamic order;

    factory RankList.fromJson(Map<String, dynamic> json) => RankList(
        userId: json["userId"],
        nickName: json["nickName"],
        avatarUrl: json["avatarUrl"],
        courseScore: json["courseScore"],
        rank: json["rank"],
        order: json["order"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "nickName": nickName,
        "avatarUrl": avatarUrl,
        "courseScore": courseScore,
        "rank": rank,
        "order": order,
    };
}
