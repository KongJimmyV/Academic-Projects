
int fib(int n) {
    if (n <= 1) {
        return 1;
    }
    return fib(n-2) + fib(n-1);
}





int x;
read(x);
print(fib(x)); printspaces(1);
print(fib(2*x)); printlines(1);
