//
//  ViewController.swift
//  Learning
//
//  Created by Rajeshwaran Sarangarajan on 28/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    @IBAction func showPopUps(sender : UIButton) {
        if let senderLabel = sender.accessibilityLabel {
            switch (senderLabel) {
            case "Harry":
                var harry:Hogwarts
                harry = Hogwarts(name: "Harry Potter", wandType: .ElderWand)
                harry.getXP()
                hogWartsPopUp(wizard: harry)
            case "Ron":
                var ron:Hogwarts
                ron = Hogwarts(name: "Ron Weasley", wandType: .Broken)
                ron.getXP()
                hogWartsPopUp(wizard: ron)
            case "Hermione":
                var hermione:Hogwarts
                hermione = Hogwarts(name: "Hermione Granger", wandType: .DragonString)
                hermione.getXP()
                hogWartsPopUp(wizard: hermione)
            case "Cars":
                var ferrari:Car!
                ferrari = Car(type: .Sport, transmissionMode: .Drive)
                ferrari.start(minutes: 120)
                let alert = UIAlertController(title: "Car Miles!!!", message: "The car has run for "+String(ferrari.miles) , preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                             handler: nil))
                present(alert,animated: true,completion: nil)
                
            case "Submit":
                let alert = UIAlertController(title: "Welcome to Demo", message: "This is a demo", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                             handler: nil))
                present(alert,animated: true,completion: nil)
            default:
                print("Not a valid button")
            }
        }
    }
    
    func hogWartsPopUp(wizard : Hogwarts){
        let alert = UIAlertController(title: wizard.name, message: "Magic Power is  "+wizard.magicXP , preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,
                                     handler: nil))
        present(alert,animated: true,completion: nil)
    }
}
