//
//  PostCell.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import SwiftUI
import Moya

struct PostCell: View {
//    let post: Post
    
    var body: some View {
        HStack(spacing: 5) {
            Image("d0c21786ly1gavj2c0kcej20c8096dh7.jpg")
//            Image(uiImage: UIImage(named: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg")!)
                .resizable()
                .scaledToFill()
                .frame(width: 50.0, height: 50.0)
                .clipShape(Circle())
                .overlay(
                    PostVIPBadge(vip: true)
                        .offset(x: 16, y: 16)
                )
            
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text("post.name")
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                    .lineLimit(1)
                Text("post.date")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10.0)
            
//            if !post.isFollowed {
                Spacer()

                Button(action: {

                }, label: {
                    Text("关注")
                        .font(.system(size: 14))
                        .foregroundColor(.orange)
                        .frame(width: 50.0, height: 26.0)
                        .overlay(
                            RoundedRectangle(cornerRadius:13)
                                .stroke(Color.orange, lineWidth: 1))
                })
//            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
//        PostCell(post: Post(id: 1,
//                            avatar: "8697cf1ely8gashxj3b09j20u00u040v.jpg",
//                            vip: true,
//                            name: "123",
//                            date: "2020-12-12 00:00",
//                            isFollowed: false))
        PostCell()
    }
}
