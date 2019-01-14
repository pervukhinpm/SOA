//
//  LastFMTracksRequest.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Foundation

class LastFMTopTracksRequest: IRequest {
    private var baseUrl: String =  "https://ws.audioscrobbler.com/"
    private var apiVersion: String = "2.0/"
    private var method: String = "chart.gettoptracks"
    private let apiKey: String
    private var getParameters: [String : String]  {
        return ["method" : method,
                "api_key": apiKey,
                "format" : "json"]
    }
    
    private var urlString: String {
        let getParams = getParameters.compactMap({ "\($0.key)=\($0.value)"}).joined(separator: "&")
        return baseUrl + apiVersion + "?" + getParams
    }
    
    // MARK: - IRequest
    
    var urlRequest: URLRequest? {
        if let url = URL(string: urlString) {
            return URLRequest(url: url)
        }
        return nil
    }
    
    // MARK: - Initialization
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }    
}
