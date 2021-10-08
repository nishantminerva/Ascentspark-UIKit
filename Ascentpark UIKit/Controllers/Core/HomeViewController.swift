//
//  ViewController.swift
//  Ascentpark UIKit
//
//  Created by Nishant Kumar on 08/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var collectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout:  UICollectionViewCompositionalLayout { sectionIndexColor, _ -> NSCollectionLayoutSection? in
        return HomeViewController.createSectionLayout(section: 1)
    })
    
//    let userCardView : UIView = {
//        let view = UIView()
//        view.backgroundColor = .gray
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    let actionButton : UIButton = {
//        let btn = UIButton(type:.system)
//        btn.backgroundColor = .blue
//        //        btn.setTitle("Button Name", for: .normal)
//        //        btn.tintColor = .white
//        btn.layer.cornerRadius = 5
//        btn.clipsToBounds = true
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
//
//    // Create the UIImageView object with frame
//    let customImageView : UIImageView = {
//        let imageView = UIImageView()
//        imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
//        imageView.image = UIImage(named: "asriel")
//
//        // set the image to aspect fit
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
    
    
    var users = [User]()
    
    var nameLabel: UILabel!
    //    var actionButtons = [UIButton]()
    
//    override func loadView() {
//        view = UIView()
//        view.backgroundColor = .white
//
//        // more code to come!
//        nameLabel = UILabel()
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.textAlignment = .center
//        nameLabel.text = "Nishant"
//        view.addSubview(nameLabel)
//
//        //        NSLayoutConstraint.activate([
//        //                nameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
//        //                nameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
//        //            ])
//    }
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.tintColor = .label
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString = "https://smileelive.webappfactory.co/api/demo-data"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // we're OK to parse!
                parse(json: data)
                
            }
            configureCollectionView()
            view.addSubview(spinner)
        }
        
        title = "Home"
        view.backgroundColor = .systemBackground
        
//        userCardView.addSubview(customImageView)
//        userCardView.addSubview(actionButton)
//        view.addSubview(userCardView)
        
        view.addSubview(spinner)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
    }
    
    private static func createSectionLayout(section : Int) -> NSCollectionLayoutSection {
        //        Creating layout
        
        //        Item
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        //        group
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120)), subitem: item, count: 1)
        //        section
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let decodedData = try? decoder.decode(Users.self, from: json) {
            users = decodedData.data
            print(users)
        }
    }
    
//    func setUpAutoLayout() {
//        userCardView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
//        userCardView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
//        userCardView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
//    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGreen
        return cell
    }
}
