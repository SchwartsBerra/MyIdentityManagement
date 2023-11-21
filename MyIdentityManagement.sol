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


}
