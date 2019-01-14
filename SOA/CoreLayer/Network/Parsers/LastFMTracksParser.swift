//
//  LastFMTracksParser.swift
//  SOA
//
//  Created by Петр Первухин on 14/01/2019.
//  Copyright © 2019 DropDead. All rights reserved.
//

import Foundation

struct TopTrackApiModel : Codable{
    let tracksApiModel: Tracks
    
    enum CodingKeys: String, CodingKey {
        case tracksApiModel = "tracks"
    }
    
}

struct Tracks : Codable{
    let tracks: [Track]
    
    enum CodingKeys: String, CodingKey {
        case tracks = "track"
    }
    
}

struct Track : Codable{
    var name : String
    var artist: Artist
    var images : [CoverImage]
   
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case artist = "artist"
        case images = "image"
    }
}

struct Artist : Codable{
    var name : String
}

struct CoverImage : Codable{
    
    var coverUrl : String
    
    enum CodingKeys: String, CodingKey {
        case coverUrl = "#text"
    }
}


class LastFMTracksParser: IParser {
    
    typealias Model = TopTrackApiModel
    
    func parse(data: Data) -> TopTrackApiModel?{
        let decoder = JSONDecoder()
        var trackModel : TopTrackApiModel?
        do{
            let decodedData = try decoder.decode(TopTrackApiModel.self, from: data)
            trackModel = decodedData
        }catch let error{
            print("LastFMTracksParser error:",error)
            return nil
        }
        return trackModel
    }
    
}
