//
//  PhotoStorage.swift
//  PhotosApp
//
//  Created by Daniel Budusan on 27.03.2024.
//

import Foundation

@Observable
class PhotoStorage {
    var photos = [Photo]()
    let url = URL.documentsDirectory.appending(path: "Images")
    
    init() {
        do {
            let data = try Data(contentsOf: url)
            photos = try JSONDecoder().decode([Photo].self, from: data)
        } catch {
            photos = []
        }
    }
    
    func addPhoto(imageData: Data, name: String, latitude: Double, longitude: Double) {
        let newPhoto = Photo(name: name, imageData: imageData, latitude: latitude, longitude: longitude)
        photos.append(newPhoto)
        savePhotos()
    }
    
    func savePhotos() {
        do {
            let data = try JSONEncoder().encode(photos)
            try data.write(to: url, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save photos")
        }
    }
}
