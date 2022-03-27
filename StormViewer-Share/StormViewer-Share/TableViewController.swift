//
//  TableViewController.swift
//  StormViewer
//
//  Created by Juan Diego Ocampo on 27/03/22.
//

import UIKit

final class TableViewController: UITableViewController {
    
    var pictures = [String]()
    var picturesCopy = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .secondarySystemBackground
        loadImagesFromBundle()
    }
    
    func loadImagesFromBundle() {
        let fileManager = FileManager.default
        guard let path = Bundle.main.resourcePath else { return }
        do {
            let items = try fileManager.contentsOfDirectory(atPath: path)
            for item in items {
                if item.hasPrefix("nssl") {
                    pictures.append(item)
                }
            }
            pictures = pictures.sorted()
            print(pictures)
        } catch let error {
            print(error.localizedDescription)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.currentPicture = indexPath.row + 1
            vc.totalPictures = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
