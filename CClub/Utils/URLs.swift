//
//  URLs.swift
//  CClub
//
//  Created by MehrYasan on 6/3/18.
//  Copyright © 2018 Milad Karimi. All rights reserved.
//

import Foundation

public class URLs {
    
    static let terms = "https://www.cclubco.com/article/p8"
    
    static let server = "https://my.c-club.ir/cclub/service/"
    
    static let imageServer = "https://my.c-club.ir/cclub/service/file/img/"
    
    static let login = server + "verification/verifyAndLogin"
    
    static let register = server + "verification/signup"
    
    static let loginAsAGuest = server + "security/selectUserRole"
 
    static let resendCode = server + "verification/resendCode"
    
    static let scoreList = server + "ruleManagement/scoreList"
    
    static let giftList = server + "rewardConversionFormula/personPanelListMobile"
    
    static let getListOfMyClubs = server + "personOrganizationRelation/listMobile"
    
    static let getInfoClub = server + "organization/findOneMobile"
    
    static let getNews = server + "news/list"
    
    static let getProfile = server + "user/profileMobile"
    
    static let getLevel = server + "levelAssign/getLevel"
    
    static let getComment = server + "comment/list"
    
    static let getNotificationSettings = server + "appSettings/notifications"
    
    static let saveChangeNotification = server + "appSettings/saveNotifications"
    
    static let editProfile = server + "coUserService/profileImprovementFAKE"
    
    static let saveImage = server + "file/save"
    
}
