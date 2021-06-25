//
//  PostCell.swift
//  SwiftUI_Weibo
//
//  Created by admin on 2021/3/20.
//

import SwiftUI
import Moya
import Kingfisher

struct PostCell: View {
    let post: Post
    
    @EnvironmentObject var userData: UserData
    
    var thisPost: Post {
        userData.get(forId: post.id)!
    }
    
    var body: some View {
        let post = thisPost
        return VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50.0, height: 50.0)
                    .clipShape(Circle())
                    .overlay(
                        PostVIPBadge(vip: post.vip)
                            .offset(x: 16, y: 16)
                    )
                
                VStack(alignment: .leading, spacing: 5.0) {
                    Text(post.name!)
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 242/255, green: 99/255, blue: 4/255))
                        .lineLimit(1)
                    Text(post.date!)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10.0)
                
                if !post.isFollowed {
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
                }
            }
            
            Text(post.text!)
                .font(.system(size: 17))
            
            if !post.images!.isEmpty {
                KFImage(URL(string: post.images![0]))
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 30, height: (UIScreen.main.bounds.width - 30) * 0.75)
                    .clipped()
            }
            
            Divider()
            
            HStack(spacing: 0) {
                Spacer()
                
                PostCellToolbarButton(image: "message",
                                      text: post.commentCountText,
                                      color: .black) {
                    print("点击评论按钮")
                }
                
                Spacer()
                
                PostCellToolbarButton(image: "heart",
                                      text: post.likeCountText,
                                      color: .black) {
                    print("点击点赞按钮")
                }
                
                Spacer()
            }
            
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(.init(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData.testData
        return PostCell(post: userData.recommendPostList.list![0]).environmentObject(userData)
    }
}
