//
//  Image.swift
//  NewYork
//
//  Created by Upendra Nimmala on 08/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
