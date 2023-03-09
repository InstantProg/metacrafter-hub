//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ElectricalBill {
    //This contract will store people that will be paying for their electrical bill
    //The blueprint for a person will be highlighted in the People struct
    //All of the people paying for their bills will be stored in an array people_ar
    //each day the amount of paid of

    struct Person {
        address addressOfPerson;
        uint256 debt_in_wei;
        uint256 debt_in_kilowat_hours;
        bool isAddedToRecord;
        bool isCriminal;
    }

    mapping(address => Person) public people;
    address[] public peopleAddresses;
    uint256 public priceOfKilowatHourInWei;
    address admin;

    constructor() {
        //Setting the admin of the whole organization
        admin = msg.sender;
    }

    function addYourself(
        uint256 _debt_in_wei,
        uint256 _debt_in_kilowat_hours
    ) public {
        //Check that each peson can only record himslef ones
        uint256 numberOfPeople = peopleAddresses.length;
        address current_person = msg.sender;
        require(
            current_person != people[msg.sender].addressOfPerson,
            "You have already recorded yourself"
        );
        people[msg.sender] = Person(
            msg.sender,
            _debt_in_wei,
            _debt_in_kilowat_hours,
            true,
            false
        );
        peopleAddresses.push(msg.sender);
        assert(numberOfPeople != peopleAddresses.length);
    }

    function addingToBill(uint256 kilowatHourPerDay) public {
        require(msg.sender == admin, "Only admic call call this function");
        for (uint8 i = 0; i < peopleAddresses.length; i++) {
            people[peopleAddresses[i]]
                .debt_in_kilowat_hours += kilowatHourPerDay;
            people[peopleAddresses[i]].debt_in_wei += conversion(
                kilowatHourPerDay,
                "KTW"
            );
        }
    }

    function conversion(
        uint _input,
        string memory _typeOfConversion
    ) public view returns (uint256) {
        string memory kilowattToWei = "KTW";
        string memory weiToKilowatt = "WTK";

        if (
            keccak256(bytes(_typeOfConversion)) ==
            keccak256(bytes(kilowattToWei))
        ) {
            return _input * priceOfKilowatHourInWei;
        } else if (
            keccak256(bytes(_typeOfConversion)) ==
            keccak256(bytes(weiToKilowatt))
        ) {
            return _input / priceOfKilowatHourInWei;
        }
    }

    function payBill(uint256 _amountInWei) public payable {
        if (msg.value != _amountInWei) {
            revert(
                "Your expressed paying amount does not match with the actual paying amount"
            );
        }
        people[msg.sender].debt_in_wei -= _amountInWei;
        people[msg.sender].debt_in_kilowat_hours -= conversion(
            _amountInWei,
            "WTK"
        );
    }

    function setElectricityPrice(uint256 _new_price) public {
        require(msg.sender == admin, "Only Admin can set Electricity Price");
        priceOfKilowatHourInWei = _new_price;
    }
}
