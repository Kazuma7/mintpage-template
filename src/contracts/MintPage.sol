// SPDX-License-Identifier: MIT
// pragma solidity ^0.8.4;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/utils/Counters.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.2/contracts/access/Ownable.sol";
// import "https://github.com/Brechtpd/base64/blob/main/base64.sol";

// contract mintPage is ERC721URIStorage, Ownable {
//     using Counters for Counters.Counter;
//     Counters.Counter private _tokenCounter;

//     constructor () ERC721 ("MintTest","MT") {}

//     uint256 MAX_ITEM = 100;
//     uint256 public constant price = 1000000000000000;

//     mapping(address => uint256[]) private _addressToIds;

//     //return metadata
//     function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {

//         bytes memory json = abi.encodePacked(
//             '{',
//                 '"name": "MintPage #',
//                 Strings.toString(_tokenId),
//                 '",',
//                 '"description": "",',
//                 '"image": "https://gateway.pinata.cloud/ipfs/QmP5v6PBDJqBAarDfNGyQMPY4eXuyc5MEq1zpsXcySSNxk"',
//             '}'
//         );

//         bytes memory metadata = abi.encodePacked(
//             "data:application/json;base64,",
//             Base64.encode(bytes(json))
//         );

//         return (string(metadata));
//     }

//     //get information
//     function getToken(address _owner)public view returns(uint256){
//         uint256 numOfToken = _addressToIds[_owner].length;
//         return numOfToken;
//     }

//     function getSupply()public view returns(uint256){
//         return _tokenCounter.current();
//     }

//     function buy() public payable {
//         require(_tokenCounter.current() < MAX_ITEM,"Purchase would exceed max supply of NFTs");
//         // require(price <= msg.value, "Ether value sent is not correct");

//         _tokenCounter.increment();
//         uint256 newItemId = _tokenCounter.current();
//         _safeMint(msg.sender, newItemId);
//         _setTokenURI(newItemId, tokenURI(newItemId));
//         _addressToIds[msg.sender].push(newItemId);
//     }

//     function withdraw() public onlyOwner {
//         uint256 balance = address(this).balance;
//         payable(msg.sender).transfer(balance);
//     }

// }
