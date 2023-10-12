//SPDX-License-Identifier: GPL-3.0 
pragma solidity ^0.8.0; 

contract EnsDomen {

  struct WalletInfo {
    address owner;
    uint256 timestamp;
    uint256 price;
  }

  mapping (string => WalletInfo) domensList;
  
  function registationEns(string memory domenName) public payable {
    domensList[domenName] = WalletInfo({
      owner: msg.sender,
      timestamp: block.timestamp,
      price: msg.value
    });
  }

  function getDomenOwner(string memory domenName) public view returns (address) { 
    return domensList[domenName].owner;
  }

  // everyone can withdraw money from contract
  function withdrawAll(address payable wallet) public {
    wallet.transfer(address(this).balance);
  }
}
