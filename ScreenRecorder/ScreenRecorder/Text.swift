//
//  Text.swift
//  ScreenRecorder
//
//  Created by Aryan Garg on 11/01/23.
//



class UserSong: ObservableObject{
    @AppStorage("STRING_KEY") var savedText = ""
}

import SwiftUI

struct Text: View {
    
    @ObservedObject var userSong : UserSong
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false, content: {
                TextField("Enter Your Song", text: $userSong.savedText)
                    .frame(width: 300, height: 200, alignment: .top)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.leading)
                    .lineLimit(10)
            })
                
            
            Button("Save"){
                    self.userSong.savedText = userSong.savedText
            }
            .frame(width: 200, height: 50)
                .cornerRadius(20)
            .font(.system(size: 30))
            .buttonStyle(.bordered)
        }
    }
}

struct Text_Previews: PreviewProvider {
    static var previews: some View {
        Text(userSong: UserSong())
    }
}
