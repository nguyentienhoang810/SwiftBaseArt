//
//  FilestackEndpoint.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/2/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Alamofire
import Foundation

enum FilestackEndpoint {
    static let filestackAPIEndpoint = "https://www.filestackapi.com"
    static let apiKey = "Aj5edQDjRpGODt4Hfxkq5z"

    static var path: String {
        return filestackAPIEndpoint / "api"
    }

    case upload
}

extension FilestackEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .upload:
            let url = URL(string: FilestackEndpoint.path / "store/S3?key=\(FilestackEndpoint.apiKey)")!
            let request = createURLRequest(url: url, method: .post, parameters: [:])
            return request
        }
    }
}
