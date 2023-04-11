
int numbers[30];

int readNums(int nums[]) {
    int i;
    int count;
    read(count);
    i = 0;
    while (i < count) {
        read(nums[i]);
        i = i + 1;
    }
    return count;
}

void sort(int nums[], int size) {
    int i;
    int jj;
    int temp;
    i = 1;
    while (i < size) {
        jj = i-1;
        temp = nums[i];
        while (jj >= 0 && nums[jj] < temp) {
            nums[jj+1] = nums[jj];
            jj = jj - 1;
        }
        nums[jj+1] = temp;
        i = i + 1;
    }
    return;
}

void printNums(int nums[], int size) {
    int i;
    printlines(2);
    for (i = 0; i < size; i++) {
        print(nums[i]); printspaces(1);
    }
    printlines(1);
    return;
}



int count;
int numbers[30];
count = readNums(numbers);
sort(numbers,count);
printNums(numbers,count);
