//
//  Marvel.swift
//  Learning
//
//  Created by Rajeshwaran Sarangarajan on 01/11/22.
//

import Foundation

class Marvel {
    var catchPhrase : String
    var heroType : HeroType
    
    init(heroType : HeroType){
        self.heroType = heroType
        catchPhrase = ""
    }
    
    func getCatchPhrase(){
        if self.heroType == .IronMan {
            self.catchPhrase = "I am IronMan"
        }
        else if self.heroType == .Thor {
            self.catchPhrase = "I am worthy"
        }
        else {
            self.catchPhrase = "I can do this all day"
        }
    }
    
}
enum HeroType {
    case IronMan
    case Thor
    case Cap
}
