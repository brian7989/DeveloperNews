//
//  ContentView.swift
//  HackerNews
//
//  Created by Brian Lee on 2021/06/10.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager();
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("Developer News")
        }
        .onAppear(){
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
