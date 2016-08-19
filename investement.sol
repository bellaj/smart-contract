// contract written by badr bellaj @badrbellaj

contract investement {

address sender;
address receiver;
address curator; // contract creator
uint public contract_balance;
bool order;
bool issent;


function investement (){ // constructor set the contract owner who accept the order to winthdraw
  curator=msg.sender;
  order = false;
  contract_balance= this.balance;
}

function set_order( bool order_) {
  if (msg.sender == curator)
   order=order_;
  else
  order =false;
 }

 event money_sent(address to, uint value);


function send_(uint amount , address to ) {

if ( amount > contract_balance)
 throw;
else
if (order) { order = false;
  issent=to.send(contract_balance);
  money_sent( to, amount);
  }

}



}
