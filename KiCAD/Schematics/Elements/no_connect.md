---
title: No Connect
---
**No-connect markers** mark intentionally unused pin endpoints. They tell ERC that the pin is deliberately left open.
```lisp
(no_connect
	(at 109.22 237.49)
	(uuid "05521d09-16f8-4cb8-875b-8385f13c7b75")
)
```

## No-connect element

| Field  | Type  | Description                                              |
| ------ | ----- | -------------------------------------------------------- |
| [[at]] | point | Coordinate of the intentionally unconnected pin endpoint |
| `uuid` | uuid  | Unique identifier for this no-connect marker             |

## Placement

The `at` coordinate must match the transformed symbol pin connection point. Do not place a `no_connect` marker on a wire endpoint; use it only for a pin that has no intended net.

| Case                   | Action                                      |
| ---------------------- | ------------------------------------------- |
| Unused symbol pin      | Place `no_connect` at the pin endpoint      |
| Pin connected by wire  | Do not add `no_connect`                     |
| Pin connected by label | Do not add `no_connect`                     |
| Unknown future use     | Leave undecided or document with a real net |

## ERC meaning

A no-connect marker is not a net and does not create connectivity. It only suppresses the warning for an intentionally open pin.

## Related

- [[symbol|Symbols]]
- [[wire|Wires]]
- [[at|At]]
- [[group]]
