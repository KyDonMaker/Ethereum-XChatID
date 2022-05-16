pragma solidity 0.8.13;
//SPDX-License-Identifier: MIT

import "./AzookerOBJ.sol";
contract XIDChat is AzookerOBJ { 

constructor(address myGlobal) payable AzookerOBJ(myGlobal)  {}

mapping (address  => uint[] ) Chats;//AI => uint[] for managed GameObjects


function MSGSend(string memory AI, string memory message) public //Needed from - GLOBAL
 { require(_AILogin(AI), "[Login Error]: Account not match in the database.");

  uint textID = OBJAdd(AI, message); 
  Chats[address(0)].push(textID); }


  function MSGSendDM(string memory AI, address ToAddr, string memory message) public //AI = User
  { require(_AILogin(AI), "[Login Error]: Account not match in the database.");

   uint textID = OBJAdd(AI, message);
   Chats[ToAddr].push(textID); }



    function MSGPush(string memory AI, uint ownID, string memory msgPush) public returns(string memory Full)
     { require(_AILogin(AI), "[Login Error]: Account not match in the database.");

      string memory Object = myGlobalXID.XOwnerXID(address(this), ownID); 

       Full = string(abi.encodePacked(Object,",",msgPush));/*Format as "Json"*/
        OBJSet(ownID, Full); }



  function MSGView() public view returns(uint[] memory)//Global chat view
  { return(Chats[address(0)]); }

  function MSGList() public view returns(uint[] memory)//Mails at some address
  { return Chats[msg.sender]; }
  
   function MSGObjects(string memory AI) public view returns(uint[] memory AIList)//AI owned msg-objects
  {  AIList = OwnedOBJs(AI); }//View AI Objects -> While function OwnedOBJ(uint ownID) returns (string memory AI, string memory Object)

}
