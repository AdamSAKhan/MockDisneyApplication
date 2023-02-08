//
//  ImageViewViewModelContracts.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation
import SwiftUI

protocol ImageViewViewModelBasics {
    var error: Bool {get set}
    var image: UIImage? {get set}
    func getImage()
    var imageID: String {get set}
}

protocol ImageViewViewModelNetworkingRequirements {
    var imageURL: String {get set}
    func downloadImage(_ urlString: String)
}

protocol ImageViewViewModelCachingRequirements {
    var cacheRoot: ImageCacheManagerRequirements {get set}
}
