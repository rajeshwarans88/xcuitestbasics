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
        
        let swipeRight = UISwipeGestureRecognizer (target: self,
                                                   action: #selector(swipeFunc(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer (target: self,
                                                   action: #selector(swipeFunc(gesture:)))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeLeft)

    }
    
    @objc func swipeFunc(gesture : UISwipeGestureRecognizer) {
        if gesture.direction == .right {
            performSegue(withIdentifier: "swipeRight", sender: self)
        }
        else if gesture.direction == .left {
            performSegue(withIdentifier: "swipeLeft", sender: self)
        }
    }
        
    @IBAction func showPopUps(sender : UIButton) {
        if let senderLabel = sender.accessibilityLabel {
            switch (senderLabel) {
            case "Harry":
                var harry:Hogwarts
                harry = Hogwarts(name: "Harry Potter", wandType: .ElderWand)
                harry.setXP()
                hogWartsPopUp(wizard: harry)
            case "Ron":
                var ron:Hogwarts
                ron = Hogwarts(name: "Ron Weasley", wandType: .Broken)
                ron.setXP()
                hogWartsPopUp(wizard: ron)
            case "Hermione":
                var hermione:Hogwarts
                hermione = Hogwarts(name: "Hermione Granger", wandType: .DragonString)
                hermione.setXP()
                hogWartsPopUp(wizard: hermione)
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
