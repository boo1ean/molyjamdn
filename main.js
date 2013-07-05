var Game = {}

Game.Person = (function() {
    var Person = function Person(name, age) {
        this.name = name;
        this.age  = age;
    };

    Person.prototype.getAge = function() {
        return this.age;
    }

    Person.prototype.getName = function() {
        return this.name;
    }

    return Person;
})();

Game.Student = (function() {
    var Student = function(name, age, year) {
        Student.prototype.constructor.apply(this, arguments);
        this.year = year;
    }

    // Extends
    Student.prototype = new Game.Person;

    Student.prototype.getYear = function() {
        return this.year;
    }

    Student.prototype.getAge = function() {
        return Game.Person.prototype.getAge.apply(this, arguments) + 1;
    }

    return Student;
})();

var person  = new Game.Person("Michael", 52);
var student = new Game.Student("Vasya", 42, 1408);

console.log(student.getAge());
