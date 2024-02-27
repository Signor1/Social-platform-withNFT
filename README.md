# MetaWeb Social Media Platform

## Introduction

MetaWeb Social Media Platform is a decentralized social media platform built on the Ethereum blockchain. It allows users to create and share content in the form of NFTs representing multimedia assets such as images, videos, and audio clips. The platform incorporates advanced features such as user authentication, role-based access control (RBAC), and content moderation.

## Contracts Overview

### 1. MetaWebNFT

- **Contract Address**: [0x3BB80889A58951260f4C821733D34e64c955EB53](https://sepolia.etherscan.io/address/0x3BB80889A58951260f4C821733D34e64c955EB53)
- **Description**: This contract is responsible for managing the creation and ownership of non-fungible tokens (NFTs) representing multimedia assets.
- **Features**:
  - ERC721 compliant.
  - Supports minting NFTs with associated metadata.
  - Extends ERC721URIStorage for storing metadata URIs.

### 2. MetaWebFactory

- **Contract Address**: [0x14dF34CB7Ddda12c4607f5129Ef9fd6D223E21AA](https://sepolia.etherscan.io/address/0x14dF34CB7Ddda12c4607f5129Ef9fd6D223E21AA)
- **Description**: The factory contract for creating NFTs on the MetaWeb platform.
- **Features**:
  - Allows users to create NFTs through the factory contract.
  - Integrates with MetaWebNFT contract for NFT creation.
  - Emits events for tracking newly created NFTs.

### 3. MetaWebX

- **Contract Address**: [0x94434C0a47cB2a3E5e1614aB514EC5700aBF1605](https://sepolia.etherscan.io/address/0x94434C0a47cB2a3E5e1614aB514EC5700aBF1605)
- **Description**: The main contract for MetaWeb Social Media Platform, handling user registration, content creation, group management, and interactions.
- **Features**:
  - User registration with usernames.
  - Group creation and ownership transfer functionality.
  - NFT creation and interaction features (liking, commenting).
  - Role-based access control (Admin, Moderator, User).

## Usage

You can interact with these contracts using various Ethereum wallets or through decentralized applications (DApps) that support smart contract interactions.

To interact with the MetaWebX contract, you can:

1. Register as a user using the `registerUser` function.
2. Create groups using the `createGroup` function.
3. Create NFTs using the `createNFT` function.
4. Like NFTs using the `likeNFT` function.
5. Add comments to NFTs using the `addComment` function.
6. Transfer group ownership using the `transferGroupOwnership` function.
7. Grant roles to users using the `grantUserRole` function.

## Deployment

These contracts have been deployed to the Ethereum blockchain:

- **MetaWebNFT**: [0x3BB80889A58951260f4C821733D34e64c955EB53](https://sepolia.etherscan.io/address/0x3BB80889A58951260f4C821733D34e64c955EB53)
- **MetaWebFactory**: [0x14dF34CB7Ddda12c4607f5129Ef9fd6D223E21AA](https://sepolia.etherscan.io/address/0x14dF34CB7Ddda12c4607f5129Ef9fd6D223E21AA)
- **MetaWebX**: [0x94434C0a47cB2a3E5e1614aB514EC5700aBF1605](https://sepolia.etherscan.io/address/0x94434C0a47cB2a3E5e1614aB514EC5700aBF1605)

## License

This project is licensed under the [MIT License](LICENSE).
