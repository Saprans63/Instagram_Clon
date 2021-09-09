//
//  LikePostCell.swift
//  Instagram_Clon
//
//  Created by Apple user on 09/09/21.
//


import SwiftUI
import SDWebImageSwiftUI

struct LikePostCell: View {
 
    @State private var showingAlert = false
     var uid: String
     var viewModel: LikesViewModel
     
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
                     Text(post.displayName!)
                         .foregroundColor(.black)
                         .font(.system(size: 17))
                         .fontWeight(.medium)
                     
                     Text(post.time!)
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
             
             WebImage(url: URL(string: post.imgPost!))
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
                     .font(.system(size: 17))
                 Spacer()
             }.padding(.all,15)
         }
     }
 }

    
struct LikePostCell_Previews: PreviewProvider {
    static var previews: some View {
        LikePostCell(uid: "uid", viewModel: LikesViewModel(), post: Post(caption: "symbolic", imgPost: Utils.image1))
    }
}
