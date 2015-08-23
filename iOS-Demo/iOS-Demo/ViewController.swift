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

    @IBOutlet weak var networkStatusLabel: UILabel!
    
    private lazy var reachability: NetReachability = NetReachability(hostname: "www.apple.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityChanged", name: FFReachabilityChangedNotification, object: nil)
        reachability.startNotifier()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: FFReachabilityChangedNotification, object: nil)
    }
    
    func reachabilityChanged() {
        updateUI()
    }
    
    @IBAction func checkReachablity() {
        updateUI()
    }
    
    func updateUI() {
        networkStatusLabel.text = reachability.currentReachabilityStatus.description
    }
}

