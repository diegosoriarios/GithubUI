//
//  ListView.swift
//  Github
//
//  Created by diego.rios on 14/06/20.
//  Copyright © 2020 diego.rios. All rights reserved.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: GithubViewModel
    
    @ViewBuilder
    var body: some View {
        if self.viewModel.repositories.count > 0 {
            NavigationView {
                List {
                    ForEach(self.viewModel.repositories ) { repository in
                        Text(repository.name)
                        
                    }
                }
                .navigationBarTitle("Repositories")
            }
        } else {
            Text("Loading")
        }
    }

}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: GithubViewModel())
    }
}
