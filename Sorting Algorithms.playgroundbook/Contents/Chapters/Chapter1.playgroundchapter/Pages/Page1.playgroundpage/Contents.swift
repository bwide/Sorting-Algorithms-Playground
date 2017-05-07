//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code

/*:
 hey! this is your first sorting algorithm!
     
 it's called Bubble Sort.
     
 here's what it does:
 * [Iterate](glossary://iterate) through the array, comparing the current element with the one before it.
 * if those two aren't ordered, swap them.
 * when reached the end of the array, check if it swapped any elements.
 * if no element was swapped, the array is ordered
*/

let arraySize = /*#-editable-code*/50/*#-end-editable-code*/

//#-hidden-code
let array = VisualSortableArray.init(arraySize: arraySize)

func compare(i: Int, j: Int) -> Int{
    return array.compare(i: i, j: j)
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
//#-hidden-code
}
//#-end-hidden-code
