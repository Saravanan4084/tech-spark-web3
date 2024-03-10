// contracts/SimpleStorage.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatientData {
    struct Record {
        string data;
        address doctor;
        uint256 timestamp;
    }

    mapping(address => Record[]) private patientRecords;

    function addRecord(string memory _data) public {
        Record memory newRecord = Record({
            data: _data,
            doctor: msg.sender,
            timestamp: block.timestamp
        });
        patientRecords[msg.sender].push(newRecord);
    }

    function getRecords() public view returns (Record[] memory) {
        return patientRecords[msg.sender];
    }
}
