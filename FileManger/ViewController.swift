//
//  ViewController.swift
//  FileManger
//
//  Created by Alexey Manankov on 26.09.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = FileManager.default
        
        guard let url = manager.urls(
            for: .documentDirectory,
            in: .userDomainMask).first 
        else {
            return
        }
        //MARK: Append Folder
        let newFolderUrl = url.appendingPathComponent("SpiderFolder")
        
        //MARK: Append File
        let filePath = newFolderUrl.appendingPathComponent("logs.txt")
        //MARK: Add file with data
        let  textString = "Writing text to a text file! Woooo".data(using: .utf8)
        manager.createFile(
            atPath: filePath.path,
            contents: textString
            )
            
        //MARK: Delete file or folder
//        if manager.fileExists(atPath: filePath.path) {
//            do {
//                try manager.removeItem(atPath: filePath.path)
//            } catch {
//                print(error)
//            }
//        }
        
        let data = manager.contents(atPath: filePath.path)
        print(String(decoding: data ?? Data(), as: UTF8.self))
    }


}

