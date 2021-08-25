//
//  HomeUploadScreen.swift
//  Instagram_Clon
//
//  Created by Apple user on 24/08/21.
//

import SwiftUI

struct HomeUploadScreen: View {
    @Binding var tabSeliction: Int
    
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
    
    
    func uploadPost() {
        if caption .isEmpty || selectedImage == nil{
            return
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack{
                    ZStack{
                        
                        if selectedImage != nil {
                            
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .frame(maxWidth: UIScreen.width, maxHeight: UIScreen.width)
                            .scaledToFit()
                            
                            VStack{
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        selectedImage = nil
                                    }, label: {
                                Image(systemName: "xmark").resizable().scaledToFit()
                                    .frame(width: 25, height: 25)
                                    }).padding()
                                }
                                Spacer()
                            }
                            
                        }else{
                    
                        Button(action: {
                            isShit = true
                            // self.soutceType = .photoLibrary
                          //self.isImagePicerDisplay.toggle()
                        }, label: {
                            Image(systemName: "camera").resizable().scaledToFit()
                                .frame(width: 40, height: 40)
                        }).actionSheet(isPresented: $isShit, content: {
                            self.Actions
                        })
                        .sheet(isPresented: self.$isImagePicerDisplay){
                            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.soutceType)
                        }
                        }
                    }.frame(maxWidth: UIScreen.width, maxHeight: UIScreen.width)
                    .background(Color.gray.opacity(0.2))
                    
                    VStack{
                        TextField("Caption", text: $caption)
                            .font(Font.system(size: 17, design: .default))
                            .frame(height: 45)
                        Divider()
                   
                    } .padding(.top, 10).padding(.leading, 20).padding(.trailing, 20)
                    Spacer()
                    
                }
           
            
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.tabSeliction = 0
                                        self.uploadPost()
                                    }, label: {
                                        Image(systemName: "square.and.arrow.up")
                                    })
            )
            .navigationBarTitle("Upload", displayMode: .inline)
        }
    }
}

struct HomeUploadScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeUploadScreen(tabSeliction: .constant(0))
    }
}
