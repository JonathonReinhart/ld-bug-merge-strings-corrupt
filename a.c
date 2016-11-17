__attribute__((noinline))
static void use(const char *s)
{
    asm volatile (""
            : "=r" (s)
            : "r" (s));
}

void func_a(void)
{
    use("a_before");
    use("A long string that will be merged");
    use("a_after");
}
