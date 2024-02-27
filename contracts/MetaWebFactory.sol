// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./MetaWebNFT.sol";

contract MetaWebFactory {
    MetaWebNFT public nftContract;

    uint256 public nextTokenId = 1;

    event NFTCreated(
        uint256 indexed tokenId,
        address indexed creator,
        string metadata
    );

    constructor(address _nftContractAddress) {
        nftContract = MetaWebNFT(_nftContractAddress);
    }

    function createNFT(
        address _creator,
        string memory _metadata
    ) external returns (uint256) {
        uint256 tokenId = nextTokenId++;

        nftContract.mint(_creator, tokenId, _metadata);

        emit NFTCreated(tokenId, _creator, _metadata);

        return tokenId;
    }
}
