pragma solidity ^0.4.4;

contract Token {
  // Ledger
  mapping(address => uint256) public balanceOf;

  // Map smart meters to their owners
  mapping(address => address) public user;

  // Implicit constructor to set ownership  
  address public owner = msg.sender;

  // Wh -> Token conversion
  function whToToken (uint256 wh) public pure returns (uint256) {
    // As of right now, this performs a 1:1 conversion of Wh to tokens
    // May be adapted in future implementations
    return wh;
  }

  // Token -> Wh conversion
  function tokenToWh (uint256 token) public pure returns (uint256) {
    // As of right now, this performs a 1:1 conversion of Wh to tokens
    // May be adapted in future implementations
    return token;
  }

  // Credit the User tokens for Wh produced
  function produce (uint256 wh) public {
    // TODO: Only trusted smart meters should be able to call this function
    balanceOf[user[msg.sender]] += whToToken(wh);
  }

  // Deduction of tokens for Wh consumed
  function consume (uint256 wh) public returns (uint256) {
    // TODO: Only trusted smart meters should be able to call this function
    uint256 consumed = 0;
    if (balanceOf[user[msg.sender]] >= whToToken(wh)) {
      // Sufficient balance to cover entire transaction
      consumed = wh;
      balanceOf[user[msg.sender]] -= whToToken(wh);
    } else {
      // Insufficient balance, use up remaining balance
      consumed = balanceOf[user[msg.sender]];
      balanceOf[user[msg.sender]] = 0;
    }
    return consumed;
  }
}