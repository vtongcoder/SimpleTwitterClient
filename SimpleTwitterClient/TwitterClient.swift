//
//  TwitterClient.swift
//  SimpleTwitterClient
//
//  Created by Dan Tong on 9/11/15.
//  Copyright © 2015 iOS Swift Course. All rights reserved.
//

import UIKit

let twitterConsumerKey = "6zk4EFFqx1Bsr3S915tCJFddx"
let twitterConsumerSecret = "6BFBnE2sIYbr8MsPki0SbtbAOWKRxYTnZ0piHzQPTeWcPD5nQ0"
let twitterBasedURL = NSURL(string:  "https://api.twitter.com")


class TwitterClient: BDBOAuth1RequestOperationManager {
  class var sharedInstance: TwitterClient {
    struct Static {
      static let instance = TwitterClient( baseURL: twitterBasedURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
    }
    return Static.instance
  }
}
