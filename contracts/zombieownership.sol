// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import './zombieattack.sol';
import './erc721.sol';

// @title Zombie Attack
// @author Farnam Homayounfard
contract ZombieOwnership is ZombieAttack, ERC721 {
  mapping(uint256 => address) zombieApprovals;

  function balanceOf(address _owner) external view override returns (uint256) {
    // 1. Return the number of zombies `_owner` has here
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint256 _tokenId) external view override returns (address) {
    // 2. Return the owner of `_tokenId` here
    return zombieToOwner[_tokenId];
  }

  function _transfer(
    address _from,
    address _to,
    uint256 _tokenId
  ) private {
    ownerZombieCount[_to] = ownerZombieCount[_to].add(1);
    ownerZombieCount[_from] = ownerZombieCount[_from].sub(1);
    zombieToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transferFrom(
    address _from,
    address _to,
    uint256 _tokenId
  ) external payable override {
    require(zombieToOwner[_tokenId] == msg.sender || zombieApprovals[_tokenId] == msg.sender);
    _transfer(_from, _to, _tokenId);
  }

  function approve(address _approved, uint256 _tokenId)
    external
    payable
    override
    onlyOwnerOf(_tokenId)
  {
    zombieApprovals[_tokenId] = _approved;
    emit Approval(msg.sender, _approved, _tokenId);
  }
}
