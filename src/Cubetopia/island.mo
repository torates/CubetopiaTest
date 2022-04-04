import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";


actor class Island(owner : Principal) {
    //all the info of the island

    let _owner : Principal = owner;

    type Block = {
        color : Text; //could also create color type with 3 nats representing rgb(r, g, b)
        size : Bool; //true for big false for small, could also be text
    };

    type User = {
        princ : Principal; //unique principal identifier
        permission : Text; //user, admin, mod, owner... etc
    };

    var blocksAdded : [(Principal, Block)] = [];
    private var _blocksAdded : HashMap.HashMap<Principal, Block> = HashMap.fromIter(blocksAdded.vals(), 0, Principal.equal, Principal.hash);
    
    public shared(msg) func addBlock(thisblock : Block) : async Block { //returns the added Block object
        _blocksAdded.put(msg.caller, thisblock);
        return thisblock;
    };

    public query func getBlocksAdded() : async Nat { //queries the total no. of added blocks
        return _blocksAdded.size();
    };

    
}; 