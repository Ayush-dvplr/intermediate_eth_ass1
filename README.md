# MaskedOpinion Smart Contract

This Solidity program is a simple polling contract that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.

## Description

This program is a basic polling contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract includes functionalities such as creating proposals and voting on them. This program serves as a simple and straightforward introduction to Solidity programming and can be used as a stepping stone for more complex projects in the future.

In this smart contract we also implements the require(), assert() and revert() statements.

- require(): Used for input validation and precondition checks, ensuring certain conditions are met before proceeding.
- revert(): Handles exceptions by reverting transactions, undoing state changes, and providing error messages.
- assert(): Used for internal error checking, catching programming errors and ensuring invariants hold true.

## Getting Started

### Executing Program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at [Remix IDE](https://remix.ethereum.org/).

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a `.sol` extension (e.g., `MaskedOpinion.sol`). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MaskedOpinion {

    struct Proposal {
        string desc;
        uint voteCount;
    }

    Proposal[] private  proposals;
    mapping(address => mapping(uint => bool)) public hasVoted;

    function createProposal(string memory _desc) public {
        if (bytes(_desc).length == 0) {
            revert("Proposal description cannot be empty");
        }
        proposals.push(Proposal({
            desc: _desc,
            voteCount: 0
        }));
    }

    function vote(uint _planId) public {
        require(_planId < proposals.length, "Proposal does not exist");
        require(!hasVoted[msg.sender][_planId], "You have already voted on this proposal");

        proposals[_planId].voteCount += 1;
        hasVoted[msg.sender][_planId] = true;

        assert(proposals[_planId].voteCount <= proposals.length);
    }

    function getProposal(uint _planId) public view returns (string memory, uint) {
        require(_planId < proposals.length, "Proposal does not exist");
        Proposal storage proposal = proposals[_planId];
        return (proposal.desc, proposal.voteCount);
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile MaskedOpinion.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MaskedOpinion" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the createProposal and vote functions. For example, you can create a new proposal by providing a description. Similarly, you can poll on a proposal by providing the proposal ID.

## Authors

Ayush sah
[@linkedin](https://www.linkedin.com/in/ayushsah404/)


## License

This project is licensed under the MIT License
