//
//  ViewController.swift
//  SortAlgorithms
//
//  Created by Hyubyn on 6/16/17.
//  Copyright © 2017 Hyubyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var arrayInput = [Int]()
//        print("Input:")
//        for _ in 0...100 {
//            let random = Int(arc4random_uniform(50))
//            arrayInput.append(random)
//            print(random, terminator: ",")
//        }
//        
//        
//        
//        let sort = Sort()
//        var resultArray1 = arrayInput
//        
//        printResult(array: sort.sortWithParameters(input: &resultArray1, andSortType: .selection), fromSortType: .selection)
//        
//        var resultArray2 = arrayInput
//        
//        printResult(array: sort.sortWithParameters(input: &resultArray2, andSortType: .bubble), fromSortType: .bubble)
//        
//        
//        var resultArray3 = arrayInput
//        resultArray3 = sort.sortWithParameters(input: &resultArray1, andSortType: .insertion)
//        printResult(array: resultArray3, fromSortType: .insertion)
//        
//        var resultArray4 = arrayInput
//        resultArray4 = sort.sortWithParameters(input: &resultArray4, andSortType: .merge)
//        printResult(array: resultArray4, fromSortType: .merge)
//        
//        var resultArray5 = arrayInput
//        resultArray5 = sort.sortWithParameters(input: &resultArray5, andSortType: .quick)
//        printResult(array: resultArray5, fromSortType: .quick)
        
//        var resultArray1 = arrayInput
//        resultArray1 = sort.sortWithParameters(input: &resultArray1, andSortType: .selection)
//        printResult(array: resultArray1, fromSortType: .selection)
        
//        let input1 = "ashsdnfsfbjsabfsajsfdfb"
//        let input2 = "qwertyuioplkjhgfdsazxcvbnajsbdflabsdfcbm"
//        let input3 = "mnbvcxzlkjhgfdsapoiuytrewq"
//        let input4 = "msidhfvnnbvcxzlkjhgfdsapoiuytrewq"
//        let _ = check(input: input1)
//        let _ = check(input: input2)
//        let _ = check(input: input3)
//        let _ = check(input: input4)
//        
//        
        let lenght = 10
        var result = 0
        var allRows = [[Int]]()
        let array1 = [1,1,1,1,0,1,1,0,0,1]
        allRows.append(array1)
        let array2 = [0,0,1,0,1,0,0,0,0,0]
        allRows.append(array2)
        let array3 = [0,0,0,0,0,0,1,1,0,0]
        allRows.append(array3)
        let array4 = [1,1,0,0,0,0,0,0,0,0]
        allRows.append(array4)
        let array5 = [1,1,1,0,0,0,1,0,1,0]
        allRows.append(array5)
        let array6 = [0,1,0,1,0,0,1,1,1,1]
        allRows.append(array6)
        let array7 = [0,0,0,0,0,0,1,1,0,0]
        allRows.append(array7)
        let array8 = [1,1,0,0,0,0,0,0,0,0]
        allRows.append(array8)
        let array9 = [1,1,1,0,0,0,1,0,1,0]
        allRows.append(array9)
        let array10 = [0,1,0,1,0,0,1,1,1,0]
        allRows.append(array10)
        print("Input: \(result)")
        for index in 0..<allRows.count {
            for arrayIndex in 0..<allRows[index].count {
                print("\(allRows[index][arrayIndex])", terminator: ",")
            }
            print("")
        }
        var currentRow = 0
        var checkForNextTurn = [[Int]]()
        while currentRow < lenght {
            
            
            var array = allRows[currentRow]
            
            // clear for last row first
            if currentRow - 1 > -1 {
                let lastRow = allRows[currentRow - 1]
                for index in 0..<array.count {
                    let leftIndex = index - 1
                    if leftIndex > 0 {
                        if lastRow[leftIndex] == 1 {
                            array[index] = 0
                        }
                    }
                    let rightIndex = index + 1
                    if rightIndex < lenght {
                        if lastRow[rightIndex] == 1 {
                            array[index] = 0
                        }
                    }
                    if lastRow[index] == 1 {
                        array[index] = 0
                    }
                }
            }
            
            
            print("\nArray\(currentRow) before check")
            for index in 0..<array.count {
                print("\(array[index])", terminator: ",")
            }
            // check in row first
            var checkingCollumn = 0
            while checkingCollumn < array.count - 1 {
                if array[checkingCollumn] == 1 {
                    array[checkingCollumn] = 0
                    result += 1
                    //clear row
                    for primaryIndex in checkingCollumn + 2..<array.count {
                        if array[primaryIndex] == 1 {
                            array[primaryIndex] = 0
                        } else {
                            checkingCollumn = primaryIndex
                            break
                        }
                    }
                } else {
                    checkingCollumn += 1
                }

            }
//            //check with last row
//            let lastRowIndex = currentRow - 1
//            if lastRowIndex > -1 {
//                var lastRow = allRows[lastRowIndex]
//                for index in 0..<array.count {
//                    if array[index] == 1 {
//                        let leftCheck = index - 1
//                        if leftCheck > 0 {
//                            if lastRow[leftCheck] == 1 {
//                                result += 1
//                                lastRow[leftCheck] = 0
//                                array[index] = 0
//                                continue
//                            }
//                        }
//                        let rightCheck = index + 1
//                        if rightCheck < lenght {
//                            if lastRow[rightCheck] == 1 {
//                                result += 1
//                                lastRow[rightCheck] = 0
//                                array[index] = 0
//                                continue
//                            }
//                        }
//                    }
//                }
//                allRows[lastRowIndex] = lastRow
/*1,0,0,0,0,0,
 0,0,0,0,0,0,
 0,0,0,1,0,0,
 0,0,0,0,0,0,
 0,0,0,0,0,0,
 0,1,0,0,0,0,*/
//            }
            checkForNextTurn.append(array)
            print("\nArray\(currentRow) after check")
            for index in 0..<allRows[currentRow].count {
                print("\(allRows[currentRow][index])", terminator: ",")
            }
            currentRow += 1
            
        }
       
        print("\nFinal result: \(result)")
        for index in 0..<allRows.count {
            for arrayIndex in 0..<allRows[index].count {
                print("\(allRows[index][arrayIndex])", terminator: ",")
            }
            print("")
        }

    }
    
    func check(input: String) -> Bool {
        var set = Set<Character>()
        let characters = input.characters
        for character in characters {
            set.insert(character)
        }
        print(set.count)
        if set.count == 26 {
            print("YES")
            return true
        } else {
            print("NO")
            return false
        }
    }

    func printResult(array: [Int], fromSortType: SortType) {
        print("\nOutput by \(fromSortType.localizedString())")
        for index in 0..<array.count {
            print("\(array[index])", terminator: ",")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

