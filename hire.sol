 
pragma solidity ^0.4.13;

/* this is not an ERC20 contract*/
contract SafeMath {
  //internals

  function safeMul(uint a, uint b) internal returns (uint) {
    uint c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function safeSub(uint a, uint b) internal returns (uint) {
    assert(b <= a);
    return a - b;
  }

  function safeAdd(uint a, uint b) internal returns (uint) {
    uint c = a + b;
    assert(c>=a && c>=b);
    return c;
  }

  function assert(bool assertion) internal {
    if (!assertion) revert();
  }
  
    function div(uint256 a, uint256 b) internal constant returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }
}

/*


a. Company Account - 25%
b. Interview Account – 25%
c. Placed Applicant Account – 35%
d. Recommended Account – 15%

*/
contract hire is SafeMath{

 
address admin_address;

  function balanceOf(address user) constant returns (uint256 balance) {
          return balances[user];
    }

mapping(address =>uint256 ) balances; 
address[] payroll;

function deposit(uint256 amount) only_admin{
    balances[address(this)]=amount;
}


modifier only_admin(){
    require(msg.sender==admin_address);
    _;
}

function hire () payable{
    
  admin_address=msg.sender;
}



// function transfert the tokens from the contract account to the receiver account
function transferTo(address receiver, uint _amount) returns (bool success){
   
if(balances[address(this)] >= _amount && _amount > 0 && balances[receiver] + _amount > balances[receiver]) {
             balances[address(this)] -= _amount;
             balances[receiver] += _amount;
             return true;
          } else {
           return false;
         }
}

function enroll(address company_acc, address intereview_acc, address applicant_acc, address recommanded_acc){
    
        payroll.push(company_acc);
        payroll.push(intereview_acc);
        payroll.push(applicant_acc);
        payroll.push(recommanded_acc);
}

event paied(uint256 amount);
function payout() only_admin{
    uint256 b1;uint256 b1_r;
    uint256 b2;uint256 b2_r;
    uint256 b3;uint256 b3_r;
        (b1,b1_r)=calc(balances[address(this)],15);
        (b2,b2_r)=calc(balances[address(this)],25);
        (b3,b3_r)=calc(balances[address(this)],35);

    transferTo(payroll[0],b1);
    paied(b1);
    transferTo(payroll[1],b2);
    paied(b2);
   
    transferTo(payroll[2],b3);
    paied(b3);
    transferTo(payroll[3],b1);
    paied(b1);

    balances[address(this)] =0; //balances[address(this)]-(b1_r+b2_r+b3_r) substract the float point value
    for (uint i = 0; i<payroll.length-1; i++){
            payroll[i] = payroll[i+1];
        }
        delete payroll[payroll.length-1];
        payroll.length--;

 
}


function calc(uint256 value , uint256 percent) public returns (uint256 res, uint rest){
    
uint256 div_=div(value*percent,100);
uint256 rest_=value*percent-100*div_;

 return (div_,rest_);

 
}

}
