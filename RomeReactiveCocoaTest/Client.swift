//
//  Client.swift
//  RomeReactiveCocoaTest
//
//  Created by Romain Pouclet on 2017-04-03.
//  Copyright © 2017 Perfectly-Cooked. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result
import SwiftyJSON

struct User {
    let name: String
}

final class Client {
    
    func user() -> SignalProducer<User, AnyError> {
        let r = URLRequest(url: URL(string: "https://randomuser.me/api/")!)
        return URLSession.shared.reactive.data(with: r)
            .map { data, _ in
                let j = JSON(data: data)
                
                return User(name: j["results"][0]["login"]["username"].stringValue)
            }
    }
}
