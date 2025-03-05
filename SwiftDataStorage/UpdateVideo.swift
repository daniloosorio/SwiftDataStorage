//
//  UpdateView.swift
//  SwiftDataStorage
//
//  Created by Danilo Osorio on 4/03/25.
//

import SwiftUI

struct UpdateVideo: View {
    @Bindable var video :Video
    var body: some View {
        Form {
            TextField("Editar el priximo video",text: $video.title)
            Toggle("Video favorito", isOn: $video.metadata.isFavorite)
        }
    }
}
