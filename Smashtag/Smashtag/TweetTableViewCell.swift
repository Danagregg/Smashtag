//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by Dana Gregg on 11/29/15.
//  Copyright © 2015 Dana Gregg. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    var tweet: Tweet? {
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var tweetImageView: UIImageView!
    
    @IBOutlet weak var tweetScreenName: UILabel!

    @IBOutlet weak var tweetTextLabel: UILabel!
    
    func updateUI() {
        tweetTextLabel?.attributedText = nil
        tweetScreenName?.text = nil
        tweetImageView?.image = nil
        
        if let tweet = self.tweet {
            tweetTextLabel?.text = tweet.text
            if tweetTextLabel?.text != nil {
                for _ in tweet.media {
                    tweetTextLabel.text! += " 📷"
                }
            }
            tweetScreenName?.text = "\(tweet.user)"
            
            if let profileImageURL = tweet.user.profileImageURL {
                // blocks main thread
                if let imageData = NSData(contentsOfURL: profileImageURL) {
                    tweetImageView?.image = UIImage(data: imageData)
                }
            }
        }
        
    }
}
