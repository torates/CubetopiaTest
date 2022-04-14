import Principal "mo:base/Principal";
import Iter "mo:base/Iter";
import HashMap "mo:base/HashMap";
import Island "island";
import Types "types";
import NFT "nft";
import Cycles "mo:base/ExperimentalCycles";

actor class map(admin : Principal) {
  let _admin : Principal = admin; 


  type Island = Island.Island;
  type Block = Types.Block;

  let nftcan : NFT.Self = actor "aapup-qaaaa-aaaah-abbnq-cai";
  

  private stable var _registryState : [(Principal, Island)] = [];
  private var _registry : HashMap.HashMap<Principal, Island> = HashMap.fromIter(_registryState.vals(), 0, Principal.equal, Principal.hash);



  public shared(msg) func generateIsland(user : Principal) : async Island {
    (assert msg.caller == _admin);
    switch (await nftcan.getNftsByUser(user)) {
      case true {
        let cycleShare = 1_000_000_000_000;
        Cycles.add(cycleShare);
        let island = await Island.Island(user);
        _registry.put(user, island);
        return island;
      };
    };

  };


  public query func numberofIslands() : async Nat {
    return _registry.size();
  };

/* 
  public shared(msg) func putBlock(block : Block) : async Block {
    switch (_registry.get(msg.caller)) {
      case (?island) {
        await island.addBlock(block);
      };
      case (_) {
        let nullblock : Block = {
          color = "No color";
          size = false;
        };
        return nullblock;
      };
    };

  }; */
  
  

  //system funcs
  system func preupgrade() {
    _registryState := Iter.toArray(_registry.entries());
  };
  system func postupgrade() {
    _registryState := [];
  };



};
