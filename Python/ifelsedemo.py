
a=int(input("Give first value:"))
b=int(input("Give second value:"))
c=int(input("Give third value:"))

if a>b and a>c:
    print(str(a)+" is greater")
elif b>a and b>c:
    print(str(b)+" is greater")
else:
    print(str(c)+" is greater")