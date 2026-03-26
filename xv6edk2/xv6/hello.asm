
_hello:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
    printf(1, "Hello, world!\n");
  11:	83 ec 08             	sub    $0x8,%esp
  14:	68 aa 07 00 00       	push   $0x7aa
  19:	6a 01                	push   $0x1
  1b:	e8 d3 03 00 00       	call   3f3 <printf>
  20:	83 c4 10             	add    $0x10,%esp
    exit();
  23:	e8 57 02 00 00       	call   27f <exit>

00000028 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  28:	55                   	push   %ebp
  29:	89 e5                	mov    %esp,%ebp
  2b:	57                   	push   %edi
  2c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  2d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  30:	8b 55 10             	mov    0x10(%ebp),%edx
  33:	8b 45 0c             	mov    0xc(%ebp),%eax
  36:	89 cb                	mov    %ecx,%ebx
  38:	89 df                	mov    %ebx,%edi
  3a:	89 d1                	mov    %edx,%ecx
  3c:	fc                   	cld
  3d:	f3 aa                	rep stos %al,%es:(%edi)
  3f:	89 ca                	mov    %ecx,%edx
  41:	89 fb                	mov    %edi,%ebx
  43:	89 5d 08             	mov    %ebx,0x8(%ebp)
  46:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  49:	90                   	nop
  4a:	5b                   	pop    %ebx
  4b:	5f                   	pop    %edi
  4c:	5d                   	pop    %ebp
  4d:	c3                   	ret

0000004e <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  4e:	55                   	push   %ebp
  4f:	89 e5                	mov    %esp,%ebp
  51:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  54:	8b 45 08             	mov    0x8(%ebp),%eax
  57:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5a:	90                   	nop
  5b:	8b 55 0c             	mov    0xc(%ebp),%edx
  5e:	8d 42 01             	lea    0x1(%edx),%eax
  61:	89 45 0c             	mov    %eax,0xc(%ebp)
  64:	8b 45 08             	mov    0x8(%ebp),%eax
  67:	8d 48 01             	lea    0x1(%eax),%ecx
  6a:	89 4d 08             	mov    %ecx,0x8(%ebp)
  6d:	0f b6 12             	movzbl (%edx),%edx
  70:	88 10                	mov    %dl,(%eax)
  72:	0f b6 00             	movzbl (%eax),%eax
  75:	84 c0                	test   %al,%al
  77:	75 e2                	jne    5b <strcpy+0xd>
    ;
  return os;
  79:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  7c:	c9                   	leave
  7d:	c3                   	ret

0000007e <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7e:	55                   	push   %ebp
  7f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  81:	eb 08                	jmp    8b <strcmp+0xd>
    p++, q++;
  83:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  87:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  8b:	8b 45 08             	mov    0x8(%ebp),%eax
  8e:	0f b6 00             	movzbl (%eax),%eax
  91:	84 c0                	test   %al,%al
  93:	74 10                	je     a5 <strcmp+0x27>
  95:	8b 45 08             	mov    0x8(%ebp),%eax
  98:	0f b6 10             	movzbl (%eax),%edx
  9b:	8b 45 0c             	mov    0xc(%ebp),%eax
  9e:	0f b6 00             	movzbl (%eax),%eax
  a1:	38 c2                	cmp    %al,%dl
  a3:	74 de                	je     83 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  a5:	8b 45 08             	mov    0x8(%ebp),%eax
  a8:	0f b6 00             	movzbl (%eax),%eax
  ab:	0f b6 d0             	movzbl %al,%edx
  ae:	8b 45 0c             	mov    0xc(%ebp),%eax
  b1:	0f b6 00             	movzbl (%eax),%eax
  b4:	0f b6 c0             	movzbl %al,%eax
  b7:	29 c2                	sub    %eax,%edx
  b9:	89 d0                	mov    %edx,%eax
}
  bb:	5d                   	pop    %ebp
  bc:	c3                   	ret

000000bd <strlen>:

