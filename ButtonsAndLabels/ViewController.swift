//
//  ViewController.swift
//  ButtonsAndLabels
//
//  Created by Corbin Robinson on 3/6/20.
//  Copyright © 2020 Corbin Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var wins = [Set<Int>]()
    var x = Set<Int>()
    var o = Set<Int>()
    var turn = true
    var t : Set<Int> = [1,2,3,4,5,6,7,8,9]
    var buttons = [UIButton]()
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var winner: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttons.append(b1)
        buttons.append(b2)
        buttons.append(b3)
        buttons.append(b4)
        buttons.append(b5)
        buttons.append(b6)
        buttons.append(b7)
        buttons.append(b8)
        buttons.append(b9)
        wins.append([1,2,3])
        wins.append([4,5,6])
        wins.append([7,8,9])
        wins.append([1,4,7])
        wins.append([2,5,8])
        wins.append([3,6,9])
        wins.append([1,5,9])
        wins.append([3,5,7])
    }
    
    @IBAction func b1a(_ sender: Any) {
        pressed(b1, 1)
        check()
    }
    @IBAction func b2a(_ sender: Any) {
        pressed(b2, 2)
        check()
    }
    @IBAction func b3a(_ sender: Any) {
        pressed(b3, 3)
        check()
    }
    @IBAction func b4a(_ sender: Any) {
        pressed(b4, 4)
        check()
    }
    @IBAction func b5a(_ sender: Any) {
        pressed(b5, 5)
        check()
    }
    @IBAction func b6a(_ sender: Any) {
        pressed(b6, 6)
        check()
    }
    @IBAction func b7a(_ sender: Any) {
        pressed(b7, 7)
        check()
    }
    @IBAction func b8a(_ sender: Any) {
        pressed(b8, 8)
        check()
    }
    @IBAction func b9a(_ sender: Any) {
        pressed(b9, 9)
        check()
    }
    
    func pressed(_ b : UIButton, _ bp : Int){
        //b.setTitle("x", for: .normal)
        if(b.titleLabel!.text == " "){
            if(turn == true){
                b.setTitle("❌", for: .normal)
                turn = false
                x.insert(bp)
            }else{
                b.setTitle("⭕️", for: .normal)
                turn = true
                o.insert(bp)
            }
        }else{
            let a = UIAlertController(title: "‼️", message: "That spot is taken", preferredStyle: .alert)
            a.addAction(UIAlertAction(title: "Oops", style: .default))
            self.present(a , animated: true)
        }
    }
    
    func check(){
        for i in wins{
            if i.isSubset(of: x){
                winner.text = "X"
                wonnered("X")
            }
            else if i.isSubset(of: o){
                winner.text = "O"
                wonnered("O")
            }
        }
        if t == (x.union(o)){
            tie()
        }
    }
    
    func wonnered(_ w : String){
        let a = UIAlertController(title: "‼️", message: "Congrats \(w)! You win!", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Cool", style: .default))
        a.addAction(UIAlertAction(title: "Reset", style: .default, handler: {(action: UIAlertAction!) in self.reset()}))
        self.present(a , animated: true)
    }

    func reset(){
        for i in buttons{
            i.setTitle(" ", for: .normal)
        }
        x.removeAll()
        o.removeAll()
        turn = !turn
    }
    
    func tie(){
        let a = UIAlertController(title: "‼️", message: "You tied!", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Oops", style: .default))
        a.addAction(UIAlertAction(title: "Reset", style: .default, handler: {(action: UIAlertAction!) in self.reset()}))
        self.present(a , animated: true)
    }

}

