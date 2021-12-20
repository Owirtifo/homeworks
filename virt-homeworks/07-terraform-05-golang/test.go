package math
import "testing"
func testMain(t *testing.T) {
    var v int
    v = Min([]int{1,2,3,4})
    if v != 1 {
        t.Error("Expected 1, got ", v)
    }
}
