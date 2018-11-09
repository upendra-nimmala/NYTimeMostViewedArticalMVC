//
//  Articals.swift
//  NewYork
//
//  Created by Upendra Nimmala on 08/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import Foundation

struct Article : Decodable {
    var url: String?
    var title : String?
    var published_date : String?
    var source : String?
    var media : [Media]
    enum CodingKeys : String, CodingKey {
        case media = "media"
        case url = "url"
        case published_date = "published_date"
        case source = "source"
        case title = "title"
    }
}

struct Results: Decodable {
    let results: [Article]
    enum CodingKeys : String, CodingKey {
        case results = "results"
    }


}
struct Media : Decodable {
    var mediaMetaData : [MediaMetaData]
    enum CodingKeys : String, CodingKey {
        case mediaMetaData = "media-metadata"
    }
}


struct MediaMetaData : Decodable {
    var url :String?
    var format:String?
}
