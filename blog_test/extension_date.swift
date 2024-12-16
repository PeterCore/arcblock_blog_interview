//
//  extension_date.swift
//  blog_test
//
//  Created by 张淳 on 2024/12/16.
//

import Foundation
extension Date {
    func toDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
