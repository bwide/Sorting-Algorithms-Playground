//: [Previous](@previous)

import UIKit
import PlaygroundSupport

let size = 200

let array = VisualSortableArray.init(arraySize: size)

func elementAt(index: Int) -> Int {
    return array.get(index: index)
}

func swap(i: Int, j: Int){
    return array.swap(i: i, j: j)
}

func select(i: Int, j: Int) -> Bool {
    return array.select(i: i, j: j)
}

PlaygroundPage.current.liveView = array.view

DispatchQueue.global(qos: .background).async {
    sleep(2)
    
    func quickSort(array: VisualSortableArray, fromLeftIndex leftIndex: Int, toRightIndex rightIndex: Int) {
        let index = partition(array: array, fromLeftIndex: leftIndex, toRightIndex: rightIndex)
        
        if leftIndex < index - 1 {
            quickSort(array: array, fromLeftIndex: leftIndex, toRightIndex: index - 1)
        }
        
        if index < rightIndex {
            quickSort(array: array, fromLeftIndex: index, toRightIndex: rightIndex)
        }
    }
    
    func partition(array: VisualSortableArray, fromLeftIndex leftIndex: Int, toRightIndex rightIndex: Int) -> Int {
        var localLeftIndex = leftIndex
        var localRightIndex = rightIndex
        
        let pivot = elementAt(index: (localLeftIndex + localRightIndex) / 2)
        
        while localLeftIndex <= localRightIndex {
            
            while elementAt(index: localLeftIndex) < pivot {
                localLeftIndex += 1
                select(i: localLeftIndex, j: localRightIndex)
            }
            
            while localRightIndex > 0 && elementAt(index: localRightIndex) > pivot {
                localRightIndex -= 1
                select(i: localLeftIndex, j: localRightIndex)
            }
            
            if localLeftIndex <= localRightIndex {
                if localLeftIndex != localRightIndex {
                    swap(i: localLeftIndex, j: localRightIndex)
                }
                
                localLeftIndex += 1
                
                if localRightIndex > 0 {
                    localRightIndex -= 1
                    select(i: localLeftIndex, j: localRightIndex)
                }
            }
        }
        return localLeftIndex
    }
    
    quickSort(array: array, fromLeftIndex: 0, toRightIndex: array.count - 1)
    
}


//: [Next](@next)
