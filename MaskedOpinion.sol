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
