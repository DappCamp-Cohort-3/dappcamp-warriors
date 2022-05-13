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

    modifier onlyOwner() {
        require(msg.sender == owner, "Sender is not the owner");
        _;
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

    function transferFrom(address _from, address _to, uint256 _amount) external returns (bool) {
        address spender = msg.sender;
        uint256 currentAllowance = allowance(_from, spender);

        require(currentAllowance >= _amount, "Insufficient Allowance");
        _transfer(_from, _to, _amount);
    }

    function approve(
        address spender,
        uint256 amount
    ) external returns (bool) {
        require(spender != address(0), "Approve to the zero address");

        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return _allowances[_owner][_spender];
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        require(_to != address(0), "Mint to the zero address");

        _totalSupply += _amount;
        _balances[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
}