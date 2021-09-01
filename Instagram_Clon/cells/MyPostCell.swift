//
//  MyPostCell.swift
//  Instagram_Clon
//
//  Created by Apple user on 31/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyPostCell: View {
    
    var post: Post
    var length: CGFloat
    var body: some View {
        VStack(spacing: 0){
            WebImage(url: URL(string:post.imgUrl!))
                .resizable()
                .frame(width: length, height: length)
                .scaledToFit()
            
            Text("Azamjon")
                .font(.system(size: 16))
                .padding(.top, 10)
                .padding(.bottom, 10)
                .frame(width: length)
        }
    }
}

struct MyPostCell_Previews: PreviewProvider {
    static var previews: some View {
        MyPostCell(post: Post(title: "aaa", content: "sss", imgUrl:Utils.image2),length: UIScreen.width)
    }
}

