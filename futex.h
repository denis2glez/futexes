#include <linux/futex.h>
#include <sys/syscall.h>
#include <unistd.h>

// The C runtime doesn't provide a wrapper for the futex(2) syscall, so we roll
// our own.
int futex(int *uaddr, int futex_op, int val, const struct timespec *timeout,
          int *uaddr2, int val3) {
  return syscall(SYS_futex, uaddr, futex_op, val, timeout, uaddr2, val3);
}