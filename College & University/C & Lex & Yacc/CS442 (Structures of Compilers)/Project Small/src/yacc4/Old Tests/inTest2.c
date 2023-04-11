int x; 
int y; 
int c;
int aa(int i, int z, int t) {
    int a;
    int b1;
    a = i+z; 
    b1 = i * z; 
    print(i); printlines(1);
    print(z); printlines(1);
    print(i+z); printlines(1);
    print(a); printlines(1);
    print(b1); printlines(1);
    print(x); printlines(1);
    print(y); printlines(1);
    x = b1; 
    return 2000;
} 

x = 10;
y = 20;
c = 40;
print(aa(x,y,c)*2); printlines(1);

print(x); printlines(1);
