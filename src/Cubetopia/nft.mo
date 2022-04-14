module {
  public type AccountIdentifier = Text;
  public type AccountIdentifier__1 = Text;
  public type AllowanceRequest = {
    token : TokenIdentifier;
    owner : User;
    spender : Principal;
  };
  public type ApproveRequest = {
    token : TokenIdentifier;
    subaccount : ?SubAccount;
    allowance : Balance;
    spender : Principal;
  };
  public type Balance = Nat;
  public type BalanceRequest = { token : TokenIdentifier; user : User };
  public type BalanceResponse = { #ok : Balance; #err : CommonError__1 };
  public type Balance__1 = Nat;
  public type CommonError = { #InvalidToken : TokenIdentifier; #Other : Text };
  public type CommonError__1 = {
    #InvalidToken : TokenIdentifier;
    #Other : Text;
  };
  public type Extension = Text;
  public type HeaderField = (Text, Text);
  public type HttpRequest = {
    url : Text;
    method : Text;
    body : [Nat8];
    headers : [HeaderField];
  };
  public type HttpResponse = {
    body : [Nat8];
    headers : [HeaderField];
    streaming_strategy : ?StreamingStrategy;
    status_code : Nat16;
  };
  public type Memo = [Nat8];
  public type Metadata = {
    #fungible : {
      decimals : Nat8;
      metadata : ?[Nat8];
      name : Text;
      symbol : Text;
    };
    #nonfungible : { metadata : ?[Nat8] };
  };
  public type MintRequest = { to : User; metadata : ?[Nat8] };
  public type Result = { #ok : Balance__1; #err : CommonError };
  public type Result_1 = { #ok : Metadata; #err : CommonError };
  public type Result_2 = { #ok : AccountIdentifier__1; #err : CommonError };
  public type StreamingCallbackHttpResponse = {
    token : ?StreamingCallbackToken;
    body : [Nat8];
  };
  public type StreamingCallbackToken = {
    key : Text;
    sha256 : ?[Nat8];
    index : Nat;
    content_encoding : Text;
  };
  public type StreamingStrategy = {
    #Callback : {
      token : StreamingCallbackToken;
      callback : shared query StreamingCallbackToken -> async StreamingCallbackHttpResponse;
    };
  };
  public type SubAccount = [Nat8];
  public type TokenIdentifier = Text;
  public type TokenIdentifier__1 = Text;
  public type TokenIndex = Nat32;
  public type TransferRequest = {
    to : User;
    token : TokenIdentifier;
    notify : Bool;
    from : User;
    memo : Memo;
    subaccount : ?SubAccount;
    amount : Balance;
  };
  public type TransferResponse = {
    #ok : Balance;
    #err : {
      #CannotNotify : AccountIdentifier;
      #InsufficientBalance;
      #InvalidToken : TokenIdentifier;
      #Rejected;
      #Unauthorized : AccountIdentifier;
      #Other : Text;
    };
  };
  public type User = { #principal : Principal; #address : AccountIdentifier };
  public type Self = actor {
    acceptCycles : shared () -> async ();
    allowance : shared query AllowanceRequest -> async Result;
    approve : shared ApproveRequest -> async ();
    availableCycles : shared query () -> async Nat;
    balance : shared query BalanceRequest -> async BalanceResponse;
    bearer : shared query TokenIdentifier__1 -> async Result_2;
    extensions : shared query () -> async [Extension];
    getAllowances : shared query () -> async [(TokenIndex, Principal)];
    getNftsByUser : shared Principal -> async [TokenIndex];
    getRegistry : shared query () -> async [(TokenIndex, AccountIdentifier__1)];
    getTokens : shared query () -> async [(TokenIndex, Metadata)];
    http_request : shared query HttpRequest -> async HttpResponse;
    inc : shared () -> async Nat;
    metadata : shared query TokenIdentifier__1 -> async Result_1;
    mintNFT : shared MintRequest -> async TokenIndex;
    setMinter : shared Principal -> async ();
    supply : shared query TokenIdentifier__1 -> async Result;
    toBytes : shared Text -> async [Nat8];
    tokenIdentifier : shared (Text, TokenIndex) -> async TokenIdentifier__1;
    transfer : shared TransferRequest -> async TransferResponse;
  }
}