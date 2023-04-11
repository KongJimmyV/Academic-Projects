
int numbers[30];
int count;
int i;
int jj;
int temp;

read(count);
i = 0;
while (i < count) {
    read(numbers[i]);
    i = i + 1;
}

i = 1;
while (i < count) {
    jj = i-1;
    temp = numbers[i];
    while (jj >= 0 && numbers[jj] < temp) {
        numbers[jj+1] = numbers[jj];
        jj = jj - 1;
    }
    numbers[jj+1] = temp;
    i = i + 1;
}

printlines(2);
for (i = 0; i < count; i = i + 1) {
    print(numbers[i]); printspaces(1);
}
printlines(1);
