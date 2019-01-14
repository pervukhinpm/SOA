//
//  RequestFactory.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Foundation

struct RequestsFactory {
    
    struct LastFMRequests {
        static func topTracksConfig() -> RequestConfig<LastFMTracksParser> {
            let request = LastFMTopTracksRequest(apiKey: "fa33725c31d43172916f8c078db1c856")
            return RequestConfig<LastFMTracksParser>(request:request, parser: LastFMTracksParser())
        }
    }
    
}