uint
strlen(char *s)
{
  bd:	55                   	push   %ebp
  be:	89 e5                	mov    %esp,%ebp
  c0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  ca:	eb 04                	jmp    d0 <strlen+0x13>
  cc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	01 d0                	add    %edx,%eax
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	75 ed                	jne    cc <strlen+0xf>
    ;
  return n;
  df:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e2:	c9                   	leave
  e3:	c3                   	ret

000000e4 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  e7:	8b 45 10             	mov    0x10(%ebp),%eax
  ea:	50                   	push   %eax
  eb:	ff 75 0c             	push   0xc(%ebp)
  ee:	ff 75 08             	push   0x8(%ebp)
  f1:	e8 32 ff ff ff       	call   28 <stosb>
  f6:	83 c4 0c             	add    $0xc,%esp
  return dst;
  f9:	8b 45 08             	mov    0x8(%ebp),%eax
}
  fc:	c9                   	leave
  fd:	c3                   	ret

000000fe <strchr>:

char*
strchr(const char *s, char c)
{
  fe:	55                   	push   %ebp
  ff:	89 e5                	mov    %esp,%ebp
 101:	83 ec 04             	sub    $0x4,%esp
 104:	8b 45 0c             	mov    0xc(%ebp),%eax
 107:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10a:	eb 14                	jmp    120 <strchr+0x22>
    if(*s == c)
 10c:	8b 45 08             	mov    0x8(%ebp),%eax
 10f:	0f b6 00             	movzbl (%eax),%eax
 112:	38 45 fc             	cmp    %al,-0x4(%ebp)
 115:	75 05                	jne    11c <strchr+0x1e>
      return (char*)s;
 117:	8b 45 08             	mov    0x8(%ebp),%eax
 11a:	eb 13                	jmp    12f <strchr+0x31>
  for(; *s; s++)
 11c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 120:	8b 45 08             	mov    0x8(%ebp),%eax
 123:	0f b6 00             	movzbl (%eax),%eax
 126:	84 c0                	test   %al,%al
 128:	75 e2                	jne    10c <strchr+0xe>
  return 0;
 12a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 12f:	c9                   	leave
 130:	c3                   	ret

00000131 <gets>:

char*
gets(char *buf, int max)
{
 131:	55                   	push   %ebp
 132:	89 e5                	mov    %esp,%ebp
 134:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 137:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 13e:	eb 42                	jmp    182 <gets+0x51>
    cc = read(0, &c, 1);
 140:	83 ec 04             	sub    $0x4,%esp
 143:	6a 01                	push   $0x1
 145:	8d 45 ef             	lea    -0x11(%ebp),%eax
 148:	50                   	push   %eax
 149:	6a 00                	push   $0x0
 14b:	e8 47 01 00 00       	call   297 <read>
 150:	83 c4 10             	add    $0x10,%esp
 153:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 156:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 15a:	7e 33                	jle    18f <gets+0x5e>
      break;
    buf[i++] = c;
 15c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15f:	8d 50 01             	lea    0x1(%eax),%edx
 162:	89 55 f4             	mov    %edx,-0xc(%ebp)
 165:	89 c2                	mov    %eax,%edx
 167:	8b 45 08             	mov    0x8(%ebp),%eax
 16a:	01 c2                	add    %eax,%edx
 16c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 170:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 172:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 176:	3c 0a                	cmp    $0xa,%al
 178:	74 16                	je     190 <gets+0x5f>
 17a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17e:	3c 0d                	cmp    $0xd,%al
 180:	74 0e                	je     190 <gets+0x5f>
  for(i=0; i+1 < max; ){
 182:	8b 45 f4             	mov    -0xc(%ebp),%eax
 185:	83 c0 01             	add    $0x1,%eax
 188:	39 45 0c             	cmp    %eax,0xc(%ebp)
 18b:	7f b3                	jg     140 <gets+0xf>
 18d:	eb 01                	jmp    190 <gets+0x5f>
      break;
 18f:	90                   	nop
      break;
  }
  buf[i] = '\0';
 190:	8b 55 f4             	mov    -0xc(%ebp),%edx
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	01 d0                	add    %edx,%eax
 198:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 19b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 19e:	c9                   	leave
 19f:	c3                   	ret

000001a0 <stat>:

int
stat(char *n, struct stat *st)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1a6:	83 ec 08             	sub    $0x8,%esp
 1a9:	6a 00                	push   $0x0
 1ab:	ff 75 08             	push   0x8(%ebp)
 1ae:	e8 0c 01 00 00       	call   2bf <open>
 1b3:	83 c4 10             	add    $0x10,%esp
 1b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1bd:	79 07                	jns    1c6 <stat+0x26>
    return -1;
 1bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1c4:	eb 25                	jmp    1eb <stat+0x4b>
  r = fstat(fd, st);
 1c6:	83 ec 08             	sub    $0x8,%esp
 1c9:	ff 75 0c             	push   0xc(%ebp)
 1cc:	ff 75 f4             	push   -0xc(%ebp)
 1cf:	e8 03 01 00 00       	call   2d7 <fstat>
 1d4:	83 c4 10             	add    $0x10,%esp
 1d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1da:	83 ec 0c             	sub    $0xc,%esp
 1dd:	ff 75 f4             	push   -0xc(%ebp)
 1e0:	e8 c2 00 00 00       	call   2a7 <close>
 1e5:	83 c4 10             	add    $0x10,%esp
  return r;
 1e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1eb:	c9                   	leave
 1ec:	c3                   	ret

000001ed <atoi>:

int
atoi(const char *s)
{
 1ed:	55                   	push   %ebp
 1ee:	89 e5                	mov    %esp,%ebp
 1f0:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1f3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1fa:	eb 25                	jmp    221 <atoi+0x34>
    n = n*10 + *s++ - '0';
 1fc:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ff:	89 d0                	mov    %edx,%eax
 201:	c1 e0 02             	shl    $0x2,%eax
 204:	01 d0                	add    %edx,%eax
 206:	01 c0                	add    %eax,%eax
 208:	89 c1                	mov    %eax,%ecx
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	8d 50 01             	lea    0x1(%eax),%edx
 210:	89 55 08             	mov    %edx,0x8(%ebp)
 213:	0f b6 00             	movzbl (%eax),%eax
 216:	0f be c0             	movsbl %al,%eax
 219:	01 c8                	add    %ecx,%eax
 21b:	83 e8 30             	sub    $0x30,%eax
 21e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	0f b6 00             	movzbl (%eax),%eax
 227:	3c 2f                	cmp    $0x2f,%al
 229:	7e 0a                	jle    235 <atoi+0x48>
 22b:	8b 45 08             	mov    0x8(%ebp),%eax
 22e:	0f b6 00             	movzbl (%eax),%eax
 231:	3c 39                	cmp    $0x39,%al
 233:	7e c7                	jle    1fc <atoi+0xf>
  return n;
 235:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 238:	c9                   	leave
 239:	c3                   	ret

0000023a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 23a:	55                   	push   %ebp
 23b:	89 e5                	mov    %esp,%ebp
 23d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;

  dst = vdst;
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 246:	8b 45 0c             	mov    0xc(%ebp),%eax
 249:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 24c:	eb 17                	jmp    265 <memmove+0x2b>
    *dst++ = *src++;
 24e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 251:	8d 42 01             	lea    0x1(%edx),%eax
 254:	89 45 f8             	mov    %eax,-0x8(%ebp)
 257:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25a:	8d 48 01             	lea    0x1(%eax),%ecx
 25d:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 260:	0f b6 12             	movzbl (%edx),%edx
 263:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 265:	8b 45 10             	mov    0x10(%ebp),%eax
 268:	8d 50 ff             	lea    -0x1(%eax),%edx
 26b:	89 55 10             	mov    %edx,0x10(%ebp)
 26e:	85 c0                	test   %eax,%eax
 270:	7f dc                	jg     24e <memmove+0x14>
  return vdst;
 272:	8b 45 08             	mov    0x8(%ebp),%eax
}
 275:	c9                   	leave
 276:	c3                   	ret

00000277 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 277:	b8 01 00 00 00       	mov    $0x1,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret

0000027f <exit>:
SYSCALL(exit)
 27f:	b8 02 00 00 00       	mov    $0x2,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret

00000287 <wait>:
SYSCALL(wait)
 287:	b8 03 00 00 00       	mov    $0x3,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret

0000028f <pipe>:
SYSCALL(pipe)
 28f:	b8 04 00 00 00       	mov    $0x4,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret

00000297 <read>:
SYSCALL(read)
 297:	b8 05 00 00 00       	mov    $0x5,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret

0000029f <write>:
SYSCALL(write)
 29f:	b8 10 00 00 00       	mov    $0x10,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret

000002a7 <close>:
SYSCALL(close)
 2a7:	b8 15 00 00 00       	mov    $0x15,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret

000002af <kill>:
SYSCALL(kill)
 2af:	b8 06 00 00 00       	mov    $0x6,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret

000002b7 <exec>:
SYSCALL(exec)
 2b7:	b8 07 00 00 00       	mov    $0x7,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret

000002bf <open>:
SYSCALL(open)
 2bf:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret

000002c7 <mknod>:
SYSCALL(mknod)
 2c7:	b8 11 00 00 00       	mov    $0x11,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret

000002cf <unlink>:
SYSCALL(unlink)
 2cf:	b8 12 00 00 00       	mov    $0x12,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret

000002d7 <fstat>:
SYSCALL(fstat)
 2d7:	b8 08 00 00 00       	mov    $0x8,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret

000002df <link>:
SYSCALL(link)
 2df:	b8 13 00 00 00       	mov    $0x13,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret

000002e7 <mkdir>:
SYSCALL(mkdir)
 2e7:	b8 14 00 00 00       	mov    $0x14,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret

000002ef <chdir>:
SYSCALL(chdir)
 2ef:	b8 09 00 00 00       	mov    $0x9,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret

000002f7 <dup>:
SYSCALL(dup)
 2f7:	b8 0a 00 00 00       	mov    $0xa,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret

000002ff <getpid>:
SYSCALL(getpid)
 2ff:	b8 0b 00 00 00       	mov    $0xb,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret

00000307 <sbrk>:
SYSCALL(sbrk)
 307:	b8 0c 00 00 00       	mov    $0xc,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret

0000030f <sleep>:
SYSCALL(sleep)
 30f:	b8 0d 00 00 00       	mov    $0xd,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret

00000317 <uptime>:
SYSCALL(uptime)
 317:	b8 0e 00 00 00       	mov    $0xe,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret

0000031f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 31f:	55                   	push   %ebp
 320:	89 e5                	mov    %esp,%ebp
 322:	83 ec 18             	sub    $0x18,%esp
 325:	8b 45 0c             	mov    0xc(%ebp),%eax
 328:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 32b:	83 ec 04             	sub    $0x4,%esp
 32e:	6a 01                	push   $0x1
 330:	8d 45 f4             	lea    -0xc(%ebp),%eax
 333:	50                   	push   %eax
 334:	ff 75 08             	push   0x8(%ebp)
 337:	e8 63 ff ff ff       	call   29f <write>
 33c:	83 c4 10             	add    $0x10,%esp
}
 33f:	90                   	nop
 340:	c9                   	leave
 341:	c3                   	ret

00000342 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 342:	55                   	push   %ebp
 343:	89 e5                	mov    %esp,%ebp
 345:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 348:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 34f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 353:	74 17                	je     36c <printint+0x2a>
 355:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 359:	79 11                	jns    36c <printint+0x2a>
    neg = 1;
 35b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 362:	8b 45 0c             	mov    0xc(%ebp),%eax
 365:	f7 d8                	neg    %eax
 367:	89 45 ec             	mov    %eax,-0x14(%ebp)
 36a:	eb 06                	jmp    372 <printint+0x30>
  } else {
    x = xx;
 36c:	8b 45 0c             	mov    0xc(%ebp),%eax
 36f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 372:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 379:	8b 4d 10             	mov    0x10(%ebp),%ecx
 37c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 37f:	ba 00 00 00 00       	mov    $0x0,%edx
 384:	f7 f1                	div    %ecx
 386:	89 d1                	mov    %edx,%ecx
 388:	8b 45 f4             	mov    -0xc(%ebp),%eax
 38b:	8d 50 01             	lea    0x1(%eax),%edx
 38e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 391:	0f b6 91 04 0a 00 00 	movzbl 0xa04(%ecx),%edx
 398:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 39c:	8b 4d 10             	mov    0x10(%ebp),%ecx
 39f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3a2:	ba 00 00 00 00       	mov    $0x0,%edx
 3a7:	f7 f1                	div    %ecx
 3a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3ac:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3b0:	75 c7                	jne    379 <printint+0x37>
  if(neg)
 3b2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3b6:	74 2d                	je     3e5 <printint+0xa3>
    buf[i++] = '-';
 3b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3bb:	8d 50 01             	lea    0x1(%eax),%edx
 3be:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3c1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3c6:	eb 1d                	jmp    3e5 <printint+0xa3>
    putc(fd, buf[i]);
 3c8:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ce:	01 d0                	add    %edx,%eax
 3d0:	0f b6 00             	movzbl (%eax),%eax
 3d3:	0f be c0             	movsbl %al,%eax
 3d6:	83 ec 08             	sub    $0x8,%esp
 3d9:	50                   	push   %eax
 3da:	ff 75 08             	push   0x8(%ebp)
 3dd:	e8 3d ff ff ff       	call   31f <putc>
 3e2:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 3e5:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 3e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3ed:	79 d9                	jns    3c8 <printint+0x86>
}
 3ef:	90                   	nop
 3f0:	90                   	nop
 3f1:	c9                   	leave
 3f2:	c3                   	ret

