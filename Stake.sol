contract Stake {
  mapping (address => uint) stake; // percentages by address (basically)
  address[] stakeHolders; // to iterate over
  address holdingTheBag; // last arrival to the party

  uint numStakeHolders;
  uint currentStake;
  uint sumStake;
  
  function Stake() {
    currentStake = 100;  /* the number doesn't really matter, payout computed by ratio anyway */
    sumStake = 0;
    numStakeHolders = 0;
  }

  function addStakeHolder(address stakeholder) {
    stake[stakeholder] = currentStake;

    stakeHolders.length = numStakeHolders+1;
    stakeHolders[numStakeHolders] = stakeholder;
    numStakeHolders++;

    holdingTheBag = stakeholder;

    sumStake += currentStake;
    currentStake = currentStake / 2; // note that this is not a get what you put in sort of scheme
  }

  function payout() { 
    uint bal = this.balance;    
    uint j;

    for (j = 0; j < stakeHolders.length; j++)
    {
      stakeHolders[j].send(bal * stake[stakeHolders[j]] / sumStake);
    }
  }
}
