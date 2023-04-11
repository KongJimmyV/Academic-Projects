
int numbers[30];

int readNums() {
    int i;
    int count;
    read(count);
    i = 0;
    while (i < count) {
        read(numbers[i]);
        i = i + 1;
    }
    return count;
}

void sort(int size) {
    int i;
    int jj;
    int temp;
    i = 1;
    while (i < size) {
        jj = i-1;
        temp = numbers[i];
        while (jj >= 0 && numbers[jj] < temp) {
            numbers[jj+1] = numbers[jj];
            jj = jj - 1;
        }
        numbers[jj+1] = temp;
        i = i + 1;
    }
    return;
}

void printNums(int size) {
    int i;
    printlines(2);
    for (i = 0; i < size; i = i + 1) {
        print(numbers[i]); printspaces(1);
    }
    printlines(2);
    return;
}



int count;
count = readNums();
sort(count);
printNums(count);
