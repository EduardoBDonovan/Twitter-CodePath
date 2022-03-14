//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Eddie Donovan on 3/11/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    //cell content
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(isRetweeted: true)
        }, failure:  { (error) in
            print("Error is retweeting: \(error)")
        })
    }
    
    var tweetId:Int = -1 //negative to know not set
    
    //var retweeted:Bool = false
    
    @IBAction func favTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(isFavorited: true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(isFavorited: false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    func setRetweeted(isRetweeted:Bool){
        if(isRetweeted){
            retweetBtn.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetBtn.isEnabled = false
        } else {
            retweetBtn.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetBtn.isEnabled = true
        }
    }
    
    var favorited:Bool = false
    
    func setFavorited(isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favBtn.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        } else {
            favBtn.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
