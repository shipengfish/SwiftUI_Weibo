//
//  ContentView.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {
            NavigationLink(destination: PostListView() ) {
                Text("点击我")
                    .font(.system(size: 30))
            }
        }
    }
}
