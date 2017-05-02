//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by David Santos on 30/04/17.
//  Copyright © 2017 dscode. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var webView : UIWebView!
    @IBOutlet weak var videoTitleLb: UILabel!
    private var _partyRock : PartyRock!
    
    var partyRock: PartyRock {
        
        get {
            return _partyRock
        }
        set {
            _partyRock = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoTitleLb.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
