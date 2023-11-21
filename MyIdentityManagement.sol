// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdentityManagement {
    address public admin;
    mapping(address => bool) public isRegistered;
    mapping(address => string) public identities;

    event IdentityRegistered(address indexed user, string identity);
    event IdentityUpdated(address indexed user, string identity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only the admin can call this function");
        _;
    }

    modifier onlyRegistered() {
        require(isRegistered[msg.sender], "User is not registered");
        _;
    }

    constructor() {
        admin = msg.sender;
    }
function registerIdentity(string memory _identity) external {
        require(bytes(_identity).length > 0, "Identity cannot be empty");
        require(!isRegistered[msg.sender], "User is already registered");

        isRegistered[msg.sender] = true;
        identities[msg.sender] = _identity;

        emit IdentityRegistered(msg.sender, _identity);
    }

function updateIdentity(string memory _newIdentity) external onlyRegistered {
        require(bytes(_newIdentity).length > 0, "Identity cannot be empty");

        identities[msg.sender] = _newIdentity;

        emit IdentityUpdated(msg.sender, _newIdentity);
    }

}
