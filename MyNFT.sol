// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    uint256 private _currentTokenId = 0;
    
    constructor() ERC721("MyNFT", "MNFT") {}
    
    function createNFT(string memory tokenURI) public onlyOwner returns (uint256) {
        _currentTokenId++;
        uint256 newNFTId = _currentTokenId;
        _safeMint(msg.sender, newNFTId);
        _setTokenURI(newNFTId, tokenURI);
        return newNFTId;
    }
    
    function transferNFT(address from, address to, uint256 tokenId) public {
        require(_isApprovedOrOwner(msg.sender, tokenId), "ERC721: transfer caller is not owner nor approved");
        _transfer(from, to, tokenId);
    }
}