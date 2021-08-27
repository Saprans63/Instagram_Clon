//
//  PostCell.swift
//  Instagram_Clon
//
//  Created by Apple user on 27/08/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCell: View {
    var post: Post
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0){
                VStack{
                    Image("ic_person").resizable().clipShape(Circle())
                        .frame(width: 46).frame(height: 46)
                        .padding(.all, 2)
                }.overlay(RoundedRectangle(cornerRadius: 25.0)
                            .stroke(Utils.color2, lineWidth: 2))
                
                VStack(alignment: .leading, spacing: 3){
                    Text(post.title!)
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    
                    Text(post.content!)
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                    
                }.padding(.leading, 15)
                 Spacer()
                
                 Button(action: {
                    
                 }, label: {
                     Image("ic_more")
                 })
            }
            .padding(.trailing, 15)
            .padding(.leading, 15)
            .padding(.top, 15)
            
            WebImage(url: URL(string: post.imgUrl!))
                .resizable().scaledToFit()
                .padding(.top,15)
            
            HStack(spacing: 0){
                Button(action: {
                    
                }, label: {
                    Image("ic_favorite_b").resizable()
                        .frame(width: 26, height: 26)
                })
                
                Button(action: {
                    
                }, label: {
                    Image("ic_share").resizable()
                        .frame(width: 26, height: 26)
                }).padding(.leading, 15)
                Spacer()
            }.padding(.trailing, 15)
            .padding(.leading, 15)
            .padding(.top, 15)
            
            HStack{
                Text("Kozimov Azamjon 1992 yil")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                Spacer()
            }.padding(.all,15)
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(title: "Azamjon", content: "Avgust 8, 2021", imgUrl: Utils.image1))
    }
}
