//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let arraySize = 50 //choose the size of yout array here

let array = VisualSortableArray.init(arraySize: arraySize)

//this are the functions you can use
func compare(i: Int, j: Int) -> Int{
    return array.compare(i: i, j: j)
}

func swap(i: Int, j: Int) -> Bool{
    return array.swap(i: i, j: j)
}

func select(i: Int, j: Int) -> Bool {
    return array.select(i: i, j: j)
}

PlaygroundPage.current.liveView = array.view

DispatchQueue.global(qos: .background).async {
    sleep(2)
    
    //your sorting algorithm here
    
}
