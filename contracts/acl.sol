// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract DataStorage {
    uint256 private data;
    address public allowedAddress;

   

    constructor(address _allowedAddress) {
        allowedAddress = _allowedAddress;
    }

    function setData(uint256 _data) external  {
        require(msg.sender == allowedAddress, "Unauthorized access");
        data = _data;
    }

    function getData() external view  returns (uint256) {
        require(msg.sender == allowedAddress, "Unauthorized access");
        return data;
    }
}