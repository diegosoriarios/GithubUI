//
//  GithubViewModel.swift
//  Github
//
//  Created by diego.rios on 03/08/20.
//  Copyright © 2020 diego.rios. All rights reserved.
//

import SwiftUI

class GithubViewModel: ObservableObject {
    @Published var repositories: Array<Repository> = []
    
    struct Repository: Decodable, Identifiable {
        let id: Int
        let name: String
        let description: String
        let language: String
    }

    func fetchRepositories(urlString username: String, completion: @escaping (Result<[Repository], Error>) -> ()) {
        
        let urlString = "https://api.github.com/users/\(username)/repos"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            
            do {
                let repository = try JSONDecoder().decode([Repository].self, from: data!)
                self.repositories = repository
                //completion(.success(repository))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
            
            
        }.resume()
        
    }

}
