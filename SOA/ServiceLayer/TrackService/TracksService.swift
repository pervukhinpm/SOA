//
//  TracksService.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Foundation

protocol ITracksService {
    func loadTopTracks(completionHandler: @escaping (TopTrackApiModel?, String?) -> Void)
}

class TracksService: ITracksService {
    
    let requestSender: IRequestSender
    
    init(requestSender: IRequestSender) {
        self.requestSender = requestSender
    }
    
    func loadTopTracks(completionHandler: @escaping (TopTrackApiModel?, String?) -> Void) {
        let requestConfig = RequestsFactory.LastFMRequests.topTracksConfig()
        
        requestSender.send(requestConfig: requestConfig) { (result: Result<TopTrackApiModel>) in
            switch result {
            case .success(let tracks):
                completionHandler(tracks, nil)
            case .error(let error):
                completionHandler(nil, error)
            }
        }
        
    }
}
