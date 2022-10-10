//
//  BindingSearchBar.swift
//  VM
//
//  Created by Hima Parmar on 09/10/22.
//

import Foundation
import UIKit

class BindingSearchBar: UISearchBar {
    
    var textChanged: (String) -> Void = { _ in }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
//    actio
//        target(forAction: #selector(searchTermDidChange), withSender: self, for: .editingChanged)
//        UITapGestureRecognizer(target: self, action:#selector(searchTermDidChange))
        target(forAction: #selector(searchTermDidChange), withSender: self)
    }
    
    func bind(callback: @escaping (String) -> Void) {
        textChanged = callback
        
    }
    
    @objc func searchTermDidChange(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            textChanged(text)
            print(".......................................................")
            print(textChanged)
        }
    }
}
