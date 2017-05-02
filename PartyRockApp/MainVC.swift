//
//  ViewController.swift
//  PartyRockApp
//
//  Created by David Santos on 30/04/17.
//  Copyright © 2017 dscode. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fakeData ()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func addPartyRock (imageURL: String, videoURL: String, videoTitle: String) {
        
        let imageURLFormatted = "\(imageURL)?custom=true&w=68&h=68&stc=true&jpg444=true&jpgq=90&sp=68&sigh=W8ZOoAfRSxR93Tg64QXvePGJyRI"
        let videoURLFormatted = "<iframe width=\"100%\" height=\"219\" src=\"https://www.youtube.com/embed/\(videoURL)\" frameborder=\"0\" allowfullscreen></iframe>"
        let partyRock = PartyRock(imageURL: imageURLFormatted, videoURL: videoURLFormatted, videoTitle: videoTitle)
        
        partyRocks.append(partyRock)
    }
    
    func fakeData () {
     
        addPartyRock(imageURL:  "https://i.ytimg.com/vi/mq56YbfbD7U/hqdefault.jpg",
                     videoURL: "mq56YbfbD7U",
                     videoTitle: "Tears")
        
        addPartyRock(imageURL:  "https://i.ytimg.com/vi/n_71XNuk3T0/hqdefault.jpg",
                     videoURL: "n_71XNuk3T0",
                     videoTitle: "Octavarium")
        
        addPartyRock(imageURL: "https://i.ytimg.com/vi/Qr8g4d6gxZ8/hqdefault.jpg",
                     videoURL: "Qr8g4d6gxZ8",
                     videoTitle: "Illumination Theory")
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
        
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
                
            }
        }
        
    }
}

