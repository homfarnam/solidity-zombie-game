// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Subcurrency {
  address public minter;

  mapping(address => uint256) public balances;

  // modifiers

  modifier onlyMinter() {
    require(msg.sender == minter, 'Only minter can call this function!');
    _;
  }

  event Sent(address from, address to, uint256 amount);

  constructor() {
    minter = msg.sender;
  }

  function mint(address receiver, uint256 amount) public onlyMinter {
    balances[receiver] += amount;
  }

  function sender(address receiver, uint256 amount) public {
    if (amount < balances[msg.sender]) revert('insufficent balance!');

    balances[msg.sender] -= amount;
    balances[receiver] += amount;

    emit Sent(msg.sender, receiver, amount);
  }
}
