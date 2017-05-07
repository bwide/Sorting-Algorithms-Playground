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
    
    func quickSort(array: VisualSortableArray, left: Int, right: Int)
    {
        let index = partition(arr: array, left: left, right: right)
        
        if left < index - 1 {
            quickSort(array: array, left: left, right: index - 1)
        }
        
        if index < right {
            quickSort(array: array, left: index, right: right)
        }
    }
    
    func partition(arr: VisualSortableArray, left: Int, right: Int) -> Int
    {
        var i = left
        var j = right
        let pivot = elementAt(index: (left + right) / 2)
        
        while i <= j {
            while elementAt(index: i) < pivot {
                i += 1
                select(i: i, j: j)
            }
            
            while j > 0 && arr.get(index:j) > pivot {
                j -= 1
                select(i: i, j: j)
            }
            
            if i <= j {
                if i != j {
                    swap(i: i, j: j)
                }
                i += 1
                if j > 0 {
                    j -= 1
                    select(i: i, j: j)
                }
            }
        }
        return i
    }
    
    quickSort(array: array, left: 0, right: array.count - 1)

    
//#-hidden-code
}
//#-end-hidden-code
