//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FundMe {
    // This contract allows people to fund projects by gathering their money in the balance of the contract
    // At the end only the owner of this contract can withdraw the tokens from tha balance of the contract to his address

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can do this");
        _;
    }

    function fund() public payable {
        require(
            msg.value > 1e18,
            "Not enought amount funded, need at least 1ETH"
        );
    }

    function withdraw() public payable onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "There is no amount of eth on the balance");
        owner.transfer(balance);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function convertToWei(
        uint256 _usdAmount,
        uint256 _ETHToUSD
    ) public pure returns (uint256) {
        uint256 ethAmount = ((_usdAmount * 1e18) / _ETHToUSD); //for the sake of correct zeros
        return ethAmount;
    }

    function getBalanceOfOwner() public view returns (uint256) {
        return owner.balance;
    }

    receive() external payable {}
}
