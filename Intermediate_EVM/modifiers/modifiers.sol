//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Functions {
    address admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    function add(
        uint256 _a,
        uint256 _b
    ) external view onlyAdmin returns (uint256) {
        return _a + _b;
    }

    function subtract(
        uint256 _a,
        uint256 _b
    ) external view onlyAdmin returns (uint256) {
        return _a - _b;
    }

    function multiply(
        uint256 _a,
        uint256 _b
    ) external view onlyAdmin returns (uint256) {
        return _a * _b;
    }

    function divide(
        uint256 _a,
        uint256 _b
    ) external view onlyAdmin returns (uint256) {
        return _a / _b;
    }
}
