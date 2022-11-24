//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//import ERC721 contract
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

//import Strings library to convert data to ascii strings data
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";

contract NFT is ERC721 {
    uint256 private _tokenIds;

// Enter the name and symbol of your NFT in the "Name" and "Symbol"
constructor () ERC721 ("Name", "Symbol") {}

    function mint() public returns(uint256) {
        _tokenIds +=1;
        _mint(msg.sender, _tokenIds);
        return _tokenIds;
    }


// In the function below include the CID of the JSON folder on IPFS
// Keep your images and json folder in different files
// Give an image and its corresponding json file same name - j1.jpg, j1.json
// Upload them to Pinata and get their CID
// First upload your images folder and copy the CID
// Then paste the image folder CID into each json where CID is written below:
/*
{
  "name": "j5",
  "description": "Condensed tree",
  "image": "https://ipfs.io/ipfs/Qma9Fs4oaMqGWBGdfb4wihs1X3mpEqMSpTS657ooyVFhmH/j5.jpg",
  "attributes": [
    {
      "trait_type": "Strength",
      "value": 30
    },
    {
      "trait_type": "Together",
      "value": "Green"
    }
  ]
}
*/

// Now upload your json folder to Pinata
// Copy the CID and include it in your code below - replace "QmabdPuysZUX..." with your CID
// Override is used because there is URI set in the ERC721 contract
// and virtual keyword is used in it. This makes it possible to override the URI
// and set your own URI

    function tokenURI(uint256 _tokenId) public override pure returns(string memory) {
        return string(abi.encodePacked("https://ipfs.io/ipfs/QmabdPuysZUXcnQucYefwp8NskSmCYXx9WDdkEscFejQe9/", 
        Strings.toString(_tokenId), "json"));
    }

    /*
  // If you want people to pay for minting
  

    //add a function to change the state variable
    uint256 public mintingFee = 300000000000000;
    function setMintingFee(uint256 _fee) public payable onlyOwner {
        mintingFee = _fee;
    
    //add a require statement to the mint function
    require(mintingFee == msg.value, "Not Enough Ether To Mint");
}

    */

}
