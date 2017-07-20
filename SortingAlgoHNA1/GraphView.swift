//
//  GraphView.swift
//  SortingAlgoHNA1
//
//  Created by Hemank Narula on 4/23/17.
//  Copyright © 2017 Hemank_Narula. All rights reserved.
//

import UIKit
class GraphView: UIView {
    
    
    var arr:[Int] = Array(repeating: 0, count: 1)
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        UIColor.white.set()
        UIRectFill(bounds);
        
        let length = self.bounds.size.height;
        let width = Int (self.bounds.size.width);
        
        let barWidth = Int(width / arr.count);
        
        for i in 0 ... arr.count - 1{
            let rect = CGRect(x: barWidth * i, y: Int(length), width: barWidth, height: -arr[i])
            UIColor.green.set()
            UIRectFill(rect);
            
            UIColor.black.set()
            UIRectFrame(rect)
            
        }
    }
    
    func generateRandomArray(sizeOfArr count: Int) -> [Int]{
        
        var arr = [Int](repeating: 0, count: count)
        
        for i in 0...count-1{
            arr[i] = Int(arc4random_uniform(100) + 1)
        }
        
        return arr;
    }
    
    //All the sort funcitons should have the signature
    
    func selectionSort(SizeOfArray arrSize:Int) -> [Int]
    {
        //   To generate data for the function
        arr = generateRandomArray(sizeOfArr: arrSize)
        
        var minIndex = 0
        
        for i in 0..<arr.count {
            minIndex = i
            
            for j in (i + 1)..<arr.count {
                if arr[j] < arr[minIndex] {
                    minIndex = j
                }
            }
            
            if (minIndex != i) {
                swap(&arr[i], &arr[minIndex])
            }
            
            DispatchQueue.main.async {
                self.setNeedsDisplay()
            }
            usleep(100_000)
        }
       
        return arr;
    }
    
    func insertionSort(SizeOfArray arrSize:Int) -> [Int]
    {
        arr = generateRandomArray(sizeOfArr: arrSize)
        for i in 1..<arr.count
        {
            var j = i
            let target = arr[i]
            
            while j > 0 && target < arr[j - 1]
            {
                swap(&arr[j], &arr[j - 1])
                j -= 1
            }
            arr[j] = target
            
            DispatchQueue.main.async
            {
            self.setNeedsDisplay()
            }
            usleep(100_000)
        }
    
    return arr;

    }

    func quickSort(SizeOfArray arrSize:Int) -> [Int]
    {
        arr = generateRandomArray(sizeOfArr: arrSize)
        quickSort(&arr, left: 0, right: arr.count - 1)
        
        
       
        return arr;
    }
    
    func quickSort(_ arr: inout [Int], left: Int, right: Int)
    {
        let index = partition(&arr, left: left, right: right)
        
        if left < index - 1 {
            quickSort(&arr, left: left, right: index - 1)
        }
        
        if index < right {
            quickSort(&arr, left: index, right: right)
        }
        DispatchQueue.main.async
            {
                self.setNeedsDisplay()
        }
        usleep(100_000)

    }
    
    func partition(_ arr: inout [Int], left: Int, right: Int) -> Int
    {
        var i = left
        var j = right
        let pivot = arr[(left + right) / 2]
        
        while i <= j {
            while arr[i] < pivot {
                i += 1
            }
            
            while j > 0 && arr[j] > pivot {
                j -= 1
            }
            
            if i <= j {
                if i != j {
                    swap(&arr[i], &arr[j])
                }
                i += 1
                
                if j > 0 {
                    j -= 1
                }
            }
        }
        return i
    }
    
    func heapSort(SizeOfArray arrSize:Int) -> [Int]
    {
        arr = generateRandomArray(sizeOfArr: arrSize)
        heapify(&arr, count: arr.count)
        
        var end = arr.count - 1
        
        while end > 0 {
            swap(&arr[end], &arr[0])
            siftDown(&arr, start: 0, end: end - 1)
            end -= 1
                    }
        
        
    
    return arr;
    }

    func heapify(_ arr: inout [Int], count: Int)
    {
        var start = (count - 2) / 2
        
        while start >= 0 {
            siftDown(&arr, start: start, end: count - 1)
            start -= 1
        }
        
            }
    
    func siftDown(_ arr: inout [Int], start: Int, end: Int)
    {
        var root = start
        
        while root * 2 + 1 <= end {
            var child = root * 2 + 1
            
            if child + 1 <= end && arr[child] < arr[child + 1] {
                child += 1
            }
            
            if arr[root] < arr[child] {
                swap(&arr[root], &arr[child])
                root = child
            }
            else {
                return
            }
        }
        
        DispatchQueue.main.async
            {
                self.setNeedsDisplay()
        }
        usleep(100_000)
        

    }


}
