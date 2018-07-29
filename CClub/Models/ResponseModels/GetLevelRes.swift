/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GetLevelRes : Codable {
	let createdBy : CreatedBy?
	let created : String?
	let updatedBy : UpdatedBy?
	let updated : String?
	let accessKey : String?
	let active : Bool?
	let fullTitle : String?
	let rowId : Int?
	let personOrganizationRelation : PersonOrganizationRelation?
	let fromDate : String?
	let fromTime : String?
	let organizationPersonLevel : OrganizationPersonLevel?
	let toDate : String?
	let toTime : String?

	enum CodingKeys: String, CodingKey {

		case createdBy = "createdBy"
		case created = "created"
		case updatedBy = "updatedBy"
		case updated = "updated"
		case accessKey = "accessKey"
		case active = "active"
		case fullTitle = "fullTitle"
		case rowId = "rowId"
		case personOrganizationRelation = "personOrganizationRelation"
		case fromDate = "fromDate"
		case fromTime = "fromTime"
		case organizationPersonLevel = "organizationPersonLevel"
		case toDate = "toDate"
		case toTime = "toTime"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		createdBy = try values.decodeIfPresent(CreatedBy.self, forKey: .createdBy)
		created = try values.decodeIfPresent(String.self, forKey: .created)
		updatedBy = try values.decodeIfPresent(UpdatedBy.self, forKey: .updatedBy)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
		accessKey = try values.decodeIfPresent(String.self, forKey: .accessKey)
		active = try values.decodeIfPresent(Bool.self, forKey: .active)
		fullTitle = try values.decodeIfPresent(String.self, forKey: .fullTitle)
		rowId = try values.decodeIfPresent(Int.self, forKey: .rowId)
		personOrganizationRelation = try values.decodeIfPresent(PersonOrganizationRelation.self, forKey: .personOrganizationRelation)
		fromDate = try values.decodeIfPresent(String.self, forKey: .fromDate)
		fromTime = try values.decodeIfPresent(String.self, forKey: .fromTime)
		organizationPersonLevel = try values.decodeIfPresent(OrganizationPersonLevel.self, forKey: .organizationPersonLevel)
		toDate = try values.decodeIfPresent(String.self, forKey: .toDate)
		toTime = try values.decodeIfPresent(String.self, forKey: .toTime)
	}

}