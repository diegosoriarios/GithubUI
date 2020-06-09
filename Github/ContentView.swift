//
//  ContentView.swift
//  Github
//
//  Created by diego.rios on 07/06/20.
//  Copyright © 2020 diego.rios. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var github = ""
    @State var error: String?
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("Github Account", text: $github, onCommit: validate)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                Button(action: login) {
                    Text("Sign In")
                }.disabled(error != nil)
                
                error.flatMap {
                    Text("Error \($0)").foregroundColor(.red)
                }
            }.navigationBarTitle("Find")
        }
    }
    
    func validate() {}
    func login() {
        //let URL = "https://api.github.com/users/\(github)/repos"
        let URL = "https://api.github.com/users/diegosoriarios/repos"
        
        fetchRepositories(urlString: URL) { (repositories, err) in
            if let err = err {
                print("Failed to search repositories", err)
                return
            }
            
            repositories?.forEach({ (repository) in
                print(repository)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
