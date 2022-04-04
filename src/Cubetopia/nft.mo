module {
  public type TokenId = Nat;
  public type Self = actor {
    approve : shared (Principal, TokenId) -> async ();
    balanceOf : shared Principal -> async ?Nat;
    getApproved : shared Nat -> async Principal;
    isApprovedForAll : shared (Principal, Principal) -> async Bool;
    mint : shared (Principal, Text) -> async Nat;
    name : shared query () -> async Text;
    ownerOf : shared TokenId -> async ?Principal;
    owns : shared Principal -> async Bool;
    setApprovalForAll : shared (Principal, Bool) -> ();
    symbol : shared query () -> async Text;
    tokenURI : shared query TokenId -> async ?Text;
    transferFrom : shared (Principal, Principal, Nat) -> ();
  }
}