//
//  TableViewController.swift
//  TableView_Exercise
//
//  Created by Himalaya Rajput on 03/03/20.
//  Copyright © 2020 Himalaya Rajput. All rights reserved.

import UIKit
class TableViewController: UIViewController {
    private var quotesArray = [
        "Change will not come if we wait for some other person or some other time. We are the ones we've been waiting for. We are the change that we seek.",
        "I'm here. I'm not going anywhere. No matter what the injury - unless it's completely debilitating - I'm going to be the same player I've always been. I'll figure it out. I'll make some tweaks, some changes, but I'm still coming.",
        "My mission in life is not merely to survive, but to thrive; and to do so with some passion, some compassion, some humor, and some style.",
        "Some people want it to happen, some wish it would happen, others make it happen.",
        "Nobody ever defended anything successfully, there is only attack and attack and attack some more.",
        "People commonly educate their children as they build their houses, according to some plan they think beautiful, without considering whether it is suited to the purposes for which they are designed.",
        "My mother said I must always be intolerant of ignorance but understanding of illiteracy. That some people, unable to go to school, were more educated and more intelligent than college professors.",
        "To run away from trouble is a form of cowardice and, while it is true that the suicide braves death, he does it not for some noble object but to escape some ill.",
        "no quote"
    ]
    @IBOutlet private weak var deleteButton: UIBarButtonItem!
    @IBOutlet private weak var editButton: UIBarButtonItem!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
        }
    }
    private var isdeleteButtonEnabled = false {
        didSet {
            deleteButton.isEnabled = isdeleteButtonEnabled
        }
    }
    private var cellSelectionCount = 0 {
        didSet {
            if cellSelectionCount == 1 {
                isdeleteButtonEnabled = true
            }
            if cellSelectionCount == 0 {
                isdeleteButtonEnabled = false
            }
        }
    }
    private var rightBarButton: RightBarButton = .Edit
    
    @IBAction private func edit(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
        sender.title = rightBarButton.title()
        if rightBarButton == .Edit {
            cellSelectionCount = 0
        }
        reloadVisibleCells()
    }
    
    //MARK: Delete Rows
    @IBAction private func performDelete(_ sender: UIBarButtonItem) {
        if let selectedRows = tableView.indexPathsForSelectedRows {
            for indexPath in selectedRows.sorted(by: { $0.row > $1.row}) {
                quotesArray.remove(at: indexPath.row)
            }
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .right)
            tableView.endUpdates()
        }
        reloadVisibleCells()
        guard !quotesArray.isEmpty else {
            deleteButton.isEnabled = false
            editButton.isEnabled = false
            editButton.title = rightBarButton.title()
            return
        }
    }
    
    private func reloadVisibleCells() {
        if let visibleRows = tableView.indexPathsForVisibleRows {
            tableView.reloadRows(at: visibleRows, with: .none)
        }
    }
}

extension TableViewController:  UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quotesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath)
         if let cell = cell as? CustomTableViewCell {
            cell.configureCell(atIndex: indexPath, for: quotesArray[indexPath.row])
            return cell
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellSelectionCount += 1
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        cellSelectionCount -= 1
    }
    
    // MARK: Move Rows
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = quotesArray.remove(at: sourceIndexPath.row)
        quotesArray.insert(movedObject, at: destinationIndexPath.row)
        tableView.reloadData()
    }
}

extension TableViewController {
   private enum RightBarButton: String {
        case Edit
        case Done
        mutating func title() -> String {
            switch self {
            case .Edit: self = .Done ; return self.rawValue
            case .Done: self = .Edit ; return self.rawValue
            }
        }
    }
}

