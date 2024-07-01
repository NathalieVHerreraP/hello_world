import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Bool "mo:base/Bool";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Result "mo:base/Result";

actor {
  type Student = {
    id : Text;
    firstName : Text;
    lastName : Text;
    age : Nat;
    active : Bool;
  };

  var students = HashMap.HashMap<Text, Student>(5, Text.equal, Text.hash);

  public func setStudent(nId : Text, nFirstName : Text, nLastName : Text, nAge : Nat, nActive : Bool) : async () {
    var newStudent : Student = {
      id = nId;
      firstName = nFirstName;
      lastName = nLastName;
      age = nAge;
      active = nActive;
    };
    students.put(nId, newStudent);
  };

  public query func getStudent(id : Text) : async ?Student {
    return students.get(id);
  };

  public query func getAllStudents() : async [(Text, Student)] {
    return Iter.toArray<(Text, Student)>(students.entries());
  };

  public func updateStudent(eId : Text, eFirstName : Text, eLastName : Text, eAge : Nat, eActive : Bool) : async Result.Result<Text, Text> {
    var studentExists : ?Student = students.get(eId);

    switch (studentExists) {
      case (null) {
        return #err("No existe el alumno");
      };
      case (?st) {
        var editStudent : Student = {
          id = eId;
          firstName = eFirstName;
          lastName = eLastName;
          age = eAge;
          active = eActive;
        };

        ignore students.replace(eId, editStudent);
        return #ok("Actualizado éxitoso");
      };
    };
  };

  public func deleteStudent(dId : Text) : async Result.Result<Text, Text> {
    let studentExists : ?Student = students.get(dId);

    switch (studentExists) {
      case (null) {
        return #err("No existe el alumno");
      };
      case (?st) {
        students.delete(dId);
        return #ok("Eliminado éxitoso");
      };
    };
  };

};
