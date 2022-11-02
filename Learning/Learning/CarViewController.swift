//
//  CarViewController.swift
//  Learning
//
//  Created by Rajeshwaran Sarangarajan on 01/11/22.
//

import Foundation
import UIKit

class CarViewController : UIViewController {
    @IBAction func showCarPopUps(sender : UIButton) {
        if let senderLabel = sender.accessibilityLabel {
            switch (senderLabel) {
            case "Ferrari":
                var ferrari = Car(name : "Ferrari", type: .Sport, transmissionMode: .Drive)
                ferrari.start(minutes: 120)
                let alert = UIAlertController(title: ferrari.carName, message: "The car has run for "+String(ferrari.miles) , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                             handler: nil))
                present(alert,animated: true,completion: nil)
                
            case "Honda":
                var honda = Car(name: "Honda", type: .Economy, transmissionMode: .Drive)
                honda.start(minutes: 120)
                let alert = UIAlertController(title: honda.carName, message: "The car has run for "+String(honda.miles) , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                             handler: nil))
                present(alert,animated: true,completion: nil)
                
            case "Jeep":
                var jeep = Car(name : "Jeep", type: .OffRoad, transmissionMode: .Drive)
                jeep.start(minutes: 120)
                let alert = UIAlertController(title: jeep.carName, message: "The car has run for "+String(jeep.miles) , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                             handler: nil))
                present(alert,animated: true,completion: nil)

            default:
                print("Not a valid button")
            }
        }
    }


}
