pragma solidity 0.8.13;
// SPDX-License-Identifier: MIT

abstract contract AzookerUAI  {
GlobalXID myGlobalXID;

constructor(address GlobalAT) { 
  myGlobalXID = GlobalXID(GlobalAT); }

function _AILogin(string memory AI) public view returns(bool succes)  
{ return(myGlobalXID._AILogin(AI, msg.sender)); } 


}



contract GlobalXID{/*Full Azooker API*/
  /*Web3*/function SetContract(address newContract, address Storage) public { }/*Add your contract to the database Open/Testing*/ 

  /*C# Dapp*/function KTSPayLogin(address contractAt, string calldata AI, string memory hash, uint amount) public returns(bool) { }/*Called from external Dapp on Payment by Manager*/
  /*Web3*/function KTSpend(address contractAt, string calldata AI, address userAddr, uint spendAmount) external returns(uint){ }/*Called when user buy a service*/

  /*Web3 direct reference*/function AIRegister(string memory AI, address mainAddress) public returns (bool succes) {} /*Web Register method*/

/*Interact Contract*/

/*Interact*/function _AILogin(string memory AI, address AIAddr) public view returns(bool succes){ }/*Validate the user login from external contract*/

/*Interact*/function AIByMain(address mainAddr) public view returns(address dappAddress){ }/*Find the DappAccount address by Main address*/
/*Interact*/function AIFind(address byAddr) public view returns(string memory AI) { } /*Find an account identifier by his DapAddress*/
/*Interact*/function AIAddress(string memory AI) public view returns(address Address) { }/*Dapp Addreess by Account identifier*/
/*Interact*/function AIMainAddr(string memory AI) public view returns(address MainAddress){ }/*Mainnet address from identifier*/


/*Database*/

/*Manager*/function XIDGlobalEdit(address contractAt, uint ID, string memory XID) public {}/*Edit any object as the contract Manager*/
/*Interact*/function XIDGlobalSet(uint ID, string memory XID) public{}/*Storage owned data inside the auto-generated ID from Interact*/
/*Interact*/function XOwnerXID(address Contract, uint ID) public view returns(string memory){}/*Reads the data associated to the ID, storaged in the Contract database*/
/*Interact*/function XOwnerAddr(address contractAt, uint ID) public view returns(address) {}/*Find the address of the ID owner at contract*/



}
