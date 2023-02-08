//
//  ImageViewViewModel.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation
/// Imported for UIImage
import SwiftUI
/// Imported For Combine Downloading Structure
import Combine

/// Image error and caching functionallity
internal class ImageViewViewModel: ObservableObject {
    /// Changes when an error occurs in code
    @Published var error: Bool = false
    /// Changes when image is provided from either cache or API call
    @Published var image: UIImage? = nil
    /// Image ID for caching
    var imageID: String
    /// Cache Singleton reference
    var cacheRoot: ImageCacheManagerRequirements = ImageCacheManager.instance
    /// Image endpoint
    var imageURL: String
    /// Cancellable set for Combine
    var cancelables = Set<AnyCancellable>()
    
    /// Used later to extract the correct variables from the Disney character in view
    init(_ url: String, id: String){
        self.imageURL = url
        self.imageID = id
    }
}

extension ImageViewViewModel: ImageViewViewModelBasics {
    func getImage() {
        /// Image is cached
        if let cachedImage = self.cacheRoot.getImage(key: self.imageID) {
            self.image = cachedImage
        }
        else {
            /// Image is downloaded (cached in download function)
            downloadImage(imageURL)
        }
    }
}

extension ImageViewViewModel: ImageViewViewModelNetworkingRequirements {
    func downloadImage(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            /// Change error for view notification
            error = true
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map{UIImage(data: $0.data)}
            .receive(on: DispatchQueue.main)
            .sink {[weak self] _ in
                /// Not needed
            } receiveValue: { [weak self] (returnedImage) in
                guard let downLoadedImage = returnedImage, let self = self
                else {
                    /// Change error for view modification
                    self?.error = true
                    return
                }
                /// Assign and cache image
                self.image = downLoadedImage
                self.cacheRoot.addImage(key: self.imageID, value: self.image ?? UIImage())
            }
            .store(in: &cancelables)
    }
}

extension ImageViewViewModel: ImageViewViewModelCachingRequirements {}
