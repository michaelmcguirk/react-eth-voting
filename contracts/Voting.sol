pragma solidity ^0.4.24;

contract Voting {
  struct Candidate {
    uint32 cId;
    string name;
    string party;
    bool exists;
  }

  struct Vote {
    uint32 vid;
    uint32 candidateId;
  }

  struct Voter {
    uint voterId;
    bool exists;
    bool hasVote;
  }

  mapping (uint => Candidate) candidates;
  mapping (uint => Voter) public voters;
  mapping (uint => Vote) votes;

  uint32 numOfCandidates;
  uint numOfVotes;
  uint numVoters;

  function addVoter(uint _vid) public {
    voters[_vid] = Voter(_vid, true, true);
    numVoters++;
  }

  function getVoter(uint _vid) external view returns (uint, bool, bool){
    return (voters[_vid].voterId, voters[_vid].exists, voters[_vid].hasVote);
  }

}