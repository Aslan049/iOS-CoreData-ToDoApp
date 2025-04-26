//
//  ViewController.swift
//  iOSCoreData
//
//  Created by Aslan Korkmaz on 26.04.2025.
//


import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let tableView = UITableView()
    var items = [Customer]()
    var details = [Customer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        title = "To-Do List"
        view.addSubview(tableView)
        setTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        
        fetchData()
    }
    
    @objc func didTapAdd() {
        let alert = UIAlertController(title: "New To-Do", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "To-Do Title"
        }
        alert.addTextField { textField in
            textField.placeholder = "Detail"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let text = alert.textFields?.first?.text, !text.isEmpty else { return }
            guard let detail = alert.textFields?[1].text, !detail.isEmpty else { return }
            //guard let time = alert.textFields?.last?.text else { return }
            
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let newToDo = Customer(context: context)
            newToDo.title = text
            newToDo.detail = detail
            
            do {
                try context.save()
                self?.fetchData()
            } catch {
                print("could not save \(error.localizedDescription)")
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    
    private func fetchData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Customer> = Customer.fetchRequest()
        
        do {
            items = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch {
            print("could not fetch data \(error.localizedDescription)")
        }
    }
    
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableViewConstraints()
    }
    
    func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].title
        cell.detailTextLabel?.text = items[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailVC = DetailViewController()
        detailVC.titleText = items[indexPath.row].title
        detailVC.detailText = "Detail: \(items[indexPath.row].detail ?? "No Detail")"
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let entityToDelete = items[indexPath.row]
            
            context.delete(entityToDelete)
            
            do {
                try context.save() // save data
                fetchData()
            } catch {
                print("Could not delete \(error.localizedDescription)")
                
            }
        }
        
    }
}

