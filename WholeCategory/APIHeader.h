//
//  APIHeader.h
//  RMXJY
//
//  Created by MacBooK on 16/3/4.
//  Copyright © 2016年 MacBooK. All rights reserved.
//

#ifndef APIHeader_h
#define APIHeader_h

#define BaseUrl_API @"http://192.168.1.172:8090/rmjysit"

//图片加载地址
#define ImgPath_API @"http://192.168.1.172:8090/rmjysit/imgpath"

//首页信息   
#define queryInfo_API @"/myIndexUserInfo/queryInfo"
#define Key_API @"999"
//意见反馈
#define addFeedback_API @"/feedback/addFeedback"
//栏目分类
#define getColumnClassification_API @"/homePage/getColumnClassification"
//根据类型查询剧目
#define searchRepertoire_API @"/homePage/searchRepertoire"
//剧目介绍
#define repertoireIntroduce_API @"/repertoire/repertoireIntroduce"
//剧目收藏
#define addCollection_API @"/myCollection/addCollection"
//剧目收藏取消
#define delCollection_API @"/myCollection/delCollection"
//剧目详情
#define repertoireDetails_API @"/repertoire/repertoireDetails"
//客户答疑
#define getanswerquestion_API @"/repertoire/getanswerquestion"
//提交答疑
#define answeringQuestion_API @"/repertoire/answeringQuestion"
//网友点评
#define getInfomation_API @"/repertoire/getInfomation"
//提交点评
#define addInfomation_API @"/repertoire/addInfomation"
//选择时间
#define selectTime_API @"/chooseMySeat/selectTime"
//选择区域
#define chooseSeatAare_API @"/chooseMySeat/chooseSeatAare"
//选择座位
#define chooseSeat_API @"/chooseMySeat/chooseSeat"
//剧目选座支付保存订单
#define chooseSeatOrderSave_API @"/orderManager/chooseSeatOrderSave"
//支付宝回调URL
#define  notify_API @"/alipayment/notify"
 //门票列表
#define myorderqueryInfo_API @"/myorder/queryInfo"
//订单详情
#define queryDetailInfo_API @"/myorder/queryDetailInfo"
//我的提问
#define  queryAnswerRequestInfo_API @"/myIndexUserInfo/queryAnswerRequestInfo"
//消息总数
#define queryMessageCount_API @"/myIndexUserInfo/queryMessageCount"
//消息通知
#define queryMessageInfo_API @"/myIndexUserInfo/queryMessageInfo"
//消息通知已读
#define updateMessageInfo_API @"/myIndexUserInfo/updateMessageInfo"
//我的收藏
#define queryCollectionPagelist_API @"/myCollection/queryCollectionPagelist"


//约艺演类型列表
#define myArtsGroups_API @"/myArtsGroupsApp/myArtsGroups"
//约艺演详情
#define myArtsGroupsDetailed_API @"/myArtsGroupsApp/myArtsGroupsDetailed"
//约艺演精彩作品展示
#define getGallery_API @"/myArtsGroupsApp/getGallery"
//明星人物展示
#define getStarPeopleList_API @"/myArtsGroupsApp/getStarPeopleList"
//出售艺演列表
#define getArts_API @"/myArtsGroupsApp/getArts"
//艺演预订
#define addPointMent_API @"/myArtsGroupsApp/addPointMent"


//我的文艺圈
#define myCircle_API @"/communityapp/myCircle"
//推荐文艺圈
#define recommendCircle_API @"/communityapp/recommendCircle"
//加入文艺圈
#define joinCircle_API @"/communityapp/joinCircle"
//圈子基本信息
#define ciecleDetails_API @"/communityapp/circleDetail"
//圈子主题列表信息
#define ciecleMessage_API @"/communityapp/getPostsListByCircleId"
//退出圈子
#define cancelCiecle_API @"/communityapp/exitCircle"
//发表话题（不带图片）
#define postMessage_API @"/communityapp/publishTopic"
//发表话题 (带图)
#define postMessageWithPic_API @"/communityapp/publishTopicPicture"
//话题明细
#define topicDetails_API @"/communityapp/topicDetail"
//帖子评价
#define evaluate_API @"/communityapp/queryCommentList"
//帖子评论发布
#define issueMessage_API @"/communityapp/addPhotosFreed"
//显示图片接口
#define showPic_API @"http://192.168.1.172:8090/rmjysit/imgpath"
//删除话题
#define deleteTopic_API @"/communityapp/topicDelete"
//顶置话题
#define setTopTopic_API @"/communityapp/topicStick"
//加精话题
#define setBoutique_API @"/communityapp/topicEssence"
//帖子的评价回复
#define answerIssue_API @"/communityapp/addPhotosAnswer"
//帖子评价回复的回复
#define IssueAnswerIssue_API @"/communityapp/addPhotosAnswer"
//话题点赞
#define TouchZan_API @"/communityapp/topicDZ"
//话题取消点赞
#define cancelZan_API @"/communityapp/topicCanleDZ"
//帖子评价删除
#define DeleteTopic_API @"/communityapp/delPostsFeed"
//用户关注
#define userFouces_API @"/userFouce/addUserFouces"
//取消关注
#define cancelUserFouces_API @"/userFouce/cancleUserFouces"
//圈子活跃用户
#define circleActiviteUser_API @"/communityapp/getUserListByCircleId"
//圈子主贴精华区列表
#define jingHua_API @"/communityapp/getPostsJHListByCircleId"

//场地搜索
#define theatreSearch_API @"/venue/query"
//剧院详情
#define theatreDetails_API @"/venue/queryDetails"

//场地预约提交
#define siteOrder_API @"/venue/queryOrder"

//忘记密码（获取验证码验证）
#define forgetPassWordCode_API @"/accountmanagerapp/sendphoneCodeforbindphone"
//登录
#define loading_API @"/loginmanagerapp/login"
//注册（获取验证码）
#define registCode_API @"/loginmanagerapp/sendphoneCode"
//注册
#define regist_API @"/loginmanagerapp/register"

//设置当前屏幕的高和宽
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

#define MAX_LIMIT_NUMS     140
#define photoWith (ScreenWidth - 20) / 5


#endif /* APIHeader_h */
