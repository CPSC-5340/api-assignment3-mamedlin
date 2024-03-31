//
//  CharacterView.swift
//  Assignment3
//
//  Created by Michael Medlin on 3/31/24.
//

import SwiftUI

struct CharacterView: View {
    
    var character : CharacterModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10) {
                Text(character.name)
                    .bold()
                    .font(.largeTitle)
                AsyncImage(url: URL(string: character.image!)) { image in
                    image.resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(width: 350, height: 350)
                } placeholder: {
                    ProgressView()
                }
                
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Status: \(character.status)")
                if character.species!.isEmpty {
                    Text("Species: Unknown")
                }
                else
                {
                    Text("Species: \(character.species!)")
                }
                if character.type!.isEmpty {
                    Text("Type: Unknown")
                }
                else {
                    Text("Type: \(character.type!)")
                }
                if character.gender!.isEmpty {
                    Text("Gender: Unknown")
                }
                else
                {
                    Text("Gender: \(character.gender!)")
                }
                HStack {
                    Text("URL: ")
                    Text(character.url!)
                        .foregroundColor(.blue)
                        .underline()
                        .onTapGesture {
                            if let url = URL(string: character.url!) {
                                UIApplication.shared.open(url)
                            }
                        }
                }
                
                
            }
                
            
        }
        
    }
}

//#Preview {
//    CharacterView()
//}
