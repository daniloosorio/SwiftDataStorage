//
//  ContentView.swift
//  SwiftDataStorage
//
//  Created by Danilo Osorio on 3/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // @Environment(\.modelContext) var modelContext  to viewmodel
    //@Query(sort: \Video.title) var videos: [Video]
    /*@Query(filter: #Predicate<Video> {
     $0.title == "holii"
     }) var videos: [Video]*/
    
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.videos) { video in
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
            .navigationDestination(for: Video.self, destination: {video in
                UpdateVideo(video: video)
                
            })
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        //let url = modelContext.container.configurations.first?.url ?? URL(fileURLWithPath: "/dev/null")
                        //print("URL: \(url)")
                        withAnimation {
                            let newVideo = Video(id: .init(),
                                                 title: "muchis videoss",
                                                 metadata: .init(isFavorite: true))
                            //modelContext.insert(newVideo) to viewmodel
                            viewModel.insert(video: newVideo)
                        }
                        
                    },label: {
                        Label("Add item", systemImage: "plus")
                    })
                }
                ToolbarItem {
                    Button(action: {
                        withAnimation {
                            /*viewModel.videos.forEach {
                             modelContext.delete($0)
                             }
                             try? modelContext.save()*/
                            viewModel.deleteAllVideos()
                        }
                        
                    },label: {
                        Label("remove all", systemImage: "trash")
                    })
                }
                
            }
            
            .onAppear{
                viewModel.getVideos()
            }
        }
    }
}


