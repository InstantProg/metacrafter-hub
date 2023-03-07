//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Functions {
    function add(uint256 a, uint256 b) external pure returns (uint256) {
        return a + b;
    }

    function subtract(uint256 a, uint256 b) external pure returns (uint256) {
        return a - b;
    }

    function multiply(uint256 a, uint256 b) external pure returns (uint256) {
        return a * b;
    }

    function divide(uint256 a, uint256 b) external pure returns (uint256) {
        return a / b;
    }
}
