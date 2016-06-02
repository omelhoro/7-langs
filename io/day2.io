//1
fib_loop := method(n,coll,
    if((coll size)==n or n<2, 
    coll last, 
    fib_loop(n,coll append (coll slice(-2) sum))))
fib_loop_for := method(n,coll, while((coll size)<n,coll = coll append (coll slice(-2) sum)); coll last)
fib :=method(n,fn, fn(n,list(1,1)))
fib_loop(8,list(1,1))
fib_loop_for(8,list(1,1))

//2
Number divz := method(n,n println;call target println; if(n==0,0,(call target) / n))
5 / 1
5 divz(0)

//3
two_ar :=list(list(1,2,3),list(5,2,3))
two_ar reduce(a,l,a+ l sum,0)
rec_sum := method(l, if(l at(0) type != List type, l sum, l reduce(a,l,a + rec_sum(l),0)))
rec_sum(two_ar)

//4
List myAverage := method(l := call target;
    l println;
    l reduce(a,x,if(x type!=Number type,Exception raise("not a number"),a + x) ,0)/ l size)
av_ar := list(1,"a",3,4,5)
av_ar average
av_ar myAverage

//5
TwoDim := List clone
TwoDim content ::= list()
TwoDim get := method(x,y, call target content at(x) at(y))
TwoDim set := method(x,y,value, call target content at(x) atPut(y,value))
TwoDim dim := method(x,y,call target content := Range setRange(1,x,1) map(i, list()  setSize(y)))
dim_ar := TwoDim clone 
dim_ar dim(3,5)
dim_ar set(1,1,9)
dim_ar set(0,1,3)
dim_ar content
dim_ar get(1,1)

//6
TwoDim transpose := method(
    xsize := call target content at(0) size - 1;
    ysize := call target content size -1 ;
    l := TwoDim clone;
    l dim(xsize+1,ysize+1);
    l content println;
    Range setRange(0,ysize,1)
        map(x,x println;Range(0,xsize,1) 
            map(y,y println ; l set(y,x,call target get(x,y))));l content )
dim_ar transpose

//7
dim_ar := list(list(1,2,3),list(4,5,6))
File writeMatrix := method(m,del, m foreach(i,l, call target write(l join(del),"\n")))
File readMatrix := method(del, call target readLines map(l, l split(del)))
file := File clone open("matrix.csv")
file readMatrix(",")
file writeMatrix(dim_ar,",")
file close

//8
GuessRandGame := Object clone
GuessRandGame start := method(
    x := Random value(100) ceil;
    n := 0;   
    while(n < 10,
        g := ReadLine readLine asNumber;
        if(g==x, n=11;"Correct" println,
            if(g<x ,"Higher" println, "Lower" println))))
game := GuessRandGame clone
game start    

//8.1
GuessRandGame := Object clone
GuessRandGame start := method(
    x := Random value(100) ceil;
    n := 0;   
    distGuess := 0; 
    x println;
    while(n < 10,
        g := ReadLine readLine asNumber;
        curGuess := (g - x) abs;
        distGuess println;
        curGuess println;
        if(g == x ,"Correct" println;n=11, if(distGuess > curGuess,"Hotter" println,"Colder" println));
        distGuess = curGuess;
        n=n+1;
))
game := GuessRandGame clone
game start    
