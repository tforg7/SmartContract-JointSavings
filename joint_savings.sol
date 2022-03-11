/*
Joint Savings Account
---------------------

Create a solidity smart contract to automate the creation of joint savings accounts that accepts two user addresses that are then able to control a joint savings account. 
This smart contract will use ether management functions to implement various requirements from the financial institution to provide the features of the joint savings account.

*/

pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    // define the following variables:
    address payable accountOne;
    address payable accountTwo;
    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;

 
    //Define a function named **withdraw** that will accept two arguments.
    function withdraw(uint amount, address payable recipient) public {

        //Define a `require` statement that checks if the `recipient` is equal to either `accountOne` or `accountTwo`.
        require (recipient == accountOne || recipient == accountTwo, "You don't own this account!");

        //Define a `require` statement that checks if the `balance` is sufficient to accomplish the withdraw operation. 
        require (address(this).balance >= amount, "Insufficient funds!");

        // Add an `if` statement to check if the `lastToWithdraw` is not equal to (`!=`) to `recipient`. If `lastToWithdraw` is not equal, then set it to the current value of `recipient`.
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }

        // Call the `transfer` function of the `recipient` and pass it the `amount` to transfer as an argument.
        recipient.transfer(amount);

        // Set  `lastWithdrawAmount` equal to `amount`
        lastWithdrawAmount = amount;

        // Call the `contractBalance` variable and set it equal to the balance of the contract by using `address(this).balance` to reflect the new balance of the contract.
        contractBalance = address(this).balance;
    }


    // Define a `public payable` function named `deposit`that stores Ether.
    function deposit() public payable {
        // Modify the contract balance with the deposited amount.
        contractBalance = address(this).balance;
    }

    /*
    Define a `public` function named `setAccounts` that receive two `address payable` that will be allowed to withdraw.
    */
    function setAccounts(address payable account1, address payable account2) public{

        // Set the values of `accountOne` and `accountTwo` to `account1` and `account2` respectively.
        accountOne = account1;
        accountTwo = account2;
    }

    // Add the **default fallback function** so that your contract can store Ether sent from outside the deposit function.
        function() external payable {
    }
}
