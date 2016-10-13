//
//  TableViewController.swift
//  HelloTableView
//
//  Created by Vasilii on 12.10.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //1)
    // создаем пустой массив строк
    var items: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //вызываем метод setupData()
        setupData()
        // 2) станим у tableView его делегатом и датасорсом
        tableView.delegate = self
        tableView.dataSource = self
    }
    //настроим данные
    func setupData() {
        //семействa шрифтов в виде массива строк с их названиеями
        let familyNames = UIFont.familyNames()
        
        // для названия каждого семейства шрифтов
        for aFamilyName in familyNames {
            
            //найдем все шрифты этого семейства
            let allFontsOfThisFamily:[String] = UIFont.fontNamesForFamilyName(aFamilyName)
            // все строки из allFontsOfThisFamily буду перемещены в items
            items += allFontsOfThisFamily
        }
    }
    
}
//Подддерживает протокол UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    
}

extension TableViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //убедимся что у нас есть какие-то элементы для отображения

        return items.count
    }


    //indexPath - адрес ячейки в таблице
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //запросить прототип ячейски у TableView
        let cell = tableView.dequeueReusableCellWithIdentifier("JustACellID", forIndexPath: indexPath)
        //Зная, что по indexPath.row у нас лежит конкретный текст для конкретной ячейки вставим его туда
        cell.textLabel?.text = items[indexPath.row]
        //вернем ячейку
        return cell
    }
}
