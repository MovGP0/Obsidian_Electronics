---
title: Groups
---
**Groups** collect existing schematic objects so KiCad can select and move them as a unit. A group does not create electrical connectivity.
```lisp
(group "USB"
	(uuid "14475548-72e6-4695-96e3-de951e852b4f")
	(members "05521d09-16f8-4cb8-875b-8385f13c7b75" "0c0e42c7-6733-4cdd-8372-9f07dd1f0e7c")
)
```

## Group element

| Field     | Type   | Description                                      |
| --------- | ------ | ------------------------------------------------ |
| name      | string | Group name; may be empty                         |
| `uuid`    | uuid   | Unique identifier for this group                 |
| `members` | list   | UUIDs of schematic objects belonging to the group |

## Members

The `members` list references other schematic elements by UUID. In `ctLab.kicad_sch`, groups contain items such as [[wire]], [[junction]], [[no_connect]], [[label]], and [[symbol]] instances.

```lisp
(members "0690dc9d-3420-4549-9a84-961b706dc590" "08090d33-0036-41cf-89ca-64c516c20eb1")
```

## Naming

Groups can be named, such as `"USB"`, or unnamed with an empty string. Use a name when the group represents a meaningful schematic area or repeated functional block.

## Notes

The official shared S-expression documentation describes group identity as `(id UUID)`, while the inspected KiCad schematic stores groups with `(uuid "...")`. Follow the form emitted by the KiCad version used by the project.

## Related

- [[wire]]
- [[junction]]
- [[label]]
- [[no_connect]]
- [[symbol]]
