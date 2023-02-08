//
//  ImageView.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import SwiftUI

/// Displays an image, placeholder (or Error Image) for the List cell
/// Resizabillity is performed at a higher level
/// VM not needed due to simplicity of the View
internal struct ImageView: View {
    /// View model
    @StateObject var viewModel: ImageViewViewModel
    /// Initiallise character using correct StateObject mthod
    init(_ character: DisneyCharacter) {
        _viewModel = StateObject(wrappedValue:ImageViewViewModel(character.imageURL, id: "\(character.id)"))
    }
    
    var body: some View {
        ZStack{
            if viewModel.error {
                VStack{
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.title)
                        .shadow(radius: 10)
                    Text("No image available")
                        .font(.subheadline)
                        .bold()
                }
            }
            else {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .imageListModifier() 
                }
                else {
                    ProgressView()
                }
            }
        }.onAppear {
            viewModel.getImage()
        }
    }
}

struct ImageDownloading_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(DummyData.shared.dummyCharacter)
    }
}

