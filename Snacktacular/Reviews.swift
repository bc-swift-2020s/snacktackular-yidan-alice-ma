//
//  Reviews.swift
//  Snacktacular
//
//  Created by mayidan on 4/17/20.
//  Copyright © 2020 John Gallaugher. All rights reserved.
//

import Foundation
import Firebase


class Reviews {
    var reviewArray: [Review] = []
    var db: Firestore!
    
    init() {
        db = Firestore.firestore()
    }
    
    func loadData(spot: Spot, completed: @escaping () -> ()) {
        guard spot.documentID != "" else {
            return
        }
        db.collection("spots").document(spot.documentID).collection("reviews").addSnapshotListener {(querySnapshot, error) in
            guard error == nil else {
                print("*** ERROR: adding the snapshot listner \(error!.localizedDescription)")
                return completed()
            }
            self.reviewArray = []
            // there are querySnapshot!.documents in the spots snapshot
            for document in querySnapshot!.documents {
                let review = Review(dictionary: document.data())
                review.documentID = document.documentID
                self.reviewArray.append(review)
            }
            completed()
        }
    }
}
