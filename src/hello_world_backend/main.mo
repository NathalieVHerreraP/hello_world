import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Bool "mo:base/Bool";
import Int "mo:base/Int";
import Float "mo:base/Float";

actor {
  var myBool : Bool = true;
  var myInt : Int = 0;
  var myFloat : Float = 0.00;
  var age : Nat = 0;
  var name : Text = "Joe Doe";

  //Query -> lectura -> tarda menos en procesar
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  //Update -> escritura -> tarda mas en procesar
  public func setName(n : Text) : async () {
    age := age + 1;
    name := n;
  };
};
