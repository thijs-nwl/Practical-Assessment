pragma solidity ^0.4.0;

contract Profile {
  address private owner;

  function profile() public {
    owner = msg.sender;
  }

  modifier onlyOwner(address _owner) {
    require(msg.sender == _owner);
    _;
  }

  function retOwner() public constant returns (address) {
      return owner;
  }

  struct user {
    string info;
    uint bal;
  }

  mapping(address => user) users;

  function createUser(address _address, string _info) public
    onlyOwner(owner)
  {
    users[_address] = user(_info, 0);
  }

  function getUser(address _address) public view returns(string, uint){
    return  (users[_address].info, users[_address].bal);
  }

  function claimInBank(address _address) public
    onlyOwner(owner)
  {
      users[_address].bal = 100;
  }

  function destory () public {
        selfdestruct(msg.sender);
    }
}
