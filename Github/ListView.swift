//
//  ListView.swift
//  Github
//
//  Created by diego.rios on 14/06/20.
//  Copyright © 2020 diego.rios. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var repositories: Array<Repository> = []
    
    @ViewBuilder
    var body: some View {
        if repositories.count > 0 {
            NavigationView {
                List {
                    Text(repositories[0].name)
                    Text("Hello World")
                    Text("Hello World")
                }
                .navigationBarTitle("Repositories")
            }
        } else {
            Text("Loading").onAppear { self.login() }
        }
    }
    
    func login() {
        let URL = "https://api.github.com/users/\(githubText)/repos"
        
        fetchRepositories(urlString: URL) { (res) in
            switch res {
                case .success(let repositories):
                    repositories.forEach({ (repository) in
                    print(repository)
                        
                })
                case .failure(let err):
                    print("Failed to find repository", err)
            }
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