000003f3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 3f9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 400:	8d 45 0c             	lea    0xc(%ebp),%eax
 403:	83 c0 04             	add    $0x4,%eax
 406:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 409:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 410:	e9 59 01 00 00       	jmp    56e <printf+0x17b>
    c = fmt[i] & 0xff;
 415:	8b 55 0c             	mov    0xc(%ebp),%edx
 418:	8b 45 f0             	mov    -0x10(%ebp),%eax
 41b:	01 d0                	add    %edx,%eax
 41d:	0f b6 00             	movzbl (%eax),%eax
 420:	0f be c0             	movsbl %al,%eax
 423:	25 ff 00 00 00       	and    $0xff,%eax
 428:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 42b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 42f:	75 2c                	jne    45d <printf+0x6a>
      if(c == '%'){
 431:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 435:	75 0c                	jne    443 <printf+0x50>
        state = '%';
 437:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 43e:	e9 27 01 00 00       	jmp    56a <printf+0x177>
      } else {
        putc(fd, c);
 443:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 446:	0f be c0             	movsbl %al,%eax
 449:	83 ec 08             	sub    $0x8,%esp
 44c:	50                   	push   %eax
 44d:	ff 75 08             	push   0x8(%ebp)
 450:	e8 ca fe ff ff       	call   31f <putc>
 455:	83 c4 10             	add    $0x10,%esp
 458:	e9 0d 01 00 00       	jmp    56a <printf+0x177>
      }
    } else if(state == '%'){
 45d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 461:	0f 85 03 01 00 00    	jne    56a <printf+0x177>
      if(c == 'd'){
 467:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 46b:	75 1e                	jne    48b <printf+0x98>
        printint(fd, *ap, 10, 1);
 46d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 470:	8b 00                	mov    (%eax),%eax
 472:	6a 01                	push   $0x1
 474:	6a 0a                	push   $0xa
 476:	50                   	push   %eax
 477:	ff 75 08             	push   0x8(%ebp)
 47a:	e8 c3 fe ff ff       	call   342 <printint>
 47f:	83 c4 10             	add    $0x10,%esp
        ap++;
 482:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 486:	e9 d8 00 00 00       	jmp    563 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 48b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 48f:	74 06                	je     497 <printf+0xa4>
 491:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 495:	75 1e                	jne    4b5 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 497:	8b 45 e8             	mov    -0x18(%ebp),%eax
 49a:	8b 00                	mov    (%eax),%eax
 49c:	6a 00                	push   $0x0
 49e:	6a 10                	push   $0x10
 4a0:	50                   	push   %eax
 4a1:	ff 75 08             	push   0x8(%ebp)
 4a4:	e8 99 fe ff ff       	call   342 <printint>
 4a9:	83 c4 10             	add    $0x10,%esp
        ap++;
 4ac:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4b0:	e9 ae 00 00 00       	jmp    563 <printf+0x170>
      } else if(c == 's'){
 4b5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4b9:	75 43                	jne    4fe <printf+0x10b>
        s = (char*)*ap;
 4bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4be:	8b 00                	mov    (%eax),%eax
 4c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4c3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4cb:	75 25                	jne    4f2 <printf+0xff>
          s = "(null)";
 4cd:	c7 45 f4 b9 07 00 00 	movl   $0x7b9,-0xc(%ebp)
        while(*s != 0){
 4d4:	eb 1c                	jmp    4f2 <printf+0xff>
          putc(fd, *s);
 4d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d9:	0f b6 00             	movzbl (%eax),%eax
 4dc:	0f be c0             	movsbl %al,%eax
 4df:	83 ec 08             	sub    $0x8,%esp
 4e2:	50                   	push   %eax
 4e3:	ff 75 08             	push   0x8(%ebp)
 4e6:	e8 34 fe ff ff       	call   31f <putc>
 4eb:	83 c4 10             	add    $0x10,%esp
          s++;
 4ee:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 4f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f5:	0f b6 00             	movzbl (%eax),%eax
 4f8:	84 c0                	test   %al,%al
 4fa:	75 da                	jne    4d6 <printf+0xe3>
 4fc:	eb 65                	jmp    563 <printf+0x170>
        }
      } else if(c == 'c'){
 4fe:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 502:	75 1d                	jne    521 <printf+0x12e>
        putc(fd, *ap);
 504:	8b 45 e8             	mov    -0x18(%ebp),%eax
 507:	8b 00                	mov    (%eax),%eax
 509:	0f be c0             	movsbl %al,%eax
 50c:	83 ec 08             	sub    $0x8,%esp
 50f:	50                   	push   %eax
 510:	ff 75 08             	push   0x8(%ebp)
 513:	e8 07 fe ff ff       	call   31f <putc>
 518:	83 c4 10             	add    $0x10,%esp
        ap++;
 51b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 51f:	eb 42                	jmp    563 <printf+0x170>
      } else if(c == '%'){
 521:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 525:	75 17                	jne    53e <printf+0x14b>
        putc(fd, c);
 527:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 52a:	0f be c0             	movsbl %al,%eax
 52d:	83 ec 08             	sub    $0x8,%esp
 530:	50                   	push   %eax
 531:	ff 75 08             	push   0x8(%ebp)
 534:	e8 e6 fd ff ff       	call   31f <putc>
 539:	83 c4 10             	add    $0x10,%esp
 53c:	eb 25                	jmp    563 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 53e:	83 ec 08             	sub    $0x8,%esp
 541:	6a 25                	push   $0x25
 543:	ff 75 08             	push   0x8(%ebp)
 546:	e8 d4 fd ff ff       	call   31f <putc>
 54b:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 54e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 551:	0f be c0             	movsbl %al,%eax
 554:	83 ec 08             	sub    $0x8,%esp
 557:	50                   	push   %eax
 558:	ff 75 08             	push   0x8(%ebp)
 55b:	e8 bf fd ff ff       	call   31f <putc>
 560:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 563:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 56a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 56e:	8b 55 0c             	mov    0xc(%ebp),%edx
 571:	8b 45 f0             	mov    -0x10(%ebp),%eax
 574:	01 d0                	add    %edx,%eax
 576:	0f b6 00             	movzbl (%eax),%eax
 579:	84 c0                	test   %al,%al
 57b:	0f 85 94 fe ff ff    	jne    415 <printf+0x22>
    }
  }
}
 581:	90                   	nop
 582:	90                   	nop
 583:	c9                   	leave
 584:	c3                   	ret

