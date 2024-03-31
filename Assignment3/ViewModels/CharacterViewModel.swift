//
//  CharacterViewModel.swift
//  Assignment3
//
//  Created by Michael Medlin on 3/31/24.
//

import Foundation

import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [CharacterModel] = []
    private let url = "https://rickandmortyapi.com/api/character"
    
    func fetchData() {
        if let url = URL(string: self.url) {
            
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            do {
                                let results = try JSONDecoder().decode(CharacterResults.self, from: data)
                                DispatchQueue.main.async {
                                    self.characters = results.results
                                }
                                
                            } catch {
                                print(error)
                            }
                        }
                    }
                }.resume()
        }
    }
}
