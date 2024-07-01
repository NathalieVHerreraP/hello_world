import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Bool "mo:base/Bool";
import Int "mo:base/Int";
import Float "mo:base/Float";
import HashMap "mo:base/HashMap";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Result "mo:base/Result";

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
type Day = {
    #Monday;
    #Tuesday;
    #Wednesday;
    #Thursday;
    #Friday;
    #Saturday;
    #Sunday;
};

type NameError = {
    #emptyValue;
    #customError : Text;
};

//If
public query func nameNew(name : Text) : async Result.Result<Text, NameError> {
    if (Text.equal(name, "")) {
        return #err(#customError "Introduce un valor no vacio");
    } else {
        return #ok(name);
    };
};

//switch
let day : Day = #Monday;

switch (day) {
    case (#Monday) {
        return ("Today is Monday");
    };
    case (#Tuesday) {
        return ("Today is Tuesday");
    };
    case (#Wednesday) {
        return ("Today is Wednesday");
    };
    case (#Thursday) {
        return ("Today is Thursday");
    };
    case (#Friday) {
        return ("Today is Friday");
    };
    case (#Saturday) {
        return ("Today is Saturday");
    };
    case (#Sunday) {
        return ("Today is Sunday");
    };
};

let nameCase : ?Text = null;

switch (nameCase) {
    case (null) {
        return null;
    };
    case (?n) {
        return n;
    };
};

//While
var count : Nat = 0;

while (count < 10) {
    count += 1;
};

//for
var c : Nat = 0;

for (i in Iter.range(0, 10)) {
    c += 1;
};

var mapI = HashMap.HashMap<Text, Nat>(1, Text.equal, Text.hash);

mapI.put("Key1", 1);
mapI.put("Key2", 2);
mapI.put("Key3", 3);

for ((key, value) in mapI.entiries()) {
    pairs := "(" # key # ", " # Nat.toText(value) # ") " # pairs;
};
