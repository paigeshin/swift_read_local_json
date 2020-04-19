//
//  ViewController.swift
//  swift_read_local_JSON
//
//  Created by shin seunghyun on 2020/04/19.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

struct kanji: Decodable {
    
    let index: Int?
    let kanji: String?
    let meaning: String?
    let meaning_kr: String?
    let meaning_fr: String?
    let intention: String?
    let intention_kr: String?
    let intention_fr: String?
    
    init(json: [String: Any]) {
        index = json["index"] as? Int
        kanji = json["kanji"] as? String
        meaning = json["meaning"] as? String
        meaning_kr = json["meaning_kr"] as? String
        meaning_fr = json["meaning_fr"] as? String
        intention = json["intention"] as? String
        intention_kr = json["intention_kr"] as? String
        intention_fr = json["intention_fr"] as? String
    }
    
}

class DefaultReadingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let url = Bundle.main.url(forResource: "long_sentence_v6", withExtension: "json")
            let jsonData = try Data(contentsOf: url!)
            let kanjis: [kanji] = try JSONDecoder().decode([kanji].self, from: jsonData)
            //All Data in states
            
            for kanji in kanjis {
                let kanji = kanji.kanji
                print(kanji!)
            }
            
            
        } catch {
            print(error.localizedDescription)
        }
        
    }


}

