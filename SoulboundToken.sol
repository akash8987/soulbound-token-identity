// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

error TokenIsSoulbound();

/**
 * @title SoulboundToken
 * @dev Implementation of a non-transferable ERC721 token.
 */
contract SoulboundToken is ERC721, Ownable {
    
    event Locked(uint256 tokenId);

    constructor(string memory name, string memory symbol) 
        ERC721(name, symbol) 
        Ownable(msg.sender) 
    {}

    /**
     * @dev Mint a new soulbound token to a specific address.
     * @param to The recipient of the identity token.
     * @param tokenId The unique identifier for the token.
     */
    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
        emit Locked(tokenId);
    }

    /**
     * @dev Overridden transfer function to prevent movement.
     */
    function transferFrom(address from, address to, uint256 tokenId) public virtual override {
        revert TokenIsSoulbound();
    }

    /**
     * @dev Overridden safe transfer function to prevent movement.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public virtual override {
        revert TokenIsSoulbound();
    }

    /**
     * @dev Allows the issuer (owner) to revoke a token by burning it.
     */
    function revoke(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
    }

    /**
     * @dev Utility to check if a token is locked (Always true for this implementation).
     */
    function locked(uint256 tokenId) external view returns (bool) {
        _requireOwned(tokenId);
        return true;
    }
}
