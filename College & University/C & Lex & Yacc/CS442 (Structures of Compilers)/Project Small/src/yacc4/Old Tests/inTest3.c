int i; 
int k; 
int x; 
int y; 

int f1() { 
 return k*(y+3); 
} 

void aa(int i, int z) {
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
} 

k = 10; 
y = 20; 
print(f1()); printlines(1);
i = 2*f1()*2; 
print(i); printlines(1);

x = 10;
y = 20;

aa(x,y);

print(x); printlines(1);
