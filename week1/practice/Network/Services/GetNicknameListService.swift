import UIKit

final class GetInfoService {
    static let shared = GetInfoService()
    private init() {}
    
    func fetchNicknameList(keyword: String?) async throws -> [String] {
        guard let request = makeRequest(keyword: keyword) else {
            throw NetworkError.requestEncodingError
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
            throw NetworkError.responseError
        }
        
        return try decodeData(data: data)
    }
    
    func makeRequest(keyword: String?) -> URLRequest? {
        guard let url = makeURL(keyword: keyword) else { return nil }
    
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    private func makeURL(keyword: String?) -> URL? {
        var urlString = "http://api.atsopt-seminar4.site/api/v1/users"
        
        if let keyword = keyword, !keyword.isEmpty,
           let encodedKeyword = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                urlString += "?keyword=\(encodedKeyword)"
        }
        
        return URL(string: urlString)
    }
    
    private func decodeData(data: Data) throws -> [String] {
        do {
            let decoded = try JSONDecoder().decode(NicknameListResponseWrapper.self, from: data)
            return decoded.data.nicknameList
        } catch {
            print("디코딩 실패 : ", error)
            throw NetworkError.responseDecodingError
        }
    }
}
