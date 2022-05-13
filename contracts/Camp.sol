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

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);

    function _transfer(address _from, address _to, uint256 amount) private {
        require(_to != address(0), "Transfer to the zero address");
        require(_from != address(0), "Transfer from the zero address");

        uint256 fromBalance = _balances[_from];
        require(fromBalance >= amount, "Transfer amount exceeds balance");
        _balances[_from] = fromBalance - amount;
        _balances[_to] += amount;

        emit Transfer(_from, _to, amount);
    }

    function transfer(address _to, uint256 _amount) external returns (bool) {
        _transfer(msg.sender, _to, _amount);
        return true;
    }

    function approve(
        address spender,
        uint256 amount
    ) external returns (bool) {
        
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        
    }

    function transferFrom(address _from, address _to, uint256 _amount) external returns (bool) {

    }
}