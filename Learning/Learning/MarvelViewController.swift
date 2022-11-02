//
//  MarvelViewController.swift
//  Learning
//
//  Created by Rajeshwaran Sarangarajan on 01/11/22.
//

import Foundation
import UIKit

class MarvelViewController : UIViewController {
    @IBAction func showCatchPhrase(sender : UIButton) {
        if let senderLabel = sender.accessibilityLabel {
            switch (senderLabel) {
            case "IronMan":
                var ironMan = Marvel(heroType: .IronMan)
                ironMan.getCatchPhrase()
                let alert = UIAlertController(title: "IRONMAN", message: ironMan.catchPhrase , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                             handler: nil))
                present(alert,animated: true,completion: nil)
                
            case "Thor":
                var thor = Marvel(heroType: .Thor)
                thor.getCatchPhrase()
                let alert = UIAlertController(title: "THOR", message: thor.catchPhrase , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                             handler: nil))
                present(alert,animated: true,completion: nil)

            case "CaptainAmerica":
                var cap = Marvel(heroType: .Cap)
                cap.getCatchPhrase()
                let alert = UIAlertController(title: "CAPTAIN AMERICA", message: cap.catchPhrase , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                             handler: nil))
                present(alert,animated: true,completion: nil)

            default:
                print("Not a valid button")
            }
        }
    }


}

