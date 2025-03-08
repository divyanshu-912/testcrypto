// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyFreeToken is ERC20 {
    mapping(address => bool) public hasClaimed;
    uint256 public claimAmount = 100 * 10 ** decimals(); // 100 tokens per claim

    constructor() ERC20("MyFreeToken", "MFT") {
        _mint(address(this), 1000000 * 10 ** decimals()); // 1,000,000 tokens to contract
    }

    function claim() public {
        require(!hasClaimed[msg.sender], "You already claimed your tokens!");
        hasClaimed[msg.sender] = true;
        _transfer(address(this), msg.sender, claimAmount); // Send 100 tokens
    }
}