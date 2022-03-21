//
//  ViewController.swift
//  PROJE2
//
//  Created by İSMAİL AÇIKYÜREK on 9.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var contries = [String]()
    var score = 0
    var correctAnswer = 0
    var sorulanSoruSayisi = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    
        button1.layer.borderColor = UIColor(red: 9.0, green: 0.1, blue: 10.3, alpha: 1.3).cgColor
        button2.layer.borderColor = UIColor.green.cgColor
        button3.layer.borderColor = UIColor.red.cgColor

        
        askQuestion(action: nil)
    }
    
    func askQuestion(action : UIAlertAction!) {
        contries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        print(contries)
        button1.setImage(UIImage(named: contries[0]), for: .normal)
        button2.setImage(UIImage(named: contries[1]), for: .normal)
        button3.setImage(UIImage(named: contries[2]), for: .normal)
        title = contries[correctAnswer].uppercased()
        
        if sorulanSoruSayisi == 5 {//bes sorudan sonra oyunu yedinden baslat
            let ac = UIAlertController(title: "OYUN BİTTİ", message: "your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "continue", style: .default, handler: restart))
            present(ac, animated: true)
      
        }
        
        func restart(action : UIAlertAction!) {
            score = 0
            sorulanSoruSayisi = 1
        }
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        
        if sender.tag == correctAnswer {
            title = "correct"
            sorulanSoruSayisi += 1
            score += 1
        } else {
            title = "bu bayrak \(contries[sender.tag]) bayrağı"
            score -= 1
            sorulanSoruSayisi += 1
        }
        
        
        let ac = UIAlertController(title: title, message: "your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
  
 
   
    
}

