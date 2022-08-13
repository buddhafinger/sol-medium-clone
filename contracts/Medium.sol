// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

// Import this file to use console.log
import "hardhat/console.sol";

// Import OpenZepplin contracts for use with our project

// Standard ERC721 - Defines our NFT Token
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// ERC721 Extenstion allows us to store our metadata. e.g Title and text.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// Makes our contract ownable and provides ownership details and allocation of any fees/royalies.
import "@openzeppelin/contracts/access/Ownable.sol";

// Manage assignment of token id for minted contracts. 
import "@openzeppelin/contracts/utils/Counters.sol";


// Create contract called Medium and inherit functionality of imported OpenZeppelin contracts.
contract Medium is ERC721, ERC721URIStorage, Ownable {


// using Counters.Counter we create a private counter for our smart contract with a public fees variable to display associated fees.
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

// create an unassigned integer for the fees variable.
    uint256 public fees;


// create a constructor which is ran at deployment of our smart contract which takes 3 parameters, the name, the symbol and fees for our NFT.

// After the constructor we define the constructor variables for our ERC721 contract.

constructor(
    string memory name_,
    string memory symbol_,
    uint fees_
) ERC721(name_, symbol_){
    fees = fees_;
}



// Our function
// address to = who the NFT is being minted to
// memory uri = where the metadata for this token is being stored.
// payable = is public payable function becasue we need to pay the associated fees to the owner (deployer)

function safeMint(address to, string memory uri) public payable {

    require(msg.value >= fees, "NOT ENOUGH MATIC");

    // calling payable we get the owner variable from the imported Ownable contract from OpenZepplin then transfer the fees to teh owner/deployer of the smartcontract.
    payable(owner()).transfer(fees);

    //Mint NFT

    // Using the tokenID from Counters we get the current id and then increment for the next usage.
    
    // Use our SafeMint function to mint the NFT to the 'to' address supplied with the retrieved tokenID.

    // Set the tokenURI using setTokenURI imported from ERC721URIStorage
    uint256 tokenId = _tokenIdCounter.current();
    _tokenIdCounter.increment();
    _safeMint(to, tokenId);
    _setTokenURI(tokenId, uri);

    // We check for any excess Matic over the requested fee amount and if so, we return the MATIC to the sender.
    // If the balance is over 0 we send the excess to the message sender / caller of this function. 


    uint256 contractBalance = address(this).balance;

    if (contractBalance > 0 ) {
        payable(msg.sender).transfer(address(this).balance);
    }
}


//Override functions


function _burn(uint256 tokenId) 
    internal
    virtual
    override(ERC721, ERC721URIStorage)
     {
        super._burn(tokenId);
    }

function tokenURI(uint256 tokenId)
    public
    view
    override(ERC721, ERC721URIStorage)
    returns (string memory) 
    {
        return super.tokenURI(tokenId);
    }

}
