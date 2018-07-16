/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GiftListRes : Codable {
    let rowId : CLongLong?
    let fromDate : String?
    let fromOrganizationId : Int?
    let fromOrganizationName : String?
    let fromReward : String?
    let fromRewardValue : Int?
    let toDate : String?
    let toOrganizationId : Int?
    let toOrganizationName : String?
    let toReward : String?
    let toRewardValue : Int?
    let fromRewardTypeId : Int?
    let toRewardTypeId : Int?
    let toRewardsListId : Int?
    let fromRewardTypeName : String?
    let toRewardTypeName : String?
    let toRewardsListName : String?
    let toPhoto : ToPhoto?
    let toAccessType : Int?
    let likedCount : Int?
    let requestedCount : Int?
    let confirmedCount : Int?
    let currentPoints : Int?
    let currentCredit : Int?
    let isLikedByUser : Bool?
    let commentCount : Int?
    let remainedCount : Int?
    let description : String?
    
    enum CodingKeys: String, CodingKey {
        
        case rowId = "rowId"
        case fromDate = "fromDate"
        case fromOrganizationId = "fromOrganizationId"
        case fromOrganizationName = "fromOrganizationName"
        case fromReward = "fromReward"
        case fromRewardValue = "fromRewardValue"
        case toDate = "toDate"
        case toOrganizationId = "toOrganizationId"
        case toOrganizationName = "toOrganizationName"
        case toReward = "toReward"
        case toRewardValue = "toRewardValue"
        case fromRewardTypeId = "fromRewardTypeId"
        case toRewardTypeId = "toRewardTypeId"
        case toRewardsListId = "toRewardsListId"
        case fromRewardTypeName = "fromRewardTypeName"
        case toRewardTypeName = "toRewardTypeName"
        case toRewardsListName = "toRewardsListName"
        case toPhoto
        case toAccessType = "toAccessType"
        case likedCount = "likedCount"
        case requestedCount = "requestedCount"
        case confirmedCount = "confirmedCount"
        case currentPoints = "currentPoints"
        case currentCredit = "currentCredit"
        case isLikedByUser = "isLikedByUser"
        case commentCount = "commentCount"
        case remainedCount = "remainedCount"
        case description = "description"
    }

}
