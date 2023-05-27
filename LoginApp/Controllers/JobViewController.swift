//
//  JobViewController.swift
//  LoginApp
//
//  Created by Максим Евграфов on 28.05.2023.
//

import UIKit

class JobViewController: UIViewController {
    
    @IBOutlet var skillsTableView: UITableView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var experienceLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    
    var job: Job!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skillsTableView.dataSource = self
        skillsTableView.delegate = self
        
        titleLabel.text = job.title
        experienceLabel.text = "\(job.experience) лет"
        positionLabel.text = job.position
    }
}

extension JobViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        job.technologies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobSkill", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        let data = job.technologies[indexPath.row]
        
        content.text = data
        cell.contentConfiguration = content
        
        return cell
    }
}
