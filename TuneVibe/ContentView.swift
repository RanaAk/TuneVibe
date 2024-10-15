//
//  ContentView.swift
//  TuneVibe
//
//  Created by RANA  on 14/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = SongDataModel()
   // let varte = UploadViewModel()
   // let mixColour = Color.red.opacity(0.5).overlay(Color.green.opacity(0.5))
    var body: some View {
        NavigationStack{
            VStack {
                Image(.home)
                    .resizable()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 270)
                
            }
            //Spacer()
            ScrollView {
                LazyVStack(alignment: .leading) {
                    if viewModel.Songs.isEmpty {
                        Text("No songs found")
                    } else {
                        ForEach(Array(viewModel.Songs.enumerated()), id: \.element.id){index, song in
                            NavigationLink {
                                AudioPlayerView(songDataModel: viewModel, song: song, songIndex: index)
                                  //  .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                            } label: {
                                HStack(alignment : .center){
                                    AsyncImage(url: URL(string: song.image ?? "")){ image in
                                        
                                        image
                                            .resizable()
                                            .frame(width : 70, height: 70)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                    }placeholder: {
                                        ProgressView()
                                    }
                                    Text(song.name)
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 9)
                                    
                                    Spacer()
                                    Image(systemName: "arrow.up.right.circle.fill")
                                        .imageScale(.large)
                                        .foregroundStyle(.blue.gradient)
                                }
                                
                            }

                            //Text(song.name)
                        }
                    }
                }
                    .onAppear {
                        Task {
                            try? await viewModel.fetchSongs() // Explicitly call fetchSongs when view appears
                        }
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding()
                    .background(.black.opacity(0.8))
                  
            }
               
                
            
            Spacer()
               
                
                
           
                
        }
        

        
    }
    
}

#Preview {
    ContentView()
}
