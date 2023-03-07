//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract VariableDeclaration {
    string name;
    uint256 age;
    address open_account;
    bool married;

    function setName(string memory _name) public {
        name = _name;
    }

    function setAge(uint256 _age) public {
        age = _age;
    }

    function setOpenAccount(address _address) public {
        open_account = _address;
    }

    function setMaritalStatus(bool _marital_status) public {
        married = _marital_status;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function getAge() public view returns (uint256) {
        return age;
    }

    function getOpenAccount() public view returns (address) {
        return open_account;
    }

    function getMaritalStatus() public view returns (bool) {
        return married;
    }
}
