// SPDX-License-Identifier: MIT
pragma solidity >=0.4.20;
import './HelloBlockchain.sol';

contract ZombieFeeding is ZombieFactory {
  function feedAndMultiply(uint256 _zombieId, uint256 _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];
    _targetDna = _targetDna % dnaModulus;
    uint256 newDna = (myZombie.dna + _targetDna) / 2;
    _createZombie('NoName', newDna);
  }
}
