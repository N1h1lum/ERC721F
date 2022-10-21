// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

abstract contract AllowList is Ownable {
    mapping(address => uint256) private allowList;

    modifier onlyAllowListWithAvailableTokens() {
        require(getAllowListFunds(msg.sender) > 0, "Address does not have any tokens available within allowList");
        _;
    }

    function getAllowListFunds(address _address) public view returns (uint256) {
        return allowList[_address];
    }

    function allowAddress(address _address, uint256 totalTokens) public onlyOwner {
        allowList[_address] = totalTokens;
    }

    function allowAddresses(address[] calldata _addresses, uint256 totalTokens) external onlyOwner {
        uint length = _addresses.length;
        for (uint i; i < length; ) {
            allowAddress(_addresses[i], totalTokens);
            unchecked {
                i++;
            }
        }
    }
}
