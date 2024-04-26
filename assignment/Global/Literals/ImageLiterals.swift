//
//  ImageLiterals.swift
//  assignment
//
//  Created by 김나연 on 4/27/24.
//

import UIKit

enum ImageLiterals {
    
    enum Logo {
        static var tving_logo: UIImage { .load(name: "tving_logo") }
        static var tving_white: UIImage { .load(name: "tving_white") }
    }
    
    enum Icon {
        static var ic_eye: UIImage { .load(name: "icon_eye") }
        static var ic_eye_slash: UIImage { .load(name: "icon_eye-slash") }
        static var ic_x_circle: UIImage { .load(name: "icon_x-circle") }
    }
    
    enum Image {
        static var suzume: UIImage { .load(name: "suzume") }
        static var yourNameIs: UIImage { .load(name: "yourNameIs") }
        static var lordOfTheRings: UIImage { .load(name: "lordOfTheRings") }
        static var signal: UIImage { .load(name: "signal") }
        static var harrypotter: UIImage { .load(name: "harrypotter") }
        static var bears_logo: UIImage { .load(name: "bears_logo") }
        static var bears_white_rect: UIImage { .load(name: "bears_white_rect") }
        static var bears_black_rect: UIImage { .load(name: "bears_black_rect") }
    }
}
