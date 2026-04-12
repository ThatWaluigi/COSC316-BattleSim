//
//  UIHelper.swift
//  BattleSim
//
//  Created by Quintin Dennison on 2026-04-11.
//

import SwiftUI

struct UIHelper {
    enum UI_BGS: String{
        case MenuUI
        case DividerUI
        case ButtonUI
    }
    
    static func GetBackground(type: UI_BGS) -> some View{
        return Image(type.rawValue)
            .resizable(
                capInsets: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
                resizingMode: .tile
            )
    }
}
