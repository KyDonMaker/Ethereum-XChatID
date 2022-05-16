pragma solidity 0.8.13;
// SPDX-License-Identifier: MIT

import "./AzookerXID.sol";

abstract contract AzookerOBJ is AzookerXID { 

function OwnedOBJ(uint ownID) public view returns (string memory AI, string memory Object)
{ AI = XOwnerID(ownID); Object = myGlobalXID.XOwnerXID(address(this), ownID); return (AI, Object); } 

function OwnedOBJs(string memory AI) internal view returns(uint[] memory)  
{ return(AI_IDS[AI]); }

constructor(address GlobalAT) AzookerXID(GlobalAT) { }



mapping(string => uint[])AI_IDS;

function OBJAdd(string memory AI, string memory objectID) internal returns(uint) {//Dinamic add obj to user AI
        uint ownID = XSetID(AI);
        AI_IDS[AI].push(ownID);

        myGlobalXID.XIDGlobalSet(ownID, objectID);
        return(ownID);  }          

      function OBJSet(uint ownID, string memory objectID) internal returns(uint) {//Dinamic edit object from ID
        myGlobalXID.XIDGlobalSet(ownID, objectID);
        return(ownID);  }



        function OBJSend(string memory toAI, uint ownID) public {//Send your object
        require(_AILogin(XOwnerID(ownID)), "Warning: Login failed.");
         OBJAdd(toAI, myGlobalXID.XOwnerXID(address(this), ownID));
         OBJUndo(ownID); }

        function OBJUndo(uint ownID) public {//Set object as fale->referenciable.
        require(_AILogin(XOwnerID(ownID)), "Warning: Login failed.");
        myGlobalXID.XIDGlobalSet(ownID, "false"); }//Only Contract

}
