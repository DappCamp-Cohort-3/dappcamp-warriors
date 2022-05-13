# DappCamp Warriors

## Create ERC20

### Overview

We already scaffolded the project.

Now, it's time to create our fungible token: **$CAMP**.

We will try and implement an ERC20 contract that implements the [ERC20](https://ethereum.org/es/developers/docs/standards/tokens/erc-20/) standard. We will also later switch to a more secure implementation using OpenZeppelin.

The contract in OpenZeppelin could be as simple as this:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Camp is ERC20 {
    constructor() ERC20("Camp", "CAMP") {}
}
```

But we will add some extra magic to have more control over the supply, determining who can mint it and who can burn it.

Go to [Camp.sol](contracts/Camp.sol) to see the explained implementation.
