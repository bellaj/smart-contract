//External functions have member functions "gas" and "value" that allow to change the default amount of gas (all) and wei (0) sent to the called contract.


contract One {
    function one_function() returns (uint ret) { return 42; }
}


contract Two {
    One one_contra;
    function setOne(address addr) { one_contra = One(addr); // or one_contra= new one(addr) but you need to define the constructor one(address add);

// // Send ether along with the creation         D newD = (new D).value(amount)(arg); but it is not possible to limit the amount of gas
    }

    function callOne() {
      //how to call :
      // in general : contract.function.value(value of wei sent).gas(amount of gas)(parameters)
//way 1
      one_contra.one_function.value(10).gas(800)();//if the balance=0 = generates exception //Be careful about the fact that feed.info.value(10).gas(800) only (locally)
      //sets the value and amount of gas sent with the function call and only the parentheses at the end perform the actual call.
      // to call external functions without value or gas set we use : feed.info();
//way2
      one_contra.call.value(10).gas(800)("one_function()");// if the function is not set then callback fct is called
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!***
      //!!!!!!!!!!!! send the tx creation with some ethers otherwise you get an error exception when calling another contract
      //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     }
}
//p.recipient.call.value(p.amount)(p.data)
//f.gas(2).value(20)() calls the modified function f and thereby sending 20 Wei and
// limiting the gas to 2 (so this function call will most likely go out of gas and return your 20 Wei).
