//
//  MovieDramas.swift
//  assignment
//
//  Created by 김나연 on 5/3/24.
//

import UIKit
import Foundation

struct MovieModel {
    let image: UIImage
    let title: String
}

extension MovieModel {
    static func movieData() -> [MovieModel] {
        return [
            MovieModel(image: .signal, title: "시그널"),
            MovieModel(image: .harrypotter, title: "해리포터와 마법사의 돌"),
            MovieModel(image: .lordOfTheRings, title: "반지의 제왕"),
            MovieModel(image: .suzume, title: "스즈메의 문단속"),
            MovieModel(image: .signal, title: "시그널"),
            MovieModel(image: .harrypotter, title: "해리포터와 마법사의 돌"),
            MovieModel(image: .lordOfTheRings, title: "반지의 제왕"),
            MovieModel(image: .suzume, title: "스즈메의 문단속"),
        ]
    }
    
    static func carouselMovieData() -> [MovieModel] {
        return [
            MovieModel(image: .yourNameIs, title: "너의 이름은"),
            MovieModel(image: .suzume, title: "스즈메의 문단속"),
            MovieModel(image: .lordOfTheRings, title: "반지의 제왕"),
            MovieModel(image: .harrypotter, title: "해리포터와 마법사의 돌"),
        ]
    }
}
