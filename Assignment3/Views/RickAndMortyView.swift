//
//  RickAndMortyView.swift
//  Assignment3
//
//  Created by Michael Medlin on 3/31/24.
//

import SwiftUI

struct RickAndMortyView: View {
    
    @ObservedObject var charactersvm = CharacterViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(charactersvm.characters) { character in
                    NavigationLink {
                        CharacterView(character : character)
                    } label: {
                            Text("\(character.id). \(character.name)")
                    }
                }
            }
            .task {
                await charactersvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Rick and Morty Character List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RickAndMortyView_Previews: PreviewProvider {
    static var previews: some View {
        RickAndMortyView()
    }
}
