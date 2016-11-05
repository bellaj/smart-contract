pragma solidity ^0.4.0;

//the purpose of these two contract is to demonstrate the difference between using
//constant function or non-constant function. the computational limitation is the same even
//if with constant function we don't need to pay any gas fees while it is localy runned.
contract test_compexity_without_constant{

    uint256 j=0;
 function f(uint256 n)  returns (uint256)  {
     while(j<n){
         j=j+1;
     }

 return j;
 }
}

contract test_compexity_with_constant{ //

    uint256 j=0;
 function f(uint256 n) constant returns (uint256)  {
     while(j<n){
         j=j+1;
     }

 return j;
 }
}
