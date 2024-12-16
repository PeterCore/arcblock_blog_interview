//
//  JSONBlogListParser.swift
//  blog_test
//
//  Created by 张淳 on 2024/12/16.
//

import Foundation

class JSONParser {
    static let shared = JSONParser()
    private init() {}

    // 解析方法
    func parse(jsonData: Data) throws -> BlogResponse {
        let decoder = JSONDecoder()
        // 设置日期解码策略为 ISO8601
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(BlogResponse.self, from: jsonData)
    }
}
