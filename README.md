Bank Tech Test
==============


* A simple bank app that can be interacted with via IRB or another ruby alternative.
* Written in Ruby using a TDD approach. The app is capable of creating new accounts in addition to depositing and withdrawing into specific accounts.
* The app is able to output a simple statement of transactions for each account. The columns include date, credit, debit and balance after transaction.

## Quick Start

The app is interacted via a ruby REPL. The following instructions are a simple method to start.

* Open console/terminal and navigate to root of the app.
* start IRB/equivalent with:  'irb -r ./app/app.rb'
* create a new bank instance: 'your_bank = Bank.new'
* create a new account within the bank: 'your_bank.new_account' // new account is now created with a unique account number (11_111_111)
* deposit into the new account: your_bank.deposit(11_111_111, 50) // args = (account_number, value of deposit)
* withdraw from account: your_bank.withdraw(11_111_111, 30) // args = (account_number, value of deposit)
* see statement of account: your_bank.statement(11_111_111)

### Notes on functionality

There are two additional features beyond the specification:

* account cannot have a balance below overdraft limit (fixed to zero)
* each account has a unique 8 digit account number

Each feature is not required but, especially with the latter, makes changing/growing the app significantly easier.

The app was developed using test driven design and has 100% coverage. The app is mostly adhering to single responsibility with the potential exception of the recording transaction could arguable be re-factored into its own class. As code for this feature is 4 lines I decided against it. Ultimately it would be pushed to a model if the app was further developed.

The statement is in the following format:

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00```

The basic output made it difficult to output the results with two decimals without occurring an error due to implicit conversion when a variable was null credit on debit or vice versa. I therefore used an if statement logic. The alternative was to change the variables format in the Account object but I felt that this was not its responsibility. Ultimately if the specification wasn't demanding output in that format, or through the REPL, I would of refactored to record type of transaction and move the responsibility of display to the CSS rather than using logic statements. 
