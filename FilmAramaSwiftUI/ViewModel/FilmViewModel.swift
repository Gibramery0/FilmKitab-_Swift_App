//
//  FilmViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by Gibramery on 5.03.2025.
//

import Foundation
import SwiftUI

class FilmListeViewModel : ObservableObject {
    
    @Published var filmler = [FilmViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasıYap(filmIsmi : String) {
        downloaderClient.filmleriIndir(search: filmIsmi) { (sonuc) in
            switch sonuc {
            case.failure(let hata):
                print(hata)
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    DispatchQueue.main.async {
                       self.filmler = filmDizisi.map(FilmViewModel.init)
                    }
                }
            }
        }
    }
}

struct FilmViewModel {
    
    let film : Film
    
    var title : String {
        film.title
    }
    
    var poster : String {
        film.poster
    }
    
    var year : String {
        film.year
    }
    
    var imdbId : String {
        film.imdbId
    }
    
}