00000585 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 585:	55                   	push   %ebp
 586:	89 e5                	mov    %esp,%ebp
 588:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 58b:	8b 45 08             	mov    0x8(%ebp),%eax
 58e:	83 e8 08             	sub    $0x8,%eax
 591:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 594:	a1 20 0a 00 00       	mov    0xa20,%eax
 599:	89 45 fc             	mov    %eax,-0x4(%ebp)
 59c:	eb 24                	jmp    5c2 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 59e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5a1:	8b 00                	mov    (%eax),%eax
 5a3:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 5a6:	72 12                	jb     5ba <free+0x35>
 5a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5ab:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 5ae:	72 24                	jb     5d4 <free+0x4f>
 5b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5b3:	8b 00                	mov    (%eax),%eax
 5b5:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 5b8:	72 1a                	jb     5d4 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5bd:	8b 00                	mov    (%eax),%eax
 5bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5c5:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 5c8:	73 d4                	jae    59e <free+0x19>
 5ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5cd:	8b 00                	mov    (%eax),%eax
 5cf:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 5d2:	73 ca                	jae    59e <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5d7:	8b 40 04             	mov    0x4(%eax),%eax
 5da:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 5e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5e4:	01 c2                	add    %eax,%edx
 5e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e9:	8b 00                	mov    (%eax),%eax
 5eb:	39 c2                	cmp    %eax,%edx
 5ed:	75 24                	jne    613 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 5ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f2:	8b 50 04             	mov    0x4(%eax),%edx
 5f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f8:	8b 00                	mov    (%eax),%eax
 5fa:	8b 40 04             	mov    0x4(%eax),%eax
 5fd:	01 c2                	add    %eax,%edx
 5ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 602:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 605:	8b 45 fc             	mov    -0x4(%ebp),%eax
 608:	8b 00                	mov    (%eax),%eax
 60a:	8b 10                	mov    (%eax),%edx
 60c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60f:	89 10                	mov    %edx,(%eax)
 611:	eb 0a                	jmp    61d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 613:	8b 45 fc             	mov    -0x4(%ebp),%eax
 616:	8b 10                	mov    (%eax),%edx
 618:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 61d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 620:	8b 40 04             	mov    0x4(%eax),%eax
 623:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 62a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62d:	01 d0                	add    %edx,%eax
 62f:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 632:	75 20                	jne    654 <free+0xcf>
    p->s.size += bp->s.size;
 634:	8b 45 fc             	mov    -0x4(%ebp),%eax
 637:	8b 50 04             	mov    0x4(%eax),%edx
 63a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63d:	8b 40 04             	mov    0x4(%eax),%eax
 640:	01 c2                	add    %eax,%edx
 642:	8b 45 fc             	mov    -0x4(%ebp),%eax
 645:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 648:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64b:	8b 10                	mov    (%eax),%edx
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	89 10                	mov    %edx,(%eax)
 652:	eb 08                	jmp    65c <free+0xd7>
  } else
    p->s.ptr = bp;
 654:	8b 45 fc             	mov    -0x4(%ebp),%eax
 657:	8b 55 f8             	mov    -0x8(%ebp),%edx
 65a:	89 10                	mov    %edx,(%eax)
  freep = p;
 65c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65f:	a3 20 0a 00 00       	mov    %eax,0xa20
}
 664:	90                   	nop
 665:	c9                   	leave
 666:	c3                   	ret

