//
//  HelpModel.swift
//  GomywayCanada
//
//  Created by IDEIO SOFT on 24/10/23.
//  Copyright © 2023 Snow-Macmini-1. All rights reserved.
//

import Foundation
// MARK: - HelpModel
struct HelpModel: Codable {
    let message: String?
    let status: Bool?
    let data: [HelpData]?
}

// MARK: - Datum
struct HelpData: Codable {
    let createdAt, title, id, description,description_spanish,title_spanish: String?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case title, id, description,description_spanish,title_spanish
    }
}
