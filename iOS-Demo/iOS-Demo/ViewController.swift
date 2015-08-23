//
//  ViewController.swift
//  iOS-Demo
//
//  Created by 刘凡 on 15/4/7.
//  Copyright (c) 2015年 joyios. All rights reserved.
//

import UIKit
import NetReachability

class ViewController: UIViewController {

    @IBOutlet weak var hostnameText: UITextField!
    @IBOutlet weak var networkStatusLabel: UILabel!
    
    @IBAction func checkReachablity() {
        networkStatusLabel.text = "\(NetReachability.reachabilityWithHostName(hostnameText.text!))"
    }
}

