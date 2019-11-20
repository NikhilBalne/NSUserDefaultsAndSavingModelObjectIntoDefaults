//
//	LoginResponseModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct LoginResponseModel : Codable {

	let designation : String?
	let doctorDepartment : [String]?
	let doctorExperience : String?
	let doctorFee : String?
	let doctorId : String?
	let doctorName : String?
	let doctorProfileImg : String?
	let doctorSpeciality : [String]?
	let doctorstudies : String?
	let emailId : String?
	let mobileNumber : String?
	let organization : String?
	let profileImageUrl : String?


	enum CodingKeys: String, CodingKey {
		case designation = "designation"
		case doctorDepartment = "doctorDepartment"
		case doctorExperience = "doctorExperience"
		case doctorFee = "doctorFee"
		case doctorId = "doctorId"
		case doctorName = "doctorName"
		case doctorProfileImg = "doctorProfileImg"
		case doctorSpeciality = "doctorSpeciality"
		case doctorstudies = "doctorstudies"
		case emailId = "emailId"
		case mobileNumber = "mobileNumber"
		case organization = "organization"
		case profileImageUrl = "profileImageUrl"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		designation = try values.decodeIfPresent(String.self, forKey: .designation)
		doctorDepartment = try values.decodeIfPresent([String].self, forKey: .doctorDepartment)
		doctorExperience = try values.decodeIfPresent(String.self, forKey: .doctorExperience)
		doctorFee = try values.decodeIfPresent(String.self, forKey: .doctorFee)
		doctorId = try values.decodeIfPresent(String.self, forKey: .doctorId)
		doctorName = try values.decodeIfPresent(String.self, forKey: .doctorName)
		doctorProfileImg = try values.decodeIfPresent(String.self, forKey: .doctorProfileImg)
		doctorSpeciality = try values.decodeIfPresent([String].self, forKey: .doctorSpeciality)
		doctorstudies = try values.decodeIfPresent(String.self, forKey: .doctorstudies)
		emailId = try values.decodeIfPresent(String.self, forKey: .emailId)
		mobileNumber = try values.decodeIfPresent(String.self, forKey: .mobileNumber)
		organization = try values.decodeIfPresent(String.self, forKey: .organization)
		profileImageUrl = try values.decodeIfPresent(String.self, forKey: .profileImageUrl)
	}


}