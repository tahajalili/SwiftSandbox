//
//  ViewController.swift
//  Tasks!
//
//  Created by Taha Jalili on 9/24/20.
//  Copyright © 2020 Taha Jalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	var counter = 0
	@IBAction func AddItem(_ sender: UIButton) {
		myArr.append("Data \(counter)")
		TaskTableView.reloadData()
		counter += 1
	}
	//vars
	@IBOutlet weak var TaskTableView: UITableView!
	var myArr = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		TaskTableView.dataSource = self
		TaskTableView.delegate = self
	}
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return myArr.count        //no. of rows in the section

	}

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {

		let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
		
		if self.myArr.count > 0{
			cell?.textLabel?.text = self.myArr[indexPath.row]
		}
		cell?.textLabel?.numberOfLines = 0
		
	

		return cell!
	}

	
	
	
	
	
	
}

