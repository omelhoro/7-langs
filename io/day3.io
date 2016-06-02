//1
/*
Builder := Object clone
Builder forward := method(
    args := call message arguments;
    mess := call message;
    ind := if(mess hasSlot("ind"), mess getSlot("ind"),0) ;
    writeln("\t" repeated(ind) ,"<",mess name,">")
    args foreach(arg,
        arg ind := ind +1;
        content := self doMessage(arg);
        if(content type == "Sequence", writeln("\t" repeated(ind) ,content)))
    writeln("\t" repeated(ind),"</", mess name,">"))
Builder ul(li("Io"),li("Lua"),li("JS"))
*/
//2

OperatorTable addAssignOperator(":","atPutNumber")
curlyBrackets := method(
    r := Map clone;
    call message arguments foreach(arg,
        r doMessage(arg)
        )
)
Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
))
s := File with("phonebook.txt") openForReading contents
//a := { "igor" : "123324","baby" : "534543" }
phoneNumbers := doString(s)
//phoneNumbers keys println
//phoneNumbers values println
//2.1
/*
curlyBrackets := method(
    l := List clone;
    call message arguments foreach(arg,
        l := l append(arg))
)
{1,2,3,4,4}
*/
//1

Builder := Object clone
Builder forward := method(
    args := call message arguments;
    mess := call message;
    a := if(args size >0, doMessage(args at(0)),"");
    args = if(a type == Map type,args rest, args);
    ind := if(mess hasSlot("ind"), mess getSlot("ind"),0);
    writeln(
        "\t" repeated(ind),
        "<",mess name,
        if(a type == Map type, a foreach(k,v,
            write(" ",k,"=",v asSimpleString," ")),""),
        ">")
    args foreach(arg,
        arg ind := ind +1;
        content := self doMessage(arg);
        if(content type == "Sequence", writeln("\t" repeated(ind) ,content)))
    writeln("\t" repeated(ind),"</", mess name,">"))
x := File with("xml-io.txt") openForReading contents
xml := Builder doString(x)
//TODO: Prints  nil, when item has attributes and text
