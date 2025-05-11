struct RegisterResponseWrapper: Codable {
    let success: Bool
    let code: String
    let message: String
    let data: RegisterResponseModel
}

struct RegisterResponseModel: Codable {
    let userId: Int
    let nickname: String
}
