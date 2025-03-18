

## Bochs commands

> To debug the kernel
```
make debug
```

---

### Debugger

`s`: step

`c`: continue

`n`: step over

`u`: Unassemble


### Register
- General Register: `r` | `reg`
- Segement Register: `sreg`
- Control Register: `creg`
- Debug Register: `dreg`
- All Register: `info cpu`

### Break(`b`) Point
- Set Break: `break [mem_addr]`
- Show break points: `info break`

---

### Assembly

`xchg bx, bx`: Magic Break Point

---