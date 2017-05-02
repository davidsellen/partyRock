//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by David Santos on 30/04/17.
//  Copyright © 2017 dscode. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func updateUI(partyRock: PartyRock){
        
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)
        
        DispatchQueue.global().async(execute: {
            
            do {
                let data = try Data(contentsOf: url!)
                DispatchQueue.global().sync (execute: {
                    self.videoPreviewImage.image = UIImage(data: data)
                })
                
            } catch {
                print("\(error.localizedDescription)")
            }
            

            
        })
        
       
        
       
    }
}
