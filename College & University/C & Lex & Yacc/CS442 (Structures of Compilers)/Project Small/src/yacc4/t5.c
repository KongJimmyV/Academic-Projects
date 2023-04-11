
int start;
int end;
int inc;
int current;
int c;
int k;

read(start, end, inc);

current = start;
for (current = start; current <= end; current = current + inc) {

    c = (current - 32) * 5/9;
    k = (current + 460) * 5/9;
    
    print(current); printspaces(1);
    print(c); printspaces(1);
    print(k); printlines(1);
}
