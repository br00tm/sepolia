// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;
contract Calculator {
 uint256 public result;
 
 function add(uint256 a, uint256 b) public {
 result = a + b;
 }
 
 function subtract(uint256 a, uint256 b) public {
 result = a - b;
 }
 
 function mul(uint256 a, uint256 b) public {
result = a * b;
}
modifier nonZero(uint256 number) {
 require(number != 0, "Number cannot be zero");
_;
 }
 
 function divide(uint256 a, uint256 b) public nonZero(b) {
 result = a / b;
 }
}