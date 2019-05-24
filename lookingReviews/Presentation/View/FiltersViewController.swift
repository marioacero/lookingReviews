//
//  FiltersViewController.swift
//  lookingReviews
//
//  Created by Mario Acero on 5/22/19.
//  Copyright © 2019 Mario Acero. All rights reserved.
//

import UIKit

protocol FiltersViewControllerDelegate: class {
    func applyFilters(filters: Filters)
}

class FiltersViewController: UIViewController {

    @IBOutlet weak var filterDate: UISwitch!
    @IBOutlet weak var filterRating: UISwitch!
    @IBOutlet weak var segmentDirection: UISegmentedControl!
    @IBOutlet weak var ratingSlider: UISlider!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var filters: Filters!
    weak var delegate: FiltersViewControllerDelegate?
    
    struct Constants {
        static let ratingDafultLabel: String = "0"
        static let descOrder: String = "desc"
        static let rating: String = "rating"
        static let ascOrder: String = "asc"
        static let byDateReview: String = "date_of_review"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingSlider.addTarget(self, action: #selector(FiltersViewController.sliderDidEndSliding(notification:)),
                               for: ([.touchUpInside,.touchUpOutside, .touchDragInside]))
        filtersDefault()
        setFilters()
    }
    
    func filtersDefault() {
        filterDate.isOn = false
        filterRating.isOn = false
        ratingSlider.value = 0.0
        ratingSlider.isContinuous = false
        ratingLabel.text = Constants.ratingDafultLabel
        segmentDirection.isEnabled = false
    }
    
    func setFilters() {
        if let direction = filters.direction {
            segmentDirection.isEnabled = true
            var indexSelected: Int = 0
            if direction == Constants.descOrder {
                indexSelected = 1
            }
            segmentDirection.selectedSegmentIndex = indexSelected
        }
        
        if let sortBy: String = filters.sortBy {
            if sortBy == Constants.rating {
                filterRating.isOn = true
            }else {
                filterDate.isOn = true
            }
        }
        
        if let valueRating: Int = filters.rating {
            ratingSlider.value = Float(valueRating)
            ratingLabel.text = String(valueRating)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = UIColor(red: 232/255,
                                                                   green: 91/255,
                                                                   blue: 34/255,
                                                                   alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    
    @objc func sliderDidEndSliding(notification: NSNotification) {
        let value = ceil(ratingSlider.value)
        let intValue = Int(value)
        ratingSlider.value = value
        ratingLabel.text = String(intValue)
    }
    
    @IBAction func starAction(_ sender: UISwitch) {
        if sender.isOn {
            filterDate.isOn = false
        }
        segmentDirection.isEnabled = sender.isOn || filterDate.isOn
    }
    
    @IBAction func dateAction(_ sender: UISwitch) {
        if sender.isOn {
            filterRating.isOn = false
        }
        segmentDirection.isEnabled = sender.isOn || filterRating.isOn
    }
    
    @IBAction func applyFiltersAction(_ sender: UIButton) {
        filters.sortBy = nil
        filters.direction = nil
        filters.rating = nil
        
        if segmentDirection.isEnabled {
            var direction = Constants.ascOrder
            if segmentDirection.selectedSegmentIndex == 1 {
                direction = Constants.descOrder
            }
            filters.direction = direction
        }
        
        if filterRating.isOn {
            filters.sortBy = Constants.rating
        }else if filterDate.isOn {
            filters.sortBy = Constants.byDateReview
        }
        
        let value = ceil(ratingSlider.value)
        let intValue = Int(value)
        if intValue > 0 {
            filters.rating = intValue
        }
        delegate?.applyFilters(filters: filters)
        closeViewAction(self)
    }
    
    @IBAction func resetFilters(_ sender: Any) {
        filtersDefault()
    }
    
    @IBAction func closeViewAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
