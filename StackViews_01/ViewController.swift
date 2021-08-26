//
//  ViewController.swift
//  StackViews_01
//
//  Created by Matteo on 25/08/2021.
//
// Creating a UIStackView (called mainContentView) and adding subViews whose positions and
// dimensions will be managed by the UISTack properties.
// NB When adding a subView to a UIStackView use 'add.ArrangedSubView' and not 'addSubView' !!
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        view.addSubview(mainContentView)
        
        mainContentView.addArrangedSubview(titleLabel)
        mainContentView.addArrangedSubview(starImageView)
        mainContentView.addArrangedSubview(btnView)
        
        setupAutoLayout()
    }
    
    func setupAutoLayout() {
        mainContentView.axis = .vertical
        mainContentView.distribution = .fillProportionally
        
        mainContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mainContentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: mainContentView.topAnchor).isActive = true

        starImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        
        btnView.topAnchor.constraint(equalTo: starImageView.bottomAnchor).isActive = true
        
    }
    
    private let mainContentView: UIStackView = {
       let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Title goes Here"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 32)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        return titleLabel
    }()
    
    private let starImageView: UIImageView = {
        let star = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 100, weight: .bold))
        let starView = UIImageView(image: star)
        starView.translatesAutoresizingMaskIntoConstraints = false
        return starView
    }()
        
    private let btnView: UIButton = {
        let btn = UIButton(type: .roundedRect)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 60)
        btn.backgroundColor = .systemPink
        btn.setTitle("Click Me!", for: .normal)
        btn.tintColor = .white
        return btn
    }()
}

