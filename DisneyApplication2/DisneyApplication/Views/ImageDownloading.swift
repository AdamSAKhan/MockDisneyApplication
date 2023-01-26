//
//  ImageDownloading.swift
//  DisneyApplication
//
//  Created by Adam Khan on 24/01/2023.
//

import SwiftUI

/// Displays an image, placeholder (or Error Image) for the List cell
/// Resizabillity is performed at a higher level
/// VM not needed due to simplicity of the View
internal struct ImageDownloading: View {
    
    /// The endpoint of the image as String type
    let imageAPIString: String
    
    /// Init reduced higher level tidyness
    init(_ imageAPIString: String) {
        self.imageAPIString = imageAPIString
    }
    
    var body: some View {
        AsyncImage(url: URL(string: self.imageAPIString)!) { phase in
            /// If the image is valid
            if let image = phase.image {
                image
                    .resizable()
                    .imageListModifier()            }
            /// If there was an error downloading the image
            else if phase.error != nil {
                VStack{
                    Image(systemName: "exclamationmark.triangle.fill")
                        .font(.title)
                        .shadow(radius: 10)
                    Text("No image available")
                        .font(.subheadline)
                        .bold()
                }
            }
            /// When the imag is loading
            else {
                ProgressView()
            }
        }
    }
}

struct ImageDownloading_Previews: PreviewProvider {
    static var previews: some View {
        ImageDownloading(DummyData.shared.dummyCharacter.imageURL)
    }
}
