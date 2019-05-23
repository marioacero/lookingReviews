//
//  ListReviewViewController.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/22/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import UIKit

class ListReviewViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var viewModel: ListReviewViewModel = ListReviewViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getReviews()
    }
}

extension ListReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
