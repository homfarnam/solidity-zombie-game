// SPDX-License-Identifier: MIT
// pragma solidity >=0.5.0 <0.6.0;
pragma solidity >=0.4.20;

contract ZombieFactory {
  event NewZombie(uint256 zombieId, string name, uint256 dna);
  uint256 dnaDigits = 16;
  uint256 dnaModulus = 10**dnaDigits;

  struct Zombie {
    string name;
    uint256 dna;
  }

  Zombie[] public zombies;

  function _createZombie(string memory _name, uint256 _dna) private {
    zombies.push(Zombie(_name, _dna));
    uint256 id = zombies.length - 1;
    emit NewZombie(id, _name, _dna);
  }

  function _generateRandomDna(string memory _str) private view returns (uint256) {
    uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
    return rand % dnaModulus;
  }

  function createRandomZombie(string memory _name) public {
    uint256 randDna = _generateRandomDna(_name);
    _createZombie(_name, randDna);
  }

  // start here
}
