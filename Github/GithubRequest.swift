//
//  GithubRequest.swift
//  Github
//
//  Created by diego.rios on 09/06/20.
//  Copyright © 2020 diego.rios. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let name: String
    let description: String
    let language: String
}

func fetchRepositories(urlString: String, completion: @escaping (Result<[Repository], Error>) -> ()) {
    
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, resp, err) in
        if let err = err {
            completion(.failure(err))
            return
        }
        
        do {
            let repository = try JSONDecoder().decode([Repository].self, from: data!)
            completion(.success(repository))
        } catch let jsonError {
            completion(.failure(jsonError))
        }
        
        
    }.resume()
    
}
