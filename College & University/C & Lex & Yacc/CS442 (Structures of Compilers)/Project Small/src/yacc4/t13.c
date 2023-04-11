
int fact(int n) {
    if (n <= 1) {
        return 1;
    }
    return n * fact(n-1);
}





int x;
read(x);
print(fact(x)); printspaces(1);
print(2*fact(2*x)); printlines(1);
