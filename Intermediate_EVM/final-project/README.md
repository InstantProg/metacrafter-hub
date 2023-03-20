# MC Contract

The `MC` contract is an ERC20 token contract that allows the owner to mint new tokens.

## Inheritance

The `MC` contract inherits from the `ERC20` and `Ownable` contracts from OpenZeppelin.

- The `ERC20` contract provides the standard implementation of the ERC20 token interface.
- The `Ownable` contract provides a mechanism for managing ownership of the contract.

## Functions

### constructor

The constructor takes two arguments: `_name` and `_symbol`, which set the name and symbol of the token respectively.

### mint

The `mint` function allows the owner of the contract to mint new tokens. It takes two arguments: `_to`, which specifies the address to receive the newly minted tokens, and `_amount`, which specifies how many tokens to mint.

## Usage

To use this contract, deploy it to a blockchain network and call its functions using a compatible wallet or web3 library.