//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Implementation {
    uint256 public resultOfSum;
    address public sender;
    uint256 public value;

    function callingProxyToMultiply(
        uint256 _a,
        uint256 _b
    ) public payable returns (uint256, address, uint256) {
        resultOfSum = _a + _b;
        sender = msg.sender;
        value = msg.value;
        return (resultOfSum, sender, value);
    }
}

contract Proxy {
    uint256 public resultOfSum;
    address public sender;
    uint256 public value;

    function callingProxyToMultiply(
        uint256 _a,
        uint256 _b,
        address _contract
    ) public payable {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature(
                "callingProxyToMultiply(uint256,uint256)",
                _a,
                _b
            )
        );
        require(success, "Delegate call failed");
        (resultOfSum, sender, value) = abi.decode(
            data,
            (uint256, address, uint256)
        );
    }
}
