//
//  ContentView.swift
//  SwiftDataStorage
//
//  Created by Danilo Osorio on 3/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Video.title) var videos: [Video]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(videos) { video in
                    NavigationLink(value: video){
                        HStack{
                            Text(video.title)
                            if video.metadata.isFavorite {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Swift Data Storage")
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            let url = modelContext.container.configurations.first?.url ?? URL(fileURLWithPath: "/dev/null")
                            print("URL: \(url)")
                            withAnimation {
                                let newVideo = Video(id: .init(),
                                                     title: "muchis videoss",
                                                     metadata: .init(isFavorite: true))
                                modelContext.insert(newVideo)
                            }
                            
                        },label: {
                            Label("Add item", systemImage: "plus")
                        })
                    }
                    }
                }
        }
    }
    
