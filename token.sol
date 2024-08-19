// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// This contract implements a basic ERC-20 token standard
contract ERC20 {
	// Public variables for total supply of the token and balance mapping
	uint256 public totalSupply;
	mapping(address => uint256) public balanceOf;
	
	// Address of the contract owner
	address public owner;

	// Event emitted when a transfer occurs
	event Transfer(address indexed from, address indexed to, uint256 value);

	// Modifier to restrict certain functions to the contract owner
	modifier onlyOwner() {
		require(msg.sender == owner, "Not the contract owner");
		_;
	}

	// Constructor function sets the deployer as the owner of the contract
	constructor() {
		owner = msg.sender;
	}

	// Function to transfer tokens to a recipient
	function transfer(address recipient, uint256 amount) external returns (bool) {
		// Check if the sender has enough balance
		require(balanceOf[msg.sender] >= amount, "Insufficient balance");
		
		// Deduct the amount from the sender's balance and add it to the recipient's balance
		balanceOf[msg.sender] -= amount;
		balanceOf[recipient] += amount;
		
		// Emit a Transfer event
		emit Transfer(msg.sender, recipient, amount);
		
		return true;
	}

	// Function to mint new tokens, restricted to the owner
	function mint(uint256 amount) external onlyOwner {
		// Increase the owner's balance by the minted amount
		balanceOf[msg.sender] += amount;
		
		// Increase the total supply by the minted amount
		totalSupply += amount;
		
		// Emit a Transfer event from the zero address to signify minting
		emit Transfer(address(0), msg.sender, amount);
	}

	// Function to burn tokens from the sender's balance
	function burn(uint256 amount) external {
		// Check if the sender has enough balance to burn
		require(balanceOf[msg.sender] >= amount, "Insufficient balance to burn");
		
		// Deduct the amount from the sender's balance and decrease the total supply
		balanceOf[msg.sender] -= amount;
		totalSupply -= amount;
		
		// Emit a Transfer event to the zero address to signify burning
		emit Transfer(msg.sender, address(0), amount);
	}
}
