//
//  extension.swift
//  vidio clone
//
//  Created by Yudha Setyaji on 2022/3/31.
//

import UIKit

extension UIView {

    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
