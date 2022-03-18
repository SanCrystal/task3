// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";



contract BlockGamesToken is ERC20, Ownable {
//events
event BuyToken (address receiver,uint256 amount);
    constructor() ERC20("BlockGamesToken", "BGT") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

//create a buy token function
    function buyToken (address receiver) external payable returns(bool success ){
        //cost of token is 1000 BGT per ether
        require(msg.value > 0);
        //get number of tokens /rates
        uint256 numOfToken = (msg.value * 1000 *(10**decimals())); 
        //mint tokens to buyer
        mint(receiver,numOfToken); //increments totalsupply
        emit BuyToken(receiver,numOfToken);
        return true;

    }

}