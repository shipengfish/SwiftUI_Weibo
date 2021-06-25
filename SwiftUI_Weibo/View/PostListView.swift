//
//  PostListView.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/5/26.
//

import SwiftUI

struct PostListView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            ForEach(userData.postList(for: .recommend).list!) { post in
                ZStack {
                    PostCell(post: post)
                }
                .listRowInsets(EdgeInsets())
            }
        }
        
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
