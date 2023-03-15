// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

contract requireRevertAssert {
    address public contractOwner;

    constructor() public {
        contractOwner = msg.sender;
    }

    error throwError(string, address);

    function checkRequire() public view returns (string memory) {
        require(msg.sender == contractOwner, "You are not the owner");
        return "It's good";
    }

    function checkRevert() public returns (string memory) {
        if (msg.sender != contractOwner) {
            revert throwError("You are not the owner", msg.sender);
        }
        return "It's good";
    }

    function checkAssert() public view returns (string memory) {
        assert(msg.sender == contractOwner);
        return "It's good";
    }
}
