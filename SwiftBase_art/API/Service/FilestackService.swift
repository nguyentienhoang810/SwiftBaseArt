//
//  FilestackService.swift
//  SwiftBase_art
//
//  Created by Nguyen Manh Hung on 12/2/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Combine
import Foundation

protocol FilestackService {
    var apiSession: APIService { get }

    func upload(_ data: Data) -> AnyPublisher<FilestackUploadResult, APIError>
    func upload(_ url: URL) -> AnyPublisher<FilestackUploadResult, APIError>
}

extension FilestackService {
    func upload(_ data: Data) -> AnyPublisher<FilestackUploadResult, APIError> {
        apiSession.upload(data: data, with: FilestackEndpoint.upload, decoder: nil)
    }

    func upload(_ url: URL) -> AnyPublisher<FilestackUploadResult, APIError> {
        apiSession.upload(url: url, with: FilestackEndpoint.upload, decoder: nil)
    }
}