00000667 <morecore>:

static Header*
morecore(uint nu)
{
 667:	55                   	push   %ebp
 668:	89 e5                	mov    %esp,%ebp
 66a:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 66d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 674:	77 07                	ja     67d <morecore+0x16>
    nu = 4096;
 676:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	c1 e0 03             	shl    $0x3,%eax
 683:	83 ec 0c             	sub    $0xc,%esp
 686:	50                   	push   %eax
 687:	e8 7b fc ff ff       	call   307 <sbrk>
 68c:	83 c4 10             	add    $0x10,%esp
 68f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 692:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 696:	75 07                	jne    69f <morecore+0x38>
    return 0;
 698:	b8 00 00 00 00       	mov    $0x0,%eax
 69d:	eb 26                	jmp    6c5 <morecore+0x5e>
  hp = (Header*)p;
 69f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6a8:	8b 55 08             	mov    0x8(%ebp),%edx
 6ab:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6b1:	83 c0 08             	add    $0x8,%eax
 6b4:	83 ec 0c             	sub    $0xc,%esp
 6b7:	50                   	push   %eax
 6b8:	e8 c8 fe ff ff       	call   585 <free>
 6bd:	83 c4 10             	add    $0x10,%esp
  return freep;
 6c0:	a1 20 0a 00 00       	mov    0xa20,%eax
}
 6c5:	c9                   	leave
 6c6:	c3                   	ret

