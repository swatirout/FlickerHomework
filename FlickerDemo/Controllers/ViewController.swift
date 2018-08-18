//
//  ViewController.swift
//  FlickerDemo
//
//  Created by Swati Rout on 11/08/18.
//  Copyright © 2018 Swati Rout. All rights reserved.
//

import UIKit
class ViewController: UIViewController
{
     var userphotoViewModel: PhotoViewModel?

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var indicator = UIActivityIndicatorView()
    var gridLayout: CustomLayOut = CustomLayOut(numberOfColumns: 3)
    var imagesToDisplay = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userphotoViewModel = PhotoViewModel()
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator.activityIndicatorViewStyle = .gray
        indicator.center = view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        DispatchQueue.global().async {
            self.userphotoViewModel?.getPhotos(searchwith: "Kittens", completion: {
                DispatchQueue.main.async {
                    
                    self.collectionView.reloadData()
                    self.collectionView.collectionViewLayout = self.gridLayout
                    self.indicator.stopAnimating()
                }
            })
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.searchBar.showsCancelButton = false
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        gridLayout.invalidateLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (userphotoViewModel?.numberOfItemsToDisplay(in: section))!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.getImage(urlString: (userphotoViewModel?.urltoshow(for: indexPath))!, collectionView: collectionView, indexpath: indexPath)
        return cell
    }
    
    
}
extension ViewController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.global().async {
            if searchText.count != 0{
            self.userphotoViewModel?.getPhotos(searchwith: searchText, completion: {
                   DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    
                }
                })
            }
            
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
            self.userphotoViewModel?.getPhotos(searchwith: searchBar.text!, completion: {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            })

    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
}



