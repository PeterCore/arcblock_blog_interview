import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchBlogs(page: Int, size: Int, locale: String = "zh", completion: @escaping (Result<BlogResponse, Error>) -> Void) {
        let urlString = "https://www.arcblock.io/blog/api/blogs?page=\(page)&size=\(size)&locale=\(locale)"
        
        let decoder = JSONDecoder()
        
        // 自定义 dateDecodingStrategy，支持带小数秒的 ISO8601 日期
        let iso8601Formatter = ISO8601DateFormatter()
        iso8601Formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            if let date = iso8601Formatter.date(from: dateString) {
                return date
            } else {
                throw DecodingError.dataCorruptedError(in: container,
                    debugDescription: "日期格式不符合 ISO8601 带小数秒的格式: \(dateString)")
            }
        }
        DispatchQueue.global().async {
            AF.request(urlString)
                .validate()
                .responseDecodable(of: BlogResponse.self, decoder: decoder) { response in
                    DispatchQueue.main.async {
                        switch response.result {
                        case .success(let blogResponse):
                            completion(.success(blogResponse))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
                    
                }
        }

        
    }
}
