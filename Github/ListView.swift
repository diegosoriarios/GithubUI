//
//  ListView.swift
//  Github
//
//  Created by diego.rios on 14/06/20.
//  Copyright © 2020 diego.rios. All rights reserved.
//

import SwiftUI
import Combine

struct ListView: View {
    @Binding var repositories: Array<GithubViewModel.Repository>
    
    @ViewBuilder
    var body: some View {
        /*if repositories.count > 0 {
            NavigationView {*/
                List {
                    ForEach(repositories, id: \.id) { repository in
                        Group {
                            AsyncImage(url: URL(string: repository.image!), placeholder: Text("Loading..."))
                                .frame(width: 50.0, height: 50.0)
                            Text(repository.name)
                        }
                        
                    }
                }
                .navigationBarTitle("Repositories")
            /*}
        } else {
            Text("Loading")
        }*/
    }

}
