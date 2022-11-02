//
//  Hogwarts.swift
//  Learning
//
//  Created by Rajeshwaran Sarangarajan on 28/10/22.
//

import Foundation

class Hogwarts {
    var magicXP = ""
    var name:String
    var wandType:WandType
    init(name:String, wandType : WandType){
        self.name = name
        self.wandType = wandType
    }
    func setXP() {
       if self.wandType == .Broken {
           self.magicXP = "Poor"
       }
        if self.wandType == .DragonString {
            self.magicXP = "High"
       }
        if self.wandType == .ElderWand {
            self.magicXP = "Legendary"
       }
    }
}
enum WandType {
    case New
   case Broken
   case DragonString
   case ElderWand
}
