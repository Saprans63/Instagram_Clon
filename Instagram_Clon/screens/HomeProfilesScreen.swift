//
//  HomeProfilesScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 24/08/21.
//

import SwiftUI

struct HomeProfilesScreen: View {
    @ObservedObject var viewModel = ProfileViewModel()
    
  @State var level = 1
   
    @State var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: UIScreen.width/2 - 15), spacing: 10), count: 1)
    
    func postSize() -> CGFloat {
        if level == 1 {
            return UIScreen.width/CGFloat(level) - 20
        }
        return UIScreen.width/CGFloat(level) - 15
    }
    
    @State private var soutceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePicerDisplay = false
    @State var caption = ""
    @State var isShit = false
    
    var Actions : ActionSheet{
        let title = "Action"
      
        return ActionSheet(title: Text(title), buttons: [
            .default(Text("Pick Photo"), action: {
                 self.soutceType = .photoLibrary
                 self.isImagePicerDisplay.toggle()
            }),
            .default(Text("Take Photo"), action: {
                self.soutceType = .camera
                self.isImagePicerDisplay.toggle()
            }),
            .default(Text("Cancel"), action: {})

        ])
    }
 
    var body: some View {
      
        NavigationView{
            ZStack{
                VStack(spacing: 0){
                    ZStack{
                        VStack{
                            Image("ic_person").resizable()
                                .clipShape(Circle())
                                .frame(width: 70).frame(height: 70)
                                .padding(.all, 2)
                        }.overlay(RoundedRectangle(cornerRadius: 37)
                                    .stroke(Utils.color2, lineWidth: 2))
                        HStack{
                            Spacer()
                            VStack{
                                Spacer()
                                
                                Button(action: {
                                    isShit = true
                                }, label: {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }).actionSheet(isPresented: $isShit, content: {
                                    self.Actions
                                })
                                .sheet(isPresented: self.$isImagePicerDisplay){
                                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.soutceType)
                                }

                            }
                        }.frame(width: 77, height: 77)

                    }
                    
                    Text("Azamjon Kozimov")
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .padding(.top,15)
                    Text("kozimovazamjon@gmail.com")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                        .padding(.top,3)
                    
                    
                    
                    HStack{
                        VStack{
                            Text("625")
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                
                            Text("posts")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .padding(.top,3)

                        }.frame(maxWidth: UIScreen.width/3, maxHeight: 60)
                        
                        VStack{}.frame(maxWidth: 1, maxHeight: 25)
                            .background(Color.gray.opacity(0.5))
                        
                        VStack{
                            Text("4,235")
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                
                            Text("Followers")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .padding(.top,3)

                        }.frame(maxWidth: UIScreen.width/3, maxHeight: 60)
                        
                        VStack{}.frame(maxWidth: 1, maxHeight: 25)
                            .background(Color.gray.opacity(0.5))
                        
                        VStack{
                            Text("897")
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                                
                            Text("Following")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .padding(.top,3)

                        }.frame(maxWidth: UIScreen.width/3, maxHeight: 60)
                        
                        
                        
                    }.padding(.top, 10)

                    HStack(spacing: 70){
                        Spacer()
                        Button(action: {
                            level = 1
                        }, label: {
                            Image(systemName: "rectangle.grid.1x2")
                            .resizable()
                                .foregroundColor(Utils.color2)
                            .frame(width: 25, height: 25)
                        })
                        Spacer()
                        Button(action: {
                            level = 3
                        }, label: {
                            Image(systemName: "square.grid.2x2")
                            .resizable()
                            .foregroundColor(Utils.color2)
                            .frame(width: 25, height: 25)
                        })
                        Spacer()
                    }.padding()
                    
                    ScrollView{
                        
                        LazyVGrid(columns: columns,spacing: 10){
                            ForEach(viewModel.items, id:\.self){ item in
                            MyPostCell(post: item, length: postSize())
                            }
                        }
                        
                    }.padding(.top,10)

                    
                }.padding(.all, 20)
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                                        
                                    }, label: {
                                       Image(systemName: "pip.exit")
                                    })
            )
            .navigationBarTitle("Profile", displayMode: .inline)
        }.onAppear{
            viewModel.apiPostList {
                print(viewModel.items.count)
            }
        }
        
    }
}

struct HomeProfilesScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfilesScreen()
    }
}
