//
//  VideoListVC.swift
//  UITableView-Programmatic
//
//  Created by Aslan Korkmaz on 16.04.2025.
//

import UIKit

class VideoListVC: UIViewController {
    
    var tableView = UITableView()
    var videos = [Video]()
    
    struct Cells {
        static let videoCell = "VideoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cloud List"
        videos = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as? VideoCell else {
            fatalError("Could not dequeue VideoCell")
        }
        let video = videos[indexPath.row]
        cell.set(video: video)
        return cell
    }
}

extension VideoListVC {
    
    func fetchData() -> [Video] {
        let video1 = Video(image: Images.one, title: "one")
        let video2 = Video(image: Images.two, title: "two")
        let video3 = Video(image: Images.three, title: "three")
        let video4 = Video(image: Images.four, title: "four")
        
        return [video1, video2, video3, video4]
    }
}

