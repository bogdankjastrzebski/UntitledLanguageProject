
float foo(float (*fptr)(void *), (void *) y) {
    return fptr(y);
}
