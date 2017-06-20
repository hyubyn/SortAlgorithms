//
//  MergeSort.swift
//  SortAlgorithms
//
//  Created by Hyubyn on 6/16/17.
//  Copyright © 2017 Hyubyn. All rights reserved.
//


enum SortType {
    case merge
    case quick
    case selection
    case insertion
    case bubble
    case heap
    
    func localizedString() -> String {
        switch self {
        case .merge:
            return "Merge Sort"
        case .quick:
            return "Quick Sort"
        case .selection:
            return "Selection Sort"
        case .insertion:
            return "Insertion Sort"
        case .bubble:
            return "Bubble Sort"
        default:
            return "Heap Sort"
        }
    }
}

class Sort {
    
    func sortWithParameters(input array: inout [Int], andSortType type:SortType) -> [Int] {
        switch type {
        case .merge:
            return mergeSort(input: &array)
        case .quick:
            return quickSort(input: &array)
        case .selection:
            return selectionSort(input: &array)
        case .insertion:
            return insertionSort(input: &array)
        case .bubble:
            return bubbleSort(input: &array)
        case .heap:
            return heapSort(input: &array)
        }
    }
    
    private func swap( first: inout Int, second: inout Int) {
        first = first + second
        second = first - second
        first = first - second
    }
    
    private func getMinFromArray(array: inout [Int]) -> Int {
        var min = array[0]
        var minIndex = 0
        for index in 0..<array.count {
            if array[index] < min {
                min = array[index]
                minIndex = index
            }
        }
        array.remove(at: minIndex)
        return min
    }
    
    private func mergeArray(array: [Int], with secondArray: [Int]) -> [Int] {
        var resultArray = [Int]()
        var tempArray = array + secondArray
        for _ in 0..<tempArray.count {
            resultArray.append(getMinFromArray(array: &tempArray))
        }
        return resultArray
    }
    
    private func mergeSort(input array: inout [Int]) -> [Int] {
        if array.count == 1 {
            return array
        }
        
        let mid = array.count / 2
        
        var leftArray =  [Int]()
        leftArray.append(contentsOf: array[0..<mid])
        
        var rightArray = [Int]()
        rightArray.append(contentsOf: array[mid...array.count - 1])

        _ = mergeSort(input: &leftArray)
        _ = mergeSort(input: &rightArray)
        
        
        return mergeArray(array: leftArray, with: rightArray)
    }
    
    private func quickSortImplement(leftIndex: Int, rightIndex: Int, array: inout [Int]) {
        if leftIndex == rightIndex{
            return
        }
        if leftIndex == rightIndex - 1 {
            if array[leftIndex] > array[rightIndex] {
                swap(first: &array[leftIndex], second: &array[rightIndex])
            }
            return
        }
        var midIndex = (leftIndex + rightIndex) / 2
        let midValue = array[midIndex]
        // process left array
        var currentIndex = leftIndex
        while currentIndex < midIndex {
            if array[currentIndex] >= midValue {
                array.insert(array.remove(at: currentIndex), at: rightIndex)
                currentIndex -= 1
                midIndex -= 1
            }
            currentIndex += 1
        }
//        print("\nOutput by left processing")
//        for index in 0..<array.count {
//            print("\(array[index])", terminator: ",")
//        }
        //process right array
        currentIndex = midIndex + 1
        while currentIndex <= rightIndex {
            if array[currentIndex] <= midValue {
                array.insert(array.remove(at: currentIndex), at: leftIndex)
                midIndex += 1
            }
            currentIndex += 1
        }
//        print("\nOutput by right processing")
//        for index in 0..<array.count {
//            print("\(array[index])", terminator: ",")
//        }
        if midIndex == leftIndex {
            midIndex += 1
        }
        if midIndex == rightIndex {
            midIndex -= 1
        }
        quickSortImplement(leftIndex: leftIndex, rightIndex: midIndex, array: &array)
        quickSortImplement(leftIndex: midIndex, rightIndex: rightIndex, array: &array)
    }
    
    private func quickSort(input array: inout [Int]) -> [Int] {
        quickSortImplement(leftIndex: 0, rightIndex: array.count - 1, array: &array)
        return array
    }

    private func selectionSort(input array: inout [Int]) -> [Int] {
        var markIndex = 0;
        while markIndex < array.count - 1 {
            var min = array[markIndex]
            var currentMinimumIndex = markIndex
            for index in markIndex ..< array.count {
                if array[index] < min {
                    min = array[index]
                    currentMinimumIndex = index
                }
            }
            
            if currentMinimumIndex != markIndex {
                swap(first: &array[markIndex],second: &array[currentMinimumIndex])
            }
            
            markIndex +=  1
        }
        return array
    }
    
    private func insert(number: Int, toArray array: inout [Int]) {
        for index in 0 ..< array.count {
            if array[index] > number {
                array.insert(number, at: index)
                return
            }
        }
        array.append(number)
    }
    
    private func insertionSort(input array: inout [Int]) -> [Int] {
        if array.count < 2 {
            return array
        } else if array.count == 2 {
            if array[0] > array[1] {
                swap(first: &array[0], second: &array[1])
            }
            return array
        }
        var resultArray = [array[0], array[1]]
        for index in 2 ..< array.count  {
            insert(number: array[index], toArray: &resultArray)
        }
        
        return resultArray
    }
    
    private func bubbleSort(input array: inout [Int]) -> [Int] {
        var markIndex = array.count - 1
        while markIndex > 1 {
            for firstIndex in 0 ..< markIndex {
                if array[firstIndex] > array[firstIndex + 1] {
                    swap(first: &array[firstIndex], second: &array[firstIndex + 1])
                }
            }
            markIndex -= 1
        }
        return array
    }
    
    private func heapify(input array: [Int]) {
        
    }
    
    private func heapSort(input array: inout [Int]) -> [Int] {
        return array
    }
}
