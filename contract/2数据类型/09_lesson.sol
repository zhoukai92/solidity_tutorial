// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "hardhat/console.sol";

/*

*/
contract Lesson29 {

    struct Dog {
        string name;
        uint age;
    }
    
    function f0() public pure returns (Dog memory) {
        Dog memory dog = Dog("aa", 11);
        return dog;
    }


    struct User {
        string name;
        uint age;
        mapping(string subject => uint score) score;
    }

    mapping(address => User) public users;

    function createUser(string memory _name, uint _age) public {
        User storage user = users[msg.sender];
        user.name = _name;
        user.age = _age;
    }

    function updateUserScore(string memory _subject, uint _score) public {
        users[msg.sender].score[_subject] = _score;
    }

    function getUserScore(string memory _subject) public view returns (uint) {
        return users[msg.sender].score[_subject];
    }

}
