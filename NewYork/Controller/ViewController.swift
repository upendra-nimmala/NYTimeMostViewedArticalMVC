//
//  ViewController.swift
//  NewYork
//
//  Created by Upendra Nimmala on 08/11/18.
//  Copyright © 2018 Upendra Nimmala. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableViewArticles: UITableView!
    var articals = [Article]()
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showActivityIndicator()
        self.getNYTimesMostViewedArticles()
        tableViewArticles.dataSource = self
        tableViewArticles.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func getNYTimesMostViewedArticles() {
        
        NYTimeArticalServiceHandler.shared.getNYTimeMostViewedArticals(successHandler: { (mostViewedArticlas) in
            DispatchQueue.main.async {
                self.articals = mostViewedArticlas.results
                self.tableViewArticles.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }, errorHandler: { (error) in
            print(error)
        })

    }
    
    // MARK - UITableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticalCell", for: indexPath)
            as! NYTimeArticalTableViewCell
        let artical = articals[indexPath.row] as Article
        cell.NYTimeArticalTitle_lbl.text = artical.title
        cell.NYTimeArticalDate_lbl.text = artical.published_date
        cell.NYTimeArticalSource_lbl.text = artical.source
        let media = (artical.media.first)!
        for mataData in media.mediaMetaData {
            if mataData.format == "Standard Thumbnail" {
                print(mataData.url as Any)
                cell.NYTimeArticalThumb_Img.sd_setImage(with: URL(string: mataData.url!), placeholderImage: UIImage(named: "placeholder.png"))
            }
        }
        cell.textLabel?.numberOfLines = 0
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch tableView {
        case self.tableViewArticles:
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let a_viewController: NYTimeArticalDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "nyTimeArticalDetailsViewController") as! NYTimeArticalDetailsViewController
            a_viewController.articalDetailsurl = articals[indexPath.row].url
            navigationController?.pushViewController(a_viewController, animated: true)
            break
        default:
            break
        }
    }
    
    func showActivityIndicator() {
        activityIndicator.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        activityIndicator.color = UIColor.gray
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
    }

}

