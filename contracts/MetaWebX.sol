// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IMetaWebFactory {
    function createNFT(
        address _creator,
        string memory _metadata
    ) external returns (uint256);
}

contract MetaWebX {
    IMetaWebFactory public nftFactory;

    enum Roles {
        User,
        Moderator,
        Admin
    }

    // Struct to represent a user
    struct User {
        bool exists;
        string username;
        address userAddress;
        uint256[] createdNFTs;
        uint256[] likedNFTs;
        uint256[] groups;
        Roles role; // 0: User, 1: Moderator, 2: Admin
    }

    // Struct to represent a group/community
    struct Community {
        string name;
        address creator;
        address[] members;
        uint256[] communityNFTs;
    }

    // Struct to represent a comment on an NFT
    struct Comment {
        address commenter;
        string comment;
    }

    // Events
    event NewUserRegistered(address indexed userAddress, string username);
    event NewGroupCreated(
        uint256 indexed groupId,
        string name,
        address creator
    );
    event NewNFTCreated(
        uint256 indexed tokenId,
        string metadata,
        address creator
    );
    event NFTLiked(uint256 indexed tokenId, address indexed user);
    event CommentAdded(
        uint256 indexed tokenId,
        address indexed commenter,
        string comment
    );

    // Mappings
    mapping(address => User) public users;
    mapping(uint256 => Community) public communities;
    mapping(uint256 => address) public nftCreators;
    mapping(uint256 => Comment[]) public nftComments;

    // Variables
    uint256 public totalCommunities;
    uint256 public totalNFTs;

    constructor(address _factoryAddress) {
        nftFactory = IMetaWebFactory(_factoryAddress);

        users[msg.sender].role = Roles.Admin;
        users[msg.sender].username = "owner";
        users[msg.sender].userAddress = msg.sender;
        users[msg.sender].exists = true;
    }

    modifier onlyExistingUser(address _userAddress) {
        require(users[_userAddress].exists, "User does not exist");
        _;
    }

    modifier onlyAdmin() {
        require(
            users[msg.sender].role == Roles.Admin,
            "Only admin can call this function"
        );
        _;
    }

    function registerUser(string memory _username) external {
        require(!users[msg.sender].exists, "User already registered");

        users[msg.sender] = User(
            true,
            _username,
            msg.sender,
            new uint256[](0),
            new uint256[](0),
            new uint256[](0),
            Roles.User
        );

        emit NewUserRegistered(msg.sender, _username);
    }

    function createGroup(
        string memory _name
    ) external onlyExistingUser(msg.sender) {
        communities[totalCommunities] = Community(
            _name,
            msg.sender,
            new address[](0),
            new uint256[](0)
        );

        users[msg.sender].groups.push(totalCommunities);

        totalCommunities++;

        emit NewGroupCreated(totalCommunities - 1, _name, msg.sender);
    }

    function createNFT(
        string memory _metadata
    ) external onlyExistingUser(msg.sender) {
        uint256 tokenId = nftFactory.createNFT(msg.sender, _metadata);

        users[msg.sender].createdNFTs.push(tokenId);

        nftCreators[tokenId] = msg.sender;

        totalNFTs++;

        emit NewNFTCreated(tokenId, _metadata, msg.sender);
    }

    function likeNFT(uint256 _tokenId) external onlyExistingUser(msg.sender) {
        require(_exists(_tokenId), "NFT does not exist");

        users[msg.sender].likedNFTs.push(_tokenId);

        emit NFTLiked(_tokenId, msg.sender);
    }

    function addComment(
        uint256 _tokenId,
        string memory _comment
    ) external onlyExistingUser(msg.sender) {
        require(_exists(_tokenId), "NFT does not exist");

        nftComments[_tokenId].push(Comment(msg.sender, _comment));

        emit CommentAdded(_tokenId, msg.sender, _comment);
    }

    function getUserCreatedNFTs(
        address _user
    ) external view returns (uint256[] memory) {
        return users[_user].createdNFTs;
    }

    function getUserLikedNFTs(
        address _user
    ) external view returns (uint256[] memory) {
        return users[_user].likedNFTs;
    }

    function getUserGroups(
        address _user
    ) external view returns (uint256[] memory) {
        return users[_user].groups;
    }

    function getNFTCreator(uint256 _tokenId) external view returns (address) {
        return nftCreators[_tokenId];
    }

    function getNFTComments(
        uint256 _tokenId
    ) external view returns (Comment[] memory) {
        return nftComments[_tokenId];
    }

    function transferGroupOwnership(
        uint256 _communityId,
        address _newOwner
    ) external onlyExistingUser(msg.sender) {
        require(
            communities[_communityId].creator == msg.sender,
            "Only group creator can transfer ownership"
        );

        communities[_communityId].creator = _newOwner;
    }

    function grantUserRole(address _user, Roles _role) external onlyAdmin {
        require(uint256(_role) <= 2, "Invalid role");

        users[_user].role = _role;
    }

    // Internal function to check if an NFT exists
    function _exists(uint256 _tokenId) internal view returns (bool) {
        return nftCreators[_tokenId] != address(0);
    }
}
