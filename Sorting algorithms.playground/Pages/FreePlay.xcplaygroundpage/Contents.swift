//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let arraySize = 200 //choose the size of yout array here

let array = VisualSortableArray.init(arraySize: arraySize)

//this are the functions you can use
func compare(i: Int, j: Int) -> Int{
    return array.compare(i: i, j: j)
}

func swap(i: Int, j: Int) {
    return array.swap(i: i, j: j)
}

func select(i: Int, j: Int) -> Bool {
    return array.select(i: i, j: j)
}

PlaygroundPage.current.liveView = array.view

DispatchQueue.global().async {
    sleep(2)
    
    //your sorting algorithm here
    
    func quickSort(array: VisualSortableArray, leftIndex: Int, rightIndex: Int){
        if leftIndex >= rightIndex { return }
        var i = leftIndex
        var j = rightIndex
        select(i: i, j: j)
        
        let pivot = array.get(index: i+1)
        
        while i <= j {
            if array.get(index: i) < pivot {
                i += 1
                continue
            }
            if array.get(index: j) > pivot {
                j -= 1
                continue
            }
            
            swap(i: i, j: j)
            i += 1
            j -= 1
        }
        
        quickSort(array: array,
                  leftIndex: i,
                  rightIndex: rightIndex)
        
        quickSort(array: array,
                  leftIndex: leftIndex,
                  rightIndex: j)
    }
    
    quickSort(array: array, leftIndex: 0, rightIndex: array.count-1)
}

