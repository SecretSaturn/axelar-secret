// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringReturner {
    
    string public storedString;
    
    event StringSet(string _value);
    event Execution(uint256 commandId, string _value);

    function setString(string memory _string) public {
        storedString = _string;
        emit StringSet(_string);
    }

    function getString() public view returns (string memory) {
        return storedString;
    }

    //Axelar GMP will call execute to execute the payload provided. Payload has to be in bytes.

    function execute(
        bytes32 commandId,
        string calldata sourceChain,
        string calldata sourceAddress,
        bytes calldata payload
    ) external {
        string memory message = abi.decode(payload, (string));
        setString(message);
    }

}
