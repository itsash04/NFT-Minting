// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CertificateNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    // ✅ Fix: Define the CertificateMinted event
    event CertificateMinted(address indexed owner, uint256 indexed tokenId, string metadataURI);

    constructor(string memory _name, string memory _symbol)
        ERC721(_name, _symbol)
        Ownable(msg.sender)
    {
        tokenCounter = 1;
    }

    function mintCertificate(address recipient, string memory tokenURI) public onlyOwner {
        uint256 newTokenId = tokenCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, tokenURI);

        // ✅ Fix: Emit the event after minting
        emit CertificateMinted(recipient, newTokenId, tokenURI);

        tokenCounter++;
    }
}