000006c7 <malloc>:

void*
malloc(uint nbytes)
{
 6c7:	55                   	push   %ebp
 6c8:	89 e5                	mov    %esp,%ebp
 6ca:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	83 c0 07             	add    $0x7,%eax
 6d3:	c1 e8 03             	shr    $0x3,%eax
 6d6:	83 c0 01             	add    $0x1,%eax
 6d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 6dc:	a1 20 0a 00 00       	mov    0xa20,%eax
 6e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 6e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6e8:	75 23                	jne    70d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 6ea:	c7 45 f0 18 0a 00 00 	movl   $0xa18,-0x10(%ebp)
 6f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f4:	a3 20 0a 00 00       	mov    %eax,0xa20
 6f9:	a1 20 0a 00 00       	mov    0xa20,%eax
 6fe:	a3 18 0a 00 00       	mov    %eax,0xa18
    base.s.size = 0;
 703:	c7 05 1c 0a 00 00 00 	movl   $0x0,0xa1c
 70a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 70d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 710:	8b 00                	mov    (%eax),%eax
 712:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 715:	8b 45 f4             	mov    -0xc(%ebp),%eax
 718:	8b 40 04             	mov    0x4(%eax),%eax
 71b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 71e:	72 4d                	jb     76d <malloc+0xa6>
      if(p->s.size == nunits)
 720:	8b 45 f4             	mov    -0xc(%ebp),%eax
 723:	8b 40 04             	mov    0x4(%eax),%eax
 726:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 729:	75 0c                	jne    737 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 72b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72e:	8b 10                	mov    (%eax),%edx
 730:	8b 45 f0             	mov    -0x10(%ebp),%eax
 733:	89 10                	mov    %edx,(%eax)
 735:	eb 26                	jmp    75d <malloc+0x96>
      else {
        p->s.size -= nunits;
 737:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73a:	8b 40 04             	mov    0x4(%eax),%eax
 73d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 740:	89 c2                	mov    %eax,%edx
 742:	8b 45 f4             	mov    -0xc(%ebp),%eax
 745:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 748:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74b:	8b 40 04             	mov    0x4(%eax),%eax
 74e:	c1 e0 03             	shl    $0x3,%eax
 751:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 754:	8b 45 f4             	mov    -0xc(%ebp),%eax
 757:	8b 55 ec             	mov    -0x14(%ebp),%edx
 75a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 75d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 760:	a3 20 0a 00 00       	mov    %eax,0xa20
      return (void*)(p + 1);
 765:	8b 45 f4             	mov    -0xc(%ebp),%eax
 768:	83 c0 08             	add    $0x8,%eax
 76b:	eb 3b                	jmp    7a8 <malloc+0xe1>
    }
    if(p == freep)
 76d:	a1 20 0a 00 00       	mov    0xa20,%eax
 772:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 775:	75 1e                	jne    795 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 777:	83 ec 0c             	sub    $0xc,%esp
 77a:	ff 75 ec             	push   -0x14(%ebp)
 77d:	e8 e5 fe ff ff       	call   667 <morecore>
 782:	83 c4 10             	add    $0x10,%esp
 785:	89 45 f4             	mov    %eax,-0xc(%ebp)
 788:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 78c:	75 07                	jne    795 <malloc+0xce>
        return 0;
 78e:	b8 00 00 00 00       	mov    $0x0,%eax
 793:	eb 13                	jmp    7a8 <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 795:	8b 45 f4             	mov    -0xc(%ebp),%eax
 798:	89 45 f0             	mov    %eax,-0x10(%ebp)
 79b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79e:	8b 00                	mov    (%eax),%eax
 7a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7a3:	e9 6d ff ff ff       	jmp    715 <malloc+0x4e>
  }
}
 7a8:	c9                   	leave
 7a9:	c3                   	ret
