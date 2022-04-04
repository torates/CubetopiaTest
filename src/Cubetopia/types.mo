module {
    public type Block = {
        color : Text; 
        size : Bool; 
    };

    public type User = {
        princ : Principal; 
        permission : Text; 
    };

    public type Self = actor {
        addBlock : shared (Block) -> async Block;
        getBlocksAdded : shared query () -> async Nat;
  };
}