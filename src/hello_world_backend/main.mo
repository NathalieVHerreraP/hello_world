import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Bool "mo:base/Bool";
import Int "mo:base/Int";
import Float "mo:base/Float";
import HashMap "mo:base/HashMap";
import Array "mo:base/Array";

actor {
  //Dia 2
  //tipos de datos
  var myBool : Bool = true;
  var myInt : Int = 0;
  var myFloat : Float = 0.00;
  var age : Nat = 0;
  var name : Text = "Joe Doe";

  //Query -> lectura -> tarda menos en procesar
  public func setName(n : Text) : async () {
    name := n;
  };

  //Update -> escritura -> tarda mas en procesar
  public query func getName() : async Text {
    return name;
  };

  //Dia 3
  let name2 : ?Text = ?"OtroNombre";
  let age2 : ?Nat = null;

  //Arrays
  let myArray : [Nat] = [1, 2, 8];
  let arrayElement = myArray[0];

  //Tupla
  let myTuple : (Nat, Text) = (1, "Algo");
  let algo : Text = myTuple.1;

  //HashMAp
  var map = HashMap.HashMap<Text, Nat>(5, Text.equal, Text.hash);
  let mapSize = map.size();
  map.put("Ness", 25);
  map.put("Livy", 23);
  let ness : ?Nat = map.get("Ness");

  //Record (parecido a un JSON/Objeto)
  //tipo perosnalizado, como una interfaz en TS
  type Person = {
    name : Text;
    age : Nat;
  };

  //Crear tipos para usar dentro de otros wow
  type Professor = {
    name : Text;
  };

  type Subject = {
    name : Text;
    professors : [Professor];
  };

  type Student = {
    id : Text;
    firstName : Text;
    lastName : Text;
    age : Nat;
    active : Bool;
  };

  var persons = HashMap.HashMap<Text, Person>(2, Text.equal, Text.hash);

  let gerardo : Person = {
    name = "Gerardo";
    age = 24;
  };

  let luis : Person = {
    name = "Luis";
    age = 21;
  };

  persons.put("gerardo", gerardo);
  persons.put("luis", luis);

  public query func getPerson(name : Text) : async ?Person {
    return persons.get(name);
  };

  public func setPerson(index : Text, newName : Text, newAge : Nat) : async () {
    let newPerson : Person = {
      name = newName;
      age = newAge;
    };
    persons.put(index, newPerson);
  };

  //Dia 4

};
