__attribute__((noinline))
static void use(const char *s)
{
    asm volatile (""
            : "=r" (s)
            : "r" (s));
}

void func_b(void)
{
    use("b_before");
    use("A long string that will be merged");
    use("b_after");
}
