// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;



contract MyToken {

    // Public variables to store token details
    string public tokenName;
    string public tokenAbbrv;
    uint public totalSupply;

    // Mapping to store balances of addresses
    mapping(address => uint) public balances;

    // Constructor to initialize the token details
    constructor(string memory _name, string memory _abbrv) {
        tokenName = _name;
        tokenAbbrv = _abbrv;
        totalSupply = 0;
    }

    // Function to mint new tokens
    function mint(address _receiver, uint _amt) public {
        totalSupply += _amt;
        balances[_receiver] += _amt;
    }

    // Function to burn tokens
    function burn(address _sender, uint _amt) public {
        if(balances[_sender]>=_amt){
            totalSupply -= _amt;
            balances[_sender] -= _amt;
        }
        
    }
    function burnRequire(address _sender, uint _amt) public {
        require(balances[_sender]>=_amt,"Not sufficient credit");
            totalSupply -= _amt;
            balances[_sender] -= _amt;
        
        
    }

    function burnRevert(address _sender, uint _amt) public {
        if(balances[_sender]>=_amt){
            revert("Not sufficient credit");
        }
        totalSupply -= _amt;
        balances[_sender] -= _amt;
        
    }
    function burnAssert(address _sender, uint _amt) public {
        assert(balances[_sender]>=_amt);
        totalSupply -= _amt;
        balances[_sender] -= _amt;
        
        
    }
}
