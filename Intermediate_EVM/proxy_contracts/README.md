# Proxy and Implementation
This example shows a basic proxy contract pattern in Solidity, allowing for upgradability of smart contracts. The Proxy contract forwards function calls to the Implementation contract, which stores the result of a sum calculation and caller information.

To allow for separation of storage and logic, both contracts have identical state variables. The delegatecall function is used to forward calls and retrieve return values.