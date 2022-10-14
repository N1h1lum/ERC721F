// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9 <0.9.0;

import "../token/soulbound/Soulbound.sol";

/**
 * @title SoulboundMock
 * This mock provides a public mint and burn function for testing purposes
 */
contract SoulboundMock is Soulbound {
    constructor(string memory name, string memory symbol)
        Soulbound(name, symbol)
    {}

    /**
     * @notice Mint your tokens here
     * @dev Function utilised in testing, don't use in production due to lack of restrictions
     */
    function mint(address to, string memory uri) public {
        _mint(to, uri);
    }

    /**
     * @notice Burns `tokenId`
     */
    function burn(uint256 tokenId) public {
        _burn(tokenId);
    }

    /**
     * @dev Helper function to bypass non-overload support from hardhat testing of safeTransferFrom(from, to, tokenId)
     */
    function safeTransferFromHelperNonData(
        address from,
        address to,
        uint256 tokenId
    ) public {
        safeTransferFrom(from, to, tokenId);
    }

    /**
     * @dev Helper function to bypass non-overload support from hardhat testing of safeTransferFrom(from, to, tokenId, data)
     */
    function safeTransferFromHelperWithData(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public {
        safeTransferFrom(from, to, tokenId, data);
    }
}
