contract array{


uint[] global_array;

event ev(uint  value, uint  value2);

function giv_array(uint[]  memory_array)
{
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
 //global_array[i]=given_array[i] // generates a invalid jump exception because the global_array has a size of 0  we need to have enough space to write your value.   we shhould use :
 global_array.push(given_array[i]);
//// or
global_array[global_array.length++]=given_array[i]; // It is true, you declared a variable size array but you still need to tell the VM to increase the array size before assign it.
  ev( memory_array[i],global_array[i]); // to compare the values
}
// use of assignation

}



// mapping is a solution to use to avoid this mess with the array size

}
