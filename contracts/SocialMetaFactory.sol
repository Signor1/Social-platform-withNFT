// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./SocialMeta.sol";

contract SocialMetaFactory {
    SocialMeta public nftContract;

    uint256 public nextTokenId = 1;

    event NFTCreated(
        uint256 indexed tokenId,
        address indexed creator,
        string metadata
    );

    constructor(address _nftContractAddress) {
        nftContract = SocialMeta(_nftContractAddress);
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
