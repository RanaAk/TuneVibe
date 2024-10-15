import SwiftUI


struct AudioPlayerView: View {
    @StateObject private var viewModel = AudioPlayerViewModel()
    @ObservedObject var songDataModel : SongDataModel
    @State var song : Song?
    @State var songIndex : Int = 0

    var body: some View {
        VStack {
           
            if let imageUrl = song?.image {
                let Url = URL(string: imageUrl)
                AsyncImage(url: Url){ image in
                    
                    image
                        .resizable()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(height : 400)
                    
                }placeholder: {
                    ProgressView()
                }
            }
            
            Spacer()
            HStack {
                Text(formatTime(viewModel.currentTime))
                Spacer()
                Text(formatTime(viewModel.duration))
            }
            .padding()
            .task{
              
                    Task {
                        if let songUrl = song?.songUrl {
                            await viewModel.loadAudio(from: songUrl)
                            viewModel.playAudio()
                        }
                        else {
                            await viewModel.loadAudio(from: "https://r3.rana43oka.workers.dev/0:/songs/01.%20Ghana%20Kasoota.flac")
                        }
                    }
                
                
            }

            
            Slider(value: $viewModel.currentTime, in: 0...viewModel.duration, onEditingChanged: { editing in
                if !editing {
                    withAnimation {
                        viewModel.seekAudio(to: viewModel.currentTime)
                    }
                   
                }
            })
            .padding()
            .padding(.bottom)

            
            HStack(spacing: 20) {
                
                Button(action: {
                    
                    songIndex -= 1
                    playNextSong(songIndex: songIndex)
                }, label: {
                    //chevron.forward.circle
                    Image(systemName: "chevron.backward.circle.fill")
                        .resizable()
                        .foregroundStyle(.blue.gradient)
                        .frame(width: 50, height: 50)
                       
                    
                })
                Spacer()
                Button(action: {
                    if viewModel.isPlaying {
                        viewModel.pauseAudio()
                    } else {
                        viewModel.playAudio()
                    }
                }) {
                    Image(systemName: viewModel.isPlaying ? "pause.fill" : "play.fill")
                        .resizable()
                        .foregroundStyle(.blue.gradient)
                        .frame(width: 50, height: 50)
                        .contentTransition(.symbolEffect(.replace.downUp))
                }
           // .padding()
                
                Spacer()
                
                Button(action: {
//                    songIndex += 1
//                    var newSong : Song? = songDataModel.Songs[songIndex]
//                    if newSong != nil {
//                            
//                        self.song = newSong
//                        
//                        Task{
//                            await viewModel.loadAudio(from: song!.songUrl)
//                            viewModel.playAudio()
//                        }
//                        
//                    } else {
//                        print("OKOKO")
//                    }
//                        
//                    
                    songIndex += 1
                    playNextSong(songIndex: songIndex)
                    
                    
                    
                }) {
                    Image(systemName: "chevron.forward.circle.fill")
                        .resizable()
                        .foregroundStyle(.blue.gradient)
                        .frame(width: 50, height: 50)
                }
                
            }
            .padding(.bottom)

        }

        .padding()
    }
    
  
    private func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
  private func playNextSong(songIndex: Int) {
        
        
        if songIndex >= 0 && songIndex < songDataModel.Songs.count {

                self.song = songDataModel.Songs[songIndex]
                
                Task {
                    await viewModel.loadAudio(from: song!.songUrl)
                    viewModel.playAudio()
                }
     
        } else {
            print("Index out of bounds")
        }
    }

}

#Preview {

    ContentView()
}
