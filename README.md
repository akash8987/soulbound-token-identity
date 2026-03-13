# Soulbound Token Identity (SBT)

This repository provides a professional implementation of Soulbound Tokens (EIP-5192 compliant). SBTs are permanent, non-transferable NFTs that represent a person's identity, skills, or affiliations.

### Key Features
* **Non-Transferable:** Overrides the `transferFrom` and `safeTransferFrom` functions to prevent tokens from being moved once issued.
* **Verifiable Credentials:** Ideal for academic degrees, KYC status, or DAO participation history.
* **Revocable:** Includes logic for the issuer to burn or revoke a token if the credential becomes invalid.
* **EIP-5192 Support:** Implements the `Locked` and `Unlocked` events for marketplace and wallet compatibility.

### Use Cases
1. **Proof of Attendance:** Badges that cannot be sold or traded.
2. **Reputation Scores:** Credit scores that stay with the user's address.
3. **Governance Rights:** Voting power tied to specific achievements rather than liquid capital.

### Technical Note
The contract uses a "locking" mechanism. By default, all minted tokens are initialized in a locked state, making them "Soulbound" to the initial recipient.
