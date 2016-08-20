// contract written by badr bellaj @badrbellaj

contract investement {

address sender;
address receiver;
address curator; // contract creator
uint public contract_balance;
bool order;
bool issent;

struct Entrepreneur {
  uint key;
  uint loan;
  address ent_add;
}

struct Investor {
  uint investement;
  address inv_add;
}



mapping (address => Investor) public hubs;

function investement (){ // constructor set the contract owner who accept the order to winthdraw
  curator=msg.sender;
  order = false;
  contract_balance= this.balance;
}


modifier onlyOwner {
    if (msg.sender != curator)
        throw;
    _
}

function set_order( bool order_) onlyOwner  constant returns  (bool order_state){
    order=order_;

  return order;
 }

 event money_sent(address to, uint value);


function send_(uint amount , address to ) {

if ( amount > this.balance)
 throw;
else
if (order) { order = false;
  issent=to.send(amount);
  money_sent( to, amount);
  }

}

function pay_back (){
//msg.balance;


}
/* Function to recover the funds on the contract */
function kill() onlyOwner {
  suicide(curator);

}

}
