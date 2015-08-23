//
//  NetReachability.swift
//  
//
//  Created by 刘凡 on 15/4/6.
//
//

import Foundation
import SystemConfiguration

public enum NetworkStatus: CustomStringConvertible {
    case NotReachable, ReachableViaWiFi, ReachableViaWWAN
    
    public var description: String {
        switch self {
        case .ReachableViaWWAN:
            return "2G/3G/4G"
        case .ReachableViaWiFi:
            return "WiFi"
        case .NotReachable:
            return "No Connection"
        }
    }
}

public class NetReachability {
    
    public class func reachabilityWithHostName(hostName: String) -> NetworkStatus {
        let reachability = SCNetworkReachabilityCreateWithName(nil, hostName)!
        
        var flags = SCNetworkReachabilityFlags(rawValue: 0)
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        if (flags.rawValue & SCNetworkReachabilityFlags.Reachable.rawValue == 0) {
            return NetworkStatus.NotReachable;
        }
        
        var returnValue = NetworkStatus.NotReachable;
        if flags.rawValue & SCNetworkReachabilityFlags.ConnectionRequired.rawValue == 0 {
            returnValue = NetworkStatus.ReachableViaWiFi
        }
        
        if flags.rawValue & SCNetworkReachabilityFlags.ConnectionOnDemand.rawValue != 0
            || flags.rawValue & SCNetworkReachabilityFlags.ConnectionOnTraffic.rawValue != 0 {
                
                if flags.rawValue & SCNetworkReachabilityFlags.InterventionRequired.rawValue == 0 {
                    returnValue = NetworkStatus.ReachableViaWiFi
                }
        }
        
        if (flags.rawValue & SCNetworkReachabilityFlags.IsWWAN.rawValue) == SCNetworkReachabilityFlags.IsWWAN.rawValue {
            returnValue = NetworkStatus.ReachableViaWWAN
        }
        
        return returnValue;
    }
}
