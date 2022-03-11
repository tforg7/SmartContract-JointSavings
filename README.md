# SmartContract-JointSavings-
Automate the creation of joint savings accounts with a Solidity smart contract that accepts two user addresses.


## Interact with Your Deployed Smart Contract
Now that the contract is deployed, it’s time to test its functionality! After each step, capture a screenshot of the execution.
To interact with your deployed smart contract I followed the next steps:

Deploy the contract after compiling:
![Deploying contract](./screenshots/Deploy.JPG)

Use the setAccounts function to define the authorized Ethereum address that will be able to withdraw funds from your contract.

Use the following Ethereum addresses or create new, dummy addresses on the Vanity-ETH website, which includes an Ethereum vanity address generator.
Dummy account1 address: 0x0c0669Cd5e60a6F4b8ce437E4a4A007093D368Cb
Dummy account2 address: 0x7A1f3dFAa0a4a19844B606CD6e91d693083B12c0

![Setting accounts](./screenshots/SetAccounts.JPG)


Test the deposit functionality of your smart contract by sending the following amounts of ether. After each transaction, use the contractBalance function to verify that the funds were added to your contract:


Transaction 1: Send 1 ether as wei with the deploying address
![First deposit](./screenshots/deposit_1Eth_w_msgSender.JPG)


Transaction 2: Send 10 ether as wei with a random address
![Second deposit](./screenshots/deposit_5Eth_o_Account.JPG)


Transaction 3: Send 5 ether with a second random address
![Third deposit](./screenshots/deposit_10Eth_o_Account(3dr).JPG)


You can notice that every deposit is gathered in the balancecontract. The three transactions gathered 16 ETH. 
Note Remembering how to convert ether to wei and vice versa can be challenging. So, you can use a website like Ethereum Unit Converter to ease doing the conversion.



After successfully deposited funds into your contract, test the contract’s withdrawal functionality by withdrawing 5 ether into accountOne and 8 ether into accountTwo. 

![First Withdraw](Withdraw_5Eth_Account1.JPG)

![Second Withdraw](Withdraw_8Eth_Account2.JPG)

After each transaction, use the contractBalance function to verify that the funds were withdrawn from your contract. Also, use the lastToWithdraw and lastWithdrawAmount functions to verify that the address and amount were correct.

In order to verify that the requirement is working. You can try to withdraw with another account than those set in SetAccount. But you will notice the transaction is blocked.
![Attempt Withdraw](Attempt-Withdraw_2Eth_o_Account.JPG)



