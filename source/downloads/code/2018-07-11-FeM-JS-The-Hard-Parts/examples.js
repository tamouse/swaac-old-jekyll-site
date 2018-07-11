// warm ups
function addTwo(n) {
  return n + 2
}
function addS(s) {
  return s + "s"
}

// map: return a new array, where each item is the result of running the callback on each element of the orginal array
function map(arr, cb) {
  // Declare and initialize the return array. We need some place to put our work
  let mapped = []

  // Using a standard for loop to process each element of the array
  for (let i = 0; i < arr.length; i++) {
    let item = arr[i] // this is not strictly necesary but it illustrates what will happen in the mapWith function below a little better.

    // The current item of the original array gets passed to the callback function, and the result is added to the end of the new array
    mapped.push(cb(item))
  }

  // The result of the map is the new array with the processed elements
  return mapped
}

// Let's check it: pass in an array of integers, and a function to add 2 to each element
console.log("map: ", map([1, 2, 3, 4], addTwo))
// => [ 3, 4, 5, 6 ]

// forEach: turn the cannonical for loop into a function
function forEach(arr, cb) {
  // the forEach function is an *impure* function,
  // returning nothing and only performing side-effects
  // for each element of the array.
  for (let i = 0; i < arr.length; i++) {
    let item = arr[i] // to hold the current item

    cb(item) // act on the current item
  }
}
// Check the forEach
forEach([1, 2, 3, 4], console.log) // we can pass in functions!
// =>
// 1
// 2
// 3
// 4

function mapWith(arr, cb) {
  // reimplemnt `map` from above with are new `forEach` function
  let mapped = []
  forEach(arr, item => {
    // the function body is identical to the interior of the original map
    // function, *after* the initial item declaration and assignment,
    mapped.push(cb(item))
  })
  return mapped
}
console.log("mapWith: ", mapWith([1, 2, 3, 4], addTwo))
