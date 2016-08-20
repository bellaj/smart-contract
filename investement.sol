// contract written by badr bellaj @badrbellaj
// Desc: the contract is not secure because we care just about the functional aspects (function definitions, cash flow ) and it is desinged to be deployed in a trustful testing-environment

contract investement {

address sender;
address receiver;
address curator; // contract creator
uint public contract_balance;
bool order;
bool issent;
uint numStakeHolders;
Investor[] list_investor;
Entrepreneur entrep;

struct Entrepreneur {

  address ent_add;
  uint ratio;
}

struct Investor {
  uint investement;
  address inv_add;
  uint ratio;
}



mapping (address => Investor[] )   investemments; //link the entrepreneur to the investors list
mapping (address => uint) balances;

function investement (){ // constructor set the contract owner who accept the order to winthdraw
  curator=msg.sender;
  order = false;
  contract_balance= this.balance;
}

function register_stakholders(address[] investor_add ,uint[] investement, uint[] inve_ratios, address entrepreneur_address, uint ratio_entr) onlyOwner{


for (var i=0; i<=  investor_add.length;i++)
{
  //var queue = requestQueue; // stores reference to storage
  list_investor[i]=Investor(investement[i],investor_add[i],inve_ratios[i]);

}
entrep=Entrepreneur(entrepreneur_address,ratio_entr);
investemments[entrepreneur_address] = list_investor;
numStakeHolders=investor_add.length;
//investemments[entrepreneur]=investor;
}

function withdrawRefund() { //the entrepreneur winthdraw the money once the investors deposit their funds
if (msg.sender == entrep.ent_add && this.balance > 0)
msg.sender.send(this.balance);
  }

modifier onlyOwner {
    if (msg.sender != curator)
        throw;
    _
}

function set_order( bool order_) onlyOwner  constant returns  (bool order_state){ // the contract creator lock/unlock the send_ function
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

function pay_back (){ // pay money back to the investors in accordinance with their ratios.
//msg.balance;
uint bal= msg.value; //balance sent by the entrepreneur
address ent=msg.sender;

 list_investor = investemments[ent] ;
address inv_add;
uint rat;
for (var i=0; i<=  list_investor.length;i++)
{
  inv_add=  list_investor[i].inv_add ; rat=list_investor[i].ratio;
  //var queue = requestQueue; // stores reference to storage
 send_( ( bal * rat/100),inv_add );

}
}

function deposit(address to_entrepreneur){ //investors send the investement to the contract
balances[msg.sender] += msg.value;

}

function end_investement(){ // the entrepreneur pa back the capital and end the contract

}

/* Function to recover the funds on the contract */
function kill() onlyOwner {
  suicide(curator);

}

}
