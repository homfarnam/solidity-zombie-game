pragma solidity >=0.5.0 <0.6.0;
import './zombiehelper.sol';

contract ZombieAttack is ZombieHelper {
  uint256 randNonce = 0;

  uint256 attackVictoryProbability = 70;

  function randMod(uint256 _modulus) internal returns (uint256) {
    randNonce++;
    return uint256(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }

  function attack(uint256 _zombieId, uint256 _targetId) external {}
}
