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
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            VStack {
                TextField("Github Account", text: $github, onCommit: validate)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                NavigationLink(destination: ListView(), tag: 1, selection: $selection) {
                    Button(action: changeSelection) {
                        Text("Sign In")
                    }.disabled(error != nil)
                }
                
                error.flatMap {
                    Text("Error \($0)").foregroundColor(.red)
                }
            }.navigationBarTitle("Find")
        }
    }
    
    func validate() {}
    func changeSelection() {
        githubText = github
        self.selection = 1
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
