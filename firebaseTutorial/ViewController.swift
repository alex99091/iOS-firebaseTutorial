//
//  ViewController.swift
//  firebaseTutorial
//
//  Created by BOONG KI KWAK on 2023/05/17.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰를 띄울 때, firebase data reference 가져오기
        ref = Database.database().reference()
    }


}

