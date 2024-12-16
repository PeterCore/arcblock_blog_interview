//
//  BlogListResp.swift
//  blog_test
//
//  Created by 张淳 on 2024/12/16.
//

import Foundation

// 动态键，用于处理未知的键
struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int?

    init?(intValue: Int) {
        return nil
    }

    init?(stringValue: String) {
        self.stringValue = stringValue
    }
}

// Meta 字段的自定义解析
struct Meta: Codable {
    let unpublishedChanges: Int?
    let explicitSlug: Bool?
    let additionalData: [String: String]? // 处理其他可能的键值对

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var unpublishedChanges: Int? = nil
        var explicitSlug: Bool? = nil
        var additionalData: [String: String] = [:]

        for key in container.allKeys {
            switch key.stringValue {
            case "unpublishedChanges":
                unpublishedChanges = try container.decodeIfPresent(Int.self, forKey: key)
            case "explicitSlug":
                explicitSlug = try container.decodeIfPresent(Bool.self, forKey: key)
            default:
                if let value = try? container.decode(String.self, forKey: key) {
                    additionalData[key.stringValue] = value
                } else if let value = try? container.decode(Int.self, forKey: key) {
                    additionalData[key.stringValue] = String(value)
                } else if let value = try? container.decode(Bool.self, forKey: key) {
                    additionalData[key.stringValue] = String(value)
                }
            }
        }

        self.unpublishedChanges = unpublishedChanges
        self.explicitSlug = explicitSlug
        self.additionalData = additionalData.isEmpty ? nil : additionalData
    }
}

// 博客文章结构
struct BlogPost: Codable {
    let latestCommenters: [String]
    let meta: Meta
    let id: String
    let slug: String
    let title: String
    let author: String
    let cover: String
    let excerpt: String
    let boardId: String
    let createdAt: Date
    let updatedAt: Date
    let commentCount: Int
    let type: String
    let status: String
    let publishTime: Date
    let labels: [String]
    let locale: String
}

// 顶层响应结构
struct BlogResponse: Codable {
    let data: [BlogPost]
    let total: Int
    let countAll: Int
}




