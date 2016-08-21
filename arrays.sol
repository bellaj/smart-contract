contract array{


uint[] global_array;

event ev(uint  value, uint  value2);

function giv_array(uint[]  memory_array)
{
  //var v = memory_array works
   // global_array= memory_array; works => copies the whole array from memory to storage
   // var g=global_array; then g =memory_array; => won't work generate memory is not implicitly convertible to expected type.Even if g is declared as the same type as memory_array
var v=global_array;// v is a pointer to global array (data is located in storage not memory)
// the changes occure in v happend also in global_array
// now V=[i] value is stored in global_array=[i] (like special links)
////////////////////////////////////////
////table initialization
/////////////////////////
//1- use of loop
for (var i=0; i< memory_array.length ; i++){
 //global_array[i]=memory_array[i] // generates a invalid jump exception because the global_array has a size of 0  we need to have enough space to write your value.   we shhould use :
 v.push(memory_array[i]);
//// or
v[v.length++]=memory_array[i]; // It is true, you declared a variable size array but you still need to tell the VM to increase the array size before assign it.
  ev( memory_array[i],v[i]); // to compare the values
}
// use of assignation

//////////////////
// Clear data
///////
delete v; // clears the array, also modifies y

}

function g(uint[] storage storageArray) internal {} // when called g(global_array) handing over a reference to global_array=> we could use var V=globalarray then assing V=storageArray
function h(uint[] memoryArray) {} // when called h(global_array) it creates an independent, temporary copy in memory => could not assing memory var to stored var;

// mapping is a solution to use to avoid this mess with the array size

}

contract C {
  ////Creating arrays with variable length in memory can be done
  // using the new keyword. As opposed to storage arrays, it is not possible to resize memory arrays by assigning to the .length member.
    function f(uint len) {
        uint[] memory a = new uint[](7);
        bytes memory b = new bytes(len);
        // Here we have a.length == 7 and b.length == len
        a[6] = 8;
    }
}
