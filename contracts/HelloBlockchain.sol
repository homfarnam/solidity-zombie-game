// SPDX-License-Identifier: MIT
// pragma solidity >=0.5.0 <0.6.0;
pragma solidity >=0.4.20;

contract ZombieFactory {
  uint256 dnaDigits = 16;
  uint256 dnaModulus = 10**dnaDigits;

  struct Zombie {
    string name;
    uint256 dna;
  }

  Zombie[] public zombies;

  function createZombie(string memory _name, uint256 _dna) public {
    // start here
    zombies.push(Zombie(_name, _dna));
  }
}
