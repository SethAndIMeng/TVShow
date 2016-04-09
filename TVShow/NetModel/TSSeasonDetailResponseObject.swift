//
//  TSSeasonDetailResponseObject.swift
//  TVShow
//
//  Created by imeng on 16/4/7.
//  Copyright © 2016年 imeng. All rights reserved.
//
/*
{
    "code": "0000",
    "msg": "",
    "data": {
        "seasonDetail": {
            "seriesId": 32235,
            "playUrlList": [{
            "playLink": "http://api1.rrmj.tv/api/letvyun/letvmmsid.php?vid=47100710",
            "site": "acfun",
            "episodeSid": "10607",
            "id": 27848
            }],
            "sid": "465",
            "score": 7.9,
            "cat": "剧情 / 动作 / 科幻 / 奇幻 / 冒险",
            "actorList": [],
            "title": "闪电侠第二季",
            "brief": "本季首播时间：2015.10.711岁时，艾伦（格兰特·古斯汀 Grant Gustin 饰）的母亲离奇死亡，而他的父亲则被当成了凶手。之后，警探乔（杰西·马丁 Jesse L. Martin 饰）收留了孤苦伶仃的艾伦，在乔的耳濡目染之下，成年后的艾伦成为了一名CSI鉴证分析员，在此过程中，他一直没有放弃过对于母亲真正死因的调查。艾伦十分迷恋科学家哈里森（汤姆·加瓦那 Tom Cavanagh 饰）所研究的粒子加速器，然而，一场意外让加速器发生了爆炸，艾伦被击中陷入了昏迷。九个月后，终于苏醒的艾伦惊讶的发现自己体内产生了神奇的变化，因此而获得了特殊能力。随着时间的推移，艾伦开始明白，这个世界上，还有很多和自己一样拥有超能力的人存在，而保护市民的安全成为了他新的责任和任务。",
            "cover": "http://img.rrmj.tv/video/20151009/o_1444392315235.jpg",
            "enTitle": "The Flash",
            "playStatus": "每周三更新",
            "viewCount": 7190493,
            "isFocus": false,
            "siteList": [{
            "enSite": "acfun",
            "cnSite": "A站"
            }],
            "episode_brief": [{
            "sid": "7313",
            "text": "",
            "episode": "1"
            }],
            "recommend": [{
            "sid": "a2vxwynpe5m7",
            "score": 7.4,
            "cat": "剧情/动作/科幻",
            "title": "闪电侠 第一季",
            "finish": true,
            "upInfo": 23,
            "cover": "http://pic7.moretv.com.cn/20141009/20141009111626448.jpg",
            "enTitle": "The Flash",
            "seasonNo": 1,
            "id": 447
            }],
            "updateinfo": 17,
            "total": 19,
            "createTime": 1444392308000,
            "updateTime": 1459344081000,
            "createTimeStr": "10-09 20:05",
            "id": 465
        }
    }
}
*/
import Foundation

class TSSeasonDetailResponseObject: NSObject {
        var actorList : [AnyObject]!
        var brief : String!
        var cat : String!
        var cover : String!
        var createTime : Int!
        var createTimeStr : String!
        var enTitle : String!
        var episodeBrief : [TSEpisodeBrief]!
        var id : Int!
        var isFocus : Bool!
        var playStatus : String!
        var playUrlList : [TSPlayUrlList]!
        var recommend : [TSRecommend]!
        var score : Float!
        var seriesId : Int!
        var sid : String!
        var siteList : [TSSiteList]!
        var title : String!
        var total : Int!
        var updateTime : Int!
        var updateinfo : Int!
        var viewCount : Int!

}

class TSSiteList : NSObject{
    var cnSite : String!
    var enSite : String!
}

class TSRecommend : NSObject{
    var cat : String!
    var cover : String!
    var enTitle : String!
    var finish : Bool!
    var id : Int!
    var score : Float!
    var seasonNo : Int!
    var sid : String!
    var title : String!
    var upInfo : Int!
}

class TSPlayUrlList : NSObject{
    var episodeSid : String!
    var id : Int!
    var playLink : String!
    var site : String!
}

class TSEpisodeBrief : NSObject{
    var episode : String!
    var sid : String!
    var text : String!
}
