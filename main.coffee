class Person
    constructor: (name, age) ->
        @name = name
        @age  = age

    getAge: ->
        @age

    getName: ->
        @name

class Student extends Person
    constructor: (name, age, year) ->
        super name, age
        @year = year

    getAge: ->
        super() + 1

s = new Student "Name", 10, 1000
console.log s.getAge()
