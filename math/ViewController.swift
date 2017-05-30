//
//  ViewController.swift
//  math
//
//  Created by Steve Matte on 2017-05-09.
//  Copyright © 2017 smatte. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var mainView: MainView {return view as! MainView}
    var goodAnswer = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func loadView() {
        view = MainView()
        generateQuestion()
        mainView.answer.delegate = self
    }

    func generateQuestion() {
        let a = arc4random_uniform(11)
        let b = arc4random_uniform(11)
        let isSubstraction = arc4random_uniform(2) == 0

        if a + b > 10 || isSubstraction  {
            let c = max(a, b)
            let d = min(a, b)
            goodAnswer = Int(c - d)
            mainView.question.text = "\(c) - \(d) ="
        }  else {
            goodAnswer = Int(a + b)
            mainView.question.text = "\(a) + \(b) = "
        }
    }

    fileprivate func notifyBadAnswer() {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let value = Int(textField.text! + string) else {
            textField.text = ""
            return false
        }

        if value == goodAnswer {
            textField.text = ""
            generateQuestion()
            return false
        } else if goodAnswer < 10 || value > 10 {
            notifyBadAnswer()
            textField.text = ""
            return false
        }
        return true
    }
}
