//
//  TrackModel.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Foundation

struct TrackCellDisplayModel {
    let artistName: String
    let songName: String
    let imageUrl: String
}

protocol ITrackModel: class {
    var delegate: ITrackModelDelegate? { get set }
    func fetchTopTracks()
}

protocol ITrackModelDelegate: class {
    func setup(dataSource: [TrackCellDisplayModel])
    func show(error message: String)
}

class TrackModel: ITrackModel {
    
    weak var delegate: ITrackModelDelegate?
    
    let tracksService:  ITracksService
    
    init(tracksService: ITracksService) {
        self.tracksService = tracksService
    }
    
    func fetchTopTracks() {
        tracksService.loadTopTracks { (response: TopTrackApiModel?, errorMessage) in
            if let unwrappedResponse = response{
                let cells = unwrappedResponse.tracksApiModel.tracks.map({TrackCellDisplayModel(artistName: $0.artist.name, songName: $0.name, imageUrl: ($0.images[2].coverUrl))})
                self.delegate?.setup(dataSource: cells)
            }else{
                self.delegate?.show(error: errorMessage ?? "Error")
            }
        }
    }
    
}
