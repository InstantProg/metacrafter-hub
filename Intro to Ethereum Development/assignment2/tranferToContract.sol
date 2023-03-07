//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract TransferToContract {
    function transferToContract(uint256 amount) public payable {
        require(
            msg.value >= amount,
            "Amount sent is not equal to the specified amount"
        );
    }

    receive() external payable {}

    function getBalanaceInWei() public view returns (uint256) {
        return address(this).balance;
    }

    function getBalanceInEth() public view returns (uint256) {
        return address(this).balance / 1e18;
    }

    function getBalanceInGwei() public view returns (uint256) {
        return address(this).balance / 1e9;
    }
}
