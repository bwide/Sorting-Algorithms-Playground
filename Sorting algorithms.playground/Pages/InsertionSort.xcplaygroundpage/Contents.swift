//: [Previous](@previous)

import UIKit
import PlaygroundSupport

//: here you can change the size of you array
let arraySize = 100 // <-

let array = VisualSortableArray.init(arraySize: arraySize)

func compareAndSwap(i: Int, j: Int) -> Bool{
    return array.compareAndSwap(i: i, j: j)
}

PlaygroundPage.current.liveView = array.view

DispatchQueue.global(qos: .background).async {
    sleep(2)

    /*:
     
     Hey! this is your first sorting algorithm!
     
     it's called Bubble Sort.
     
     here's what it does:
     * Iterate through the array, comparing the current element with the one before it.
     * if those two aren't ordered, swap them.
     * when reached the end of the array, check if it swapped any elements.
     * if no element was swapped, the array is ordered
     */

    for i in 1..<array.count {
        for j in (1...i).reversed() {//this will go from i to 1
            compareAndSwap(i: j-1, j: j)
        }
    }

    
 
    
    
    
    
    
}
//: [Next](@next)
