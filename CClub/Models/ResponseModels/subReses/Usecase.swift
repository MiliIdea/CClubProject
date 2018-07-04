/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Usecase : Codable {
	let created : String?
	let updated : String?
	let accessKey : String?
	let active : Bool?
	let rowId : Int?
	let clazz : String?
	let tableName : String?
	let useCaseName : String?
	let hasChild : Bool?

	enum CodingKeys: String, CodingKey {

		case created = "created"
		case updated = "updated"
		case accessKey = "accessKey"
		case active = "active"
		case rowId = "rowId"
		case clazz = "clazz"
		case tableName = "tableName"
		case useCaseName = "useCaseName"
		case hasChild = "hasChild"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		created = try values.decodeIfPresent(String.self, forKey: .created)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
		accessKey = try values.decodeIfPresent(String.self, forKey: .accessKey)
		active = try values.decodeIfPresent(Bool.self, forKey: .active)
		rowId = try values.decodeIfPresent(Int.self, forKey: .rowId)
		clazz = try values.decodeIfPresent(String.self, forKey: .clazz)
		tableName = try values.decodeIfPresent(String.self, forKey: .tableName)
		useCaseName = try values.decodeIfPresent(String.self, forKey: .useCaseName)
		hasChild = try values.decodeIfPresent(Bool.self, forKey: .hasChild)
	}

}