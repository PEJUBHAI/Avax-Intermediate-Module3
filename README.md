# ERC20 Token Contract

A simple ERC20 token implementation in Solidity. This contract allows the owner to mint new tokens and any user to transfer or burn tokens. It's a basic example of how to create an ERC20 token on the Ethereum blockchain.

## Description

This project demonstrates a straightforward implementation of an ERC20 token contract using Solidity. The token includes functionalities for minting, transferring, and burning tokens. The owner of the contract has the exclusive right to mint new tokens, while all users can transfer and burn tokens. The contract also emits events on transfers, minting, and burning, making it compatible with standard ERC20 wallets and applications.

## Getting Started

### Deploying the contract

  ```
  1. Open Remix IDE at https://remix.ethereum.org/
  2. Create a new file and paste the Solidity code.
  3. Compile the contract.
  4. Deploy the contract to a local blockchain or any Ethereum testnet.
  ```
### Interacting with Contracts:

Utilize the Remix interface to interact with the deployed contracts, enabling you to call functions, read contract data, and monitor events.

## Help

Common issues and troubleshooting:

- **Insufficient balance**: Ensure that the address you're trying to transfer from or burn tokens from has enough balance.
- **Not the contract owner**: Only the contract owner can mint new tokens.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.