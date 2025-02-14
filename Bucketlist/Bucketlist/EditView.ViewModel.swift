//
//  EditView.ViewModel.swift
//  Bucketlist
//
//  Created by Daniel Budusan on 25.03.2024.
//

import SwiftUI
import MapKit

extension EditView {
    @Observable
    class ViewModel {
        
        enum LoadingState {
            case loading, loaded, failed
        }
        
        var loadingState = LoadingState.loading
        var pages = [Page]()
      
        func fetchNearbyPlaces(latitude: Double, longitude: Double) async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(latitude)%7C\(longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("BAd URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let items = try JSONDecoder().decode(Result.self, from: data)
                pages = items.query.pages.values.sorted ()
                    loadingState = .loaded
            } catch {
                loadingState = .failed
            }
        }
        
       
        
    }
}

