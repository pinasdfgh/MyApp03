//
//  ViewController.swift
//  MyApp03
//
//  Created by user on 2017/6/20.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var labelResult: UITextField!
    @IBOutlet weak var textHistory: UITextView!
    
    private var counter = 0
    private var stringAnswer:String?
    
    @IBAction func click(_ sender: Any) {
        counter += 1
        let stringInput = textInput.text!
        print(stringInput)
        
        let SResult = BradAPI.checkAB(answer: stringAnswer!,guess:stringInput)
        
        labelResult.text = SResult
        
        textHistory.text.append("\(counter). \(stringInput)=>\(SResult)\n")
        textInput.text = ""
        if SResult == "3A0B"{
            showWinnweDialog()
        }else if counter == 10{
            showLoserDialog()
        }
        textInput.resignFirstResponder()
        
    }
    func showWinnweDialog(){
        let alert:UIAlertController = UIAlertController(title:"遊戲結果",message:"恭喜",preferredStyle:UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK",style:UIAlertActionStyle.default,handler:{
            (action:UIAlertAction) -> Void in print("OK")
        })
        alert.addAction(okAction)
        //present為UIViewController的方法
        self.present(alert, animated: true, completion: nil)
    }
    func showLoserDialog(){
        let alert:UIAlertController = UIAlertController(title:"遊戲結束",message:"殘念:Ans = \(stringAnswer!)",preferredStyle:UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"OK",style:UIAlertActionStyle.default,
            handler:{
                (action:UIAlertAction) ->Void in
                self.initRound()
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func initRound(){
        textInput.text = ""
        labelResult.text = "顯示結果"
        textHistory.text = ""
        stringAnswer = BradAPI.createAnswer(4)
        counter = 0
        textInput.resignFirstResponder()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        click(self)
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textInput.delegate = self
        initRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

