//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code

let size = /*#-editable-code size of the array*/200/*#-end-editable-code*/

/*:
 quickSort! this one is a bit more complicated, but really fun to watch.
 
 And it works, well... quickly. Basically what it does is:
 
 * pick an element from the array (pivot)
 * reorder the array so that elements smaller than the pivot come before it, and elements
 bigger than the pivot come after it (this is done by the partition function)
 * [Recursively](glossary://recursive) apply those two steps for the partitioned arrays
 */

//#-hidden-code
let array = VisualSortableArray.init(arraySize: size)

func elementAt(index: Int) -> Int {
    return array.get(index: index)
}

func swap(i: Int, j: Int) -> Bool {
    return array.swap(i: i, j: j)
}

func select(i: Int, j: Int) -> Bool {
    return array.select(i: i, j: j)
}

PlaygroundPage.current.liveView = array.view

DispatchQueue.global(qos: .background).async {
    sleep(2)
//#-end-hidden-code
    
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

    
//#-hidden-code
}
//#-end-hidden-code
