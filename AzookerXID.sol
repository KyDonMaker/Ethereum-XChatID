pragma solidity ^0.8.13;

// SPDX-License-Identifier: MIT

import "./AzookerUAI.sol";//AzookerUAI
abstract contract AzookerXID is AzookerUAI{
constructor(address GlobalAT) AzookerUAI(GlobalAT) { }

function IDLastIndex() public view returns(uint){return IDs;}
uint IDs = 0;

mapping(uint => string) ID_AI;

   function XSetID(string memory AI) internal returns(uint){/*SetUp an ID, owned by an account identifier*/
    ++IDs;  ID_AI[IDs] = AI;
    return (IDs); }
         
      function XOwnerID(uint ID) public view  returns(string memory){ /*Owner Identifier returned by the ID*/
       return ID_AI[ID]; }
       
}
