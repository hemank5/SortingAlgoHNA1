//
//  ViewController.swift
//  SortingAlgoHNA1
//
//  Created by Hemank Narula on 4/23/17.
//  Copyright © 2017 Hemank_Narula. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    var arrSize: Int = 16;
    var sort1 = 0;
    var sort2 = 0
    
    @IBOutlet weak var sizeOfSortingArr: UISegmentedControl!
    
    @IBOutlet weak var topView: GraphView!
    
    @IBOutlet weak var bottomView: GraphView!
    
    @IBAction func getSortFunc1(_ sender: UISegmentedControl) {
        sort1 = sender.selectedSegmentIndex
    }
    
    @IBAction func getSortFunc2(_ sender: UISegmentedControl) {
       sort2 = sender.selectedSegmentIndex
        
    }
    
    @IBAction func getSizeOfSortingArr(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            arrSize = 16
            break;
        case 1:
            arrSize = 32
            break;
        case 2:
            arrSize = 48
            break;
        case 3:
            arrSize = 64
            break;
        default:
            arrSize = 16;
            break;
        }
        
    }
    
    
    @IBAction func compareSortAlg(_ sender: UIButton) {
        
        let sortFuntion1: (Int) -> [Int] = getSortFunction(index: sort1,inView: topView);
        let sortFuntion2: (Int) -> [Int] = getSortFunction(index: sort2,inView: bottomView);
        let queue = DispatchQueue.global(qos: .background)
        
        queue.async {
            let _ = sortFuntion1(self.arrSize);
        }
        
        queue.async {
            let _ = sortFuntion2(self.arrSize);
        }
        
        
    }
    
    
    
    func getSortFunction(index: Int,inView view:GraphView) -> (Int) -> [Int]{
        var sortFuntion: (Int) -> [Int] = view.selectionSort;
        switch index {
        case 0:
            sortFuntion = view.selectionSort;
            break;
        case 1:
            sortFuntion = view.insertionSort;
            break;
        case 2:
            sortFuntion = view.quickSort;
            break;
        case 3:
            sortFuntion = view.heapSort;
            break;
        default:
            sortFuntion = view.selectionSort;
            break;
        }
        return sortFuntion;
    }
    
        
}

