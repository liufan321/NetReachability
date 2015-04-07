//
//  NetReachabilityTests.swift
//  NetReachabilityTests
//
//  Created by 刘凡 on 15/4/6.
//  Copyright (c) 2015年 joyios. All rights reserved.
//

import UIKit
import XCTest

class NetReachabilityTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testReachabilityToHost() {
        println(NetReachability.reachabilityWithHostName("www.baidu.com"))
    }
}
