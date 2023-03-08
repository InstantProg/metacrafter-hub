//I truly don't know, I think it was a pretty steep learning curve starting from the events. 
//How would I know how to use web3js?


let contract_abi = abi_json_code_during_contract_compilation;
let EventTest = web3.eth.contract(contract_abi);
let EventTestContract = ClientReceipt.at("0x98...");

EventTestContract.transfer(function (err, data) {
  if (!err) console.log(data);
});
