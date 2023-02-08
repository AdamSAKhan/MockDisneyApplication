//
//  Cache.swift
//  DisneyApplication
//
//  Created by Adam Khan on 26/01/2023.
//

import Foundation
import SwiftUI

protocol ImageCacheManagerRequirements {
    /// Make the cache
    var photoCache: NSCache<NSString, UIImage> {get set}
    /// Add image to cache
    func addImage(key:String, value: UIImage)
    /// Get image from cache
    func getImage(key: String) -> UIImage?
}

/// Creates a singleton instance to cache images
class ImageCacheManager: ImageCacheManagerRequirements {
    /// Singleton design
    static let instance = ImageCacheManager()
    private init() {}
    /// Image cache
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 50
        /// Roughly 100mb
        cache.totalCostLimit = 1024*1024*200
        return cache
    }()
    /// Add image to cache
    func addImage(key:String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    /// Get image from cache
    func getImage(key: String) -> UIImage? {
        photoCache.object(forKey: key as NSString)
    }
}
