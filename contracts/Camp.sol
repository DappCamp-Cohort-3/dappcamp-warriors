// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./IERC20.sol";

contract Camp{
    
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;
    
    string public name = "Camp";
    string public symbol = "CAMP";

    address public owner;

    constructor() {
        owner = msg.sender;
    }

}