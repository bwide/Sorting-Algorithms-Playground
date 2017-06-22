//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let arraySize = 50

let array = VisualSortableArray.init(arraySize: arraySize)

func compare(i: Int, j: Int) -> Int{
    return array.compare(i: i, j: j)
}

func swap(i: Int, j: Int){
    array.swap(i: i, j: j)
}

func select(i: Int, j: Int) -> Bool {
    return array.select(i: i, j: j)
}

PlaygroundPage.current.liveView = array.view

DispatchQueue.global(qos: .background).async {
    sleep(2)

    while true {
        var swapped = false
        
        for i in 1..<array.count {
            
            select(i: i, j: i-1)
            
            if compare(i: i, j: i-1) < 0{
                swap(i: i, j: i-1)
                swapped = true
            }

        }
        
        if !swapped {
            break
        }
    }
 
}
