//
//  Extension.swift
//  RickAndMorty
//
//  Created by Sulaymon O'rinov on 18/11/23.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach({addSubview($0)})
    }
}
