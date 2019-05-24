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
    var isLoadingReviews : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setViewModelBinding()
        viewModel.getReviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = AppConstants.navigationBarColor
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

    }
    
    func configureTableView() {
        listTableView.registerNib(ListCustomTableViewCell.stringRepresentation)
        let footerView =  LoadingFooterView.instanceFromNib()
        listTableView.tableFooterView = footerView
        isFooterHidden(true)
    }
    
    func setViewModelBinding() {
        viewModel.reloadTableView = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.isLoadingReviews = false
            strongSelf.listTableView.reloadData()
            strongSelf.isFooterHidden(true)
        }
        
        viewModel.isFooterHidden = { [weak self] (isHidden) in
            guard let strongSelf = self else { return }
            strongSelf.isFooterHidden(isHidden)
        }
    }
    
    func isFooterHidden(_ isHidden: Bool) {
        listTableView.tableFooterView?.isHidden = isHidden
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as? UINavigationController
        let controller = navController?.viewControllers[0] as! FiltersViewController
        controller.filters = viewModel.filters
        controller.delegate = self
    }
}

extension ListReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ListCustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: ListCustomTableViewCell.stringRepresentation, for: indexPath) as! ListCustomTableViewCell
        let itemReview = viewModel.dataSource[indexPath.row]
        cell.setCell(item: itemReview)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height && !isLoadingReviews{
            viewModel.getReviews()
            isFooterHidden(false)
            isLoadingReviews = true
            
        }
    }
}

extension ListReviewViewController: FiltersViewControllerDelegate {
    
    func applyFilters(filters: Filters) {
        viewModel.filters = filters
        viewModel.filters.page = 0
        viewModel.dataSource = []
        listTableView.reloadData()
        isFooterHidden(false)
        viewModel.getReviews()
    }
}
