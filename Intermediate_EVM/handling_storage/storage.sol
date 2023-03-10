//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Storage {
    uint256[] public numbers;

    function addNumbers(uint256 _num) public {
        numbers.push(_num);
    }

    function removeNumberByIndex(uint256 _index) public {
        numbers[_index] = numbers[numbers.length - 1];
        numbers.pop();
    }

    function getArrayLength() public view returns (uint256) {
        return numbers.length;
    }
}
