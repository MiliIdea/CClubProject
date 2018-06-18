/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct LoginRes : Codable {
	let userId : CLongLong?
	let organizationId : CLongLong?
	let personId : CLongLong?
	let orgName : String?
	let fullName : String?
	let active : Bool?
	let username : String?
	let roleId : CLongLong?
	let roleName : String?
	let accessKey : String?
	let ticket : String?
	let expireMinute : CLongLong?
	let userRoleId : CLongLong?
	let access : Access?
	let menuTree : String?
	let menuData : String?
	let fileId : CLongLong?

	enum CodingKeys: String, CodingKey {

		case userId = "userId"
		case organizationId = "organizationId"
		case personId = "personId"
		case orgName = "orgName"
		case fullName = "fullName"
		case active = "active"
		case username = "username"
		case roleId = "roleId"
		case roleName = "roleName"
		case accessKey = "accessKey"
		case ticket = "ticket"
		case expireMinute = "expireMinute"
		case userRoleId = "userRoleId"
		case access
		case menuTree = "menuTree"
		case menuData = "menuData"
		case fileId = "fileId"
	}

}
