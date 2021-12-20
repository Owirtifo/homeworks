package main

import "fmt"

func Min(arr []int) int {
    var min int = arr[0]
    for _, val := range arr {
        if min > val {
            min = val
        }
    }
    return min
}

func main() {
    x := []int{48,96,86,68,57,82,63,70,37,34,83,27,19,97,9,17,}
    fmt.Println(Min(x))
}