//
//  CalcViewController.swift
//  Kalculator
//
//  Created by Gena Beraylik on 04.08.17.
//  Copyright © 2017 Beraylik. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    var leftValue = String()
    var rightValue = String()
    var mainEquaison = String()
    var operationBtn = UIButton()
    
    let calcObj = KalcObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupView() {
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        //navigationItem.title = "Kalculator"
        //view.backgroundColor = .blue
        
        let srcWidth = view.frame.width/4
        
        let devideBtn = UIButton(); devideBtn.setButtonStyle(title: "/"); view.addSubview(devideBtn)
        let multiplyBtn = UIButton(); multiplyBtn.setButtonStyle(title: "*"); view.addSubview(multiplyBtn)
        let minusBtn = UIButton(); minusBtn.setButtonStyle(title: "-"); view.addSubview(minusBtn)
        let summBtn = UIButton(); summBtn.setButtonStyle(title: "+"); view.addSubview(summBtn)
        let calculateBtn = UIButton(); calculateBtn.setButtonStyle(title: "="); view.addSubview(calculateBtn)
        
        let clearBtn = UIButton(); clearBtn.setButtonStyle(title: "AC"); view.addSubview(clearBtn)
        let negativeBtn = UIButton(); negativeBtn.setButtonStyle(title: "+/-"); view.addSubview(negativeBtn)
        let persentBtn = UIButton(); persentBtn.setButtonStyle(title: "%"); view.addSubview(persentBtn)
        
        let dotBtn = UIButton(); dotBtn.setButtonStyle(title: ","); view.addSubview(dotBtn)
        let zeroBtn = UIButton(); zeroBtn.setButtonStyle(title: "0"); view.addSubview(zeroBtn)
        let oneBtn = UIButton(); oneBtn.setButtonStyle(title: "1"); view.addSubview(oneBtn)
        let twoBtn = UIButton(); twoBtn.setButtonStyle(title: "2"); view.addSubview(twoBtn)
        let threeBtn = UIButton(); threeBtn.setButtonStyle(title: "3"); view.addSubview(threeBtn)
        let fourBtn = UIButton(); fourBtn.setButtonStyle(title: "4"); view.addSubview(fourBtn)
        let fiveBtn = UIButton(); fiveBtn.setButtonStyle(title: "5"); view.addSubview(fiveBtn)
        let sixBtn = UIButton(); sixBtn.setButtonStyle(title: "6"); view.addSubview(sixBtn)
        let sevenBtn = UIButton(); sevenBtn.setButtonStyle(title: "7"); view.addSubview(sevenBtn)
        let eightBtn = UIButton(); eightBtn.setButtonStyle(title: "8"); view.addSubview(eightBtn)
        let nineBtn = UIButton(); nineBtn.setButtonStyle(title: "9"); view.addSubview(nineBtn)
        
        addConstraintsWith(format: "H:|[v0(\(srcWidth*2))][v1(\(srcWidth))][v2(\(srcWidth))]|", views: zeroBtn, dotBtn, calculateBtn)
        addConstraintsWith(format: "H:|[v0(\(srcWidth))][v1(\(srcWidth))][v2(\(srcWidth))][v3(\(srcWidth))]|", views: oneBtn, twoBtn, threeBtn, summBtn)
        addConstraintsWith(format: "H:|[v0(\(srcWidth))][v1(\(srcWidth))][v2(\(srcWidth))][v3(\(srcWidth))]|", views: fourBtn, fiveBtn, sixBtn, minusBtn)
        addConstraintsWith(format: "H:|[v0(\(srcWidth))][v1(\(srcWidth))][v2(\(srcWidth))][v3(\(srcWidth))]|", views: sevenBtn, eightBtn, nineBtn, multiplyBtn)
        addConstraintsWith(format: "H:|[v0(\(srcWidth))][v1(\(srcWidth))][v2(\(srcWidth))][v3(\(srcWidth))]|", views: clearBtn, negativeBtn, persentBtn, devideBtn)
        
        addConstraintsWith(format: "V:[v0(\(srcWidth))][v1(\(srcWidth))][v2(\(srcWidth))][v3(\(srcWidth))][v4(\(srcWidth))]|", views: clearBtn, sevenBtn, fourBtn, oneBtn, zeroBtn)
        addConstraintsWith(format: "V:[v0(\(srcWidth))][v1(\(srcWidth))][v2(\(srcWidth))][v3(\(srcWidth))]-\(srcWidth)-|", views: negativeBtn, eightBtn, fiveBtn, twoBtn)
        addConstraintsWith(format: "V:[v0(\(srcWidth))][v1(\(srcWidth))][v2(\(srcWidth))][v3(\(srcWidth))][v4(\(srcWidth))]|", views: persentBtn, nineBtn, sixBtn, threeBtn, dotBtn)
        addConstraintsWith(format: "V:[v0(\(srcWidth))][v1(\(srcWidth))][v2(\(srcWidth))][v3(\(srcWidth))][v4(\(srcWidth))]|", views: devideBtn, multiplyBtn, minusBtn, summBtn, calculateBtn)
        
        view.addSubview(outputLabel)
        addConstraintsWith(format: "H:|[v0]|", views: outputLabel)
        addConstraintsWith(format: "V:|-10-[v0]-\(srcWidth*5)-|", views: outputLabel)
       
        outputLabel.text = "0"
    }
    
    func addConstraintsWith(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, value) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = value
            value.translatesAutoresizingMaskIntoConstraints = false
        }
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }

    @objc func multiply(sender: UIButton) {
        let command = sender.title(for: .normal)!
        
        switch command {
        case "/", "*", "+", "-":
            sender.layer.borderWidth = 1.3
            operationBtn = sender
        default:
            operationBtn.layer.borderWidth = 0.3
        }
        
        outputLabel.text = calcObj.pressedBtn(command: command)
        
        
    }
    
    
    let outputLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.darkText
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 62.0)
        label.textColor = .white
        return label
    }()
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
