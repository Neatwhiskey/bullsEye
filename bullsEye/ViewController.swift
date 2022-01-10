//
//  ViewController.swift
//  bullsEye
//
//  Created by Jamaaldeen Opasina on 21/11/2021.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var slider:UISlider!
    @IBOutlet var targetLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        currentValue = lroundf(slider.value)
//        targetValue = Int.random(in: 1...100)
        startNewRound()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert(){
        let difference = abs(targetValue - currentValue)
        let point = 100 - difference
        score += point
        let message = "You scored \(point) points"
        let alert = UIAlertController(title: "Hello",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok!",
                                   style: .default,
        handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    @IBAction func sliderMoved(_ slider:UISlider){
        //print("The value of the slider is now \(slider.value)")
        currentValue = lroundf(slider.value)
        
    }
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }
    @IBAction func startNewGame(){
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition,forKey: nil)
    }
}

