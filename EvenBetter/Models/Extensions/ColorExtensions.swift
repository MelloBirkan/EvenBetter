//
//  ColorExtensions.swift
//  EvenBetter
//
//  Created by Marcello Gonzatto Birkan on 13/04/24.
//

import SwiftUI

extension Color {
    func darkened(by amount: CGFloat = 0.2) -> Color {
        let uiColor = UIColor(self)
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        if uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            brightness -= amount
            brightness = max(min(brightness, 1), 0)
            return Color(hue: hue, saturation: saturation, brightness: brightness, opacity: alpha)
        }
        
        return self 
    }
}
