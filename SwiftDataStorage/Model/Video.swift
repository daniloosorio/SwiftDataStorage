//
//  Video.swift
//  SwiftDataStorage
//
//  Created by Danilo Osorio on 3/03/25.
//

import Foundation
import SwiftData

@Model
class Video {
    @Attribute(.unique) var id : UUID
    var title: String
    @Transient var numberOfLike: Int {title.count}
    
    @Relationship var metadata: Metadata
    
    init(id: UUID, title: String,metadata: Metadata) {
        self.id = id
        self.title = title
        self.metadata = metadata
    }
}

@Model
class Metadata {
    var isFavorite: Bool
    
    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
}
