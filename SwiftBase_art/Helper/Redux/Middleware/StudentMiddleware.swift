//
//  StudentMiddleware.swift
//  SwiftBase_art
//
//  Created by Apple on 11/22/20.
//  Copyright © 2020 MacBook. All rights reserved.
//

import Foundation

struct StudentMiddleware: Middleware {
    func proccess(getState: @escaping GetState, dispatch: @escaping DispatchFunction) -> (@escaping DispatchFunction) -> DispatchFunction {
        return { next in
            { action in
                next(action)
            }
        }
    }
}
