---
title: Spintronics
---
**Spintronics**, short for *spin electronics*, is an area of electronics that uses not only the electric charge of electrons, but also their **spin**. In normal electronics, a signal is usually represented by charge, current, or voltage. In spintronics, information can also be represented by the magnetic orientation connected to electron spin.

The most important practical result is that electrical resistance can depend on magnetization direction. This allows circuits to store, read, and sometimes process information magnetically while still using normal electrical terminals.

## Required background

For a first understanding, only a few ideas are needed:

- Electrons have electric charge. Moving charge is electric current.
- Electrons also behave like tiny magnetic dipoles. This magnetic property is called spin.
- A magnetic material has many atomic magnetic moments that prefer to align.
- Electrical resistance tells how strongly a component opposes current.
- Quantum effects become important in very thin layers, especially when electrons pass through barriers only a few atoms thick.

Spintronics combines these points in layered nanostructures.

## Electron spin

Spin is an intrinsic property of an electron. It is not literally a small ball rotating around its axis, but it acts as if the electron has a tiny magnetic moment.

In simple circuit-level thinking, the electron spin can be treated as having two useful orientations:

- **spin up**
- **spin down**

The exact direction depends on the chosen reference axis, usually the magnetization direction of a nearby magnetic layer.

In a non-magnetic metal, approximately equal numbers of electrons have both spin orientations. In a ferromagnetic material, such as iron, cobalt, nickel, or certain magnetic alloys, one spin orientation can be favored. This creates **spin polarization**.

## Spin polarization

A current is spin-polarized when more electrons of one spin orientation take part in conduction than the other.

For example, if a current passes through a ferromagnetic layer, the layer can act partly like a spin filter. Electrons whose spin fits the magnetic layer pass more easily than electrons with the opposite spin.

This is important because it connects an electrical quantity, current, with a magnetic quantity, spin direction.

## Magnetoresistance

Magnetoresistance means that the electrical resistance of a material or device changes when the magnetic state changes.

Ordinary magnetoresistance exists in many conductors, but spintronics mainly uses stronger effects in layered structures:

- **GMR**: giant magnetoresistance
- **TMR**: tunnel magnetoresistance

Both effects are based on the same key idea:

> Current flows differently when magnetic layers point in the same direction than when they point in opposite directions.

## Giant magnetoresistance

Giant magnetoresistance uses at least two ferromagnetic layers separated by a thin non-magnetic conductive spacer.

The two important magnetic states are:

- **parallel**: both magnetic layers point in the same direction
- **antiparallel**: the magnetic layers point in opposite directions

In the parallel state, one spin channel can pass through the stack more easily. In the antiparallel state, electrons that pass well through one magnetic layer are scattered more strongly by the other layer. This changes the total resistance.

GMR became very important in hard-disk read heads, because it made it possible to detect very small magnetic fields from tiny magnetic domains on a disk.

## Tunnel magnetoresistance

Tunnel magnetoresistance is similar in concept to GMR, but the middle layer is not a normal conductor. It is a very thin insulator, often magnesium oxide (MgO).

Classically, an electron should not pass through an insulator. At nanometer thickness, quantum mechanics allows electrons to cross the barrier by **tunneling**.

The probability of tunneling depends on the spin state and on the magnetization directions of the magnetic layers. Therefore, the resistance is different for parallel and antiparallel alignment.

TMR is especially important because it is used in magnetic tunnel junctions.

## Magnetic tunnel junction

A **magnetic tunnel junction** (MTJ) is one of the central devices in spintronics.

The basic layer stack is:

```text
fixed magnetic layer
thin tunnel barrier
free magnetic layer
```

The fixed layer keeps its magnetization direction during normal operation. It is also called the pinned or reference layer.

The free layer can switch between two stable directions. These two directions can represent a digital bit:

| Free layer state | Resistance | Stored bit example |
| --- | --- | --- |
| Parallel to fixed layer | Low resistance | 0 |
| Antiparallel to fixed layer | High resistance | 1 |

The assignment of 0 and 1 is a design choice. The important point is that the bit is stored magnetically and read electrically.

See also:

- [[MTJ Compact Model Equations]]
- [[STT MTJ SPICE Models]]
- [[SHE MTJ SPICE Model]]
- [[VCMA MTJ SPICE Model]]
- [[UMN MTJ SPICE Models]]

## Reading an MTJ

To read an MTJ, a small voltage is applied and the resulting current is measured.

Using Ohm's law,

$$
R = \frac{V}{I}
$$

a larger current means lower resistance, and a smaller current means higher resistance.

The read current should be small enough that it does not accidentally switch the free layer. This is similar to reading a memory cell without destroying the stored value.

## Writing an MTJ

The free layer can be switched in different ways.

### Magnetic field switching

Early MRAM concepts used current lines near the cell. The current created a magnetic field, and the magnetic field switched the free layer.

This is easy to understand, but it scales poorly. As memory cells become smaller, it becomes difficult to switch only the selected cell without disturbing neighbors.

### Spin-transfer torque

In **spin-transfer torque** (STT), a spin-polarized current flows through the MTJ. The current transfers angular momentum to the free layer. If the current is large enough, it can rotate the free-layer magnetization and switch the bit.

The word *torque* means a turning effect. In mechanics, a torque can rotate an object. In an MTJ, spin-transfer torque rotates the magnetization direction.

STT is important for STT-MRAM, where the same two-terminal MTJ structure is used for reading and writing.

### Spin-orbit torque

In **spin-orbit torque** (SOT), the write current often flows in a nearby heavy-metal layer instead of directly through the tunnel barrier. Because of spin-orbit coupling, the charge current can generate a spin current. This spin current can exert torque on the free magnetic layer.

SOT devices often use separate read and write paths. This can improve endurance and speed, but the cell usually needs more area than a simple two-terminal STT cell.

### Voltage-controlled magnetic anisotropy

In **voltage-controlled magnetic anisotropy** (VCMA), an electric field changes how strongly the free layer prefers one magnetic direction. VCMA can reduce the energy barrier temporarily, making switching easier.

VCMA is interesting because it aims to reduce write energy. In practice, it is often considered together with another switching mechanism.

## Magnetic anisotropy

Magnetic anisotropy means that a magnetic layer has preferred directions for its magnetization.

For memory, this is necessary. Without preferred directions, the free layer would not reliably stay in one of two states.

Two common cases are:

- **in-plane magnetic anisotropy**: magnetization prefers to lie in the plane of the layer
- **perpendicular magnetic anisotropy**: magnetization prefers to point up or down through the layer

Perpendicular MTJs are important in modern compact memory cells because they can scale better to small dimensions.

## Thermal stability

A memory bit must remain stable even though atoms are always moving thermally.

The stability is often described by an energy barrier between the two magnetic states. If the barrier is high compared with thermal energy, the bit is stable. If it is too low, the free layer may randomly switch.

A useful mental model is a ball in a double valley:

- Each valley is one magnetic state.
- The hill between the valleys is the energy barrier.
- Thermal noise can shake the ball.
- A write operation gives enough energy or torque to move the ball to the other valley.

This is why spintronic memory design has a trade-off:

- A high barrier gives good data retention.
- A low barrier makes writing easier and lower-power.

## MRAM

**MRAM** means magnetic random-access memory. It stores data in magnetic states instead of electric charge stored on a capacitor.

Compared with DRAM or SRAM, the main attraction is non-volatility:

- DRAM loses data without refresh.
- SRAM loses data without supply voltage.
- MRAM can keep data when power is removed.

Other useful properties can include high endurance, fast access, and good radiation tolerance. The exact performance depends strongly on the MRAM type and technology generation.

Important MRAM families include:

- field-switched MRAM
- STT-MRAM
- SOT-MRAM

## Why spintronics is useful

Spintronics is attractive because it can combine storage and electronics in ways that ordinary charge-based devices cannot easily provide.

Important advantages are:

- **non-volatile storage**: information can remain after power is removed
- **electrical readout**: magnetic state can be measured as resistance
- **CMOS compatibility**: MTJ stacks can be integrated with standard control transistors
- **high endurance potential**: no oxide charge storage is needed as in flash memory
- **compact memory cells**: especially with perpendicular MTJs

## Main challenges

Spintronic devices also have limitations.

Important challenges are:

- Write current can still be large.
- Very small magnets are more affected by thermal noise.
- Device variation matters because nanometer-scale layers must be manufactured precisely.
- The read signal must be large enough for reliable sensing.
- Fast switching, low energy, and long retention are competing goals.

In practical circuits, spintronics is therefore not just a physics topic. It also requires device engineering, circuit design, process technology, and reliability analysis.

## Relation to normal electronics

Spintronics does not replace ordinary electronics completely. Instead, it is usually combined with CMOS.

A typical memory cell contains:

- one or more transistors for selection and current control
- one MTJ as the storage element
- peripheral circuits for read sensing, write drivers, addressing, and error handling

The CMOS part moves charge and performs logic control. The spintronic part stores information magnetically.

## Simplified comparison

| Technology | Stored quantity | Volatile? | Typical note |
| --- | --- | --- | --- |
| DRAM | capacitor charge | yes | needs refresh |
| SRAM | latch state | yes | fast, larger cell |
| Flash | charge in floating gate or trap | no | dense, slower writes |
| MRAM | magnetic orientation | no | fast reads and high endurance potential |

## Key terms

| Term | Meaning |
| --- | --- |
| Spin | Intrinsic magnetic property of an electron |
| Spin polarization | Unequal amount of spin-up and spin-down current |
| Ferromagnet | Material with strongly aligned magnetic moments |
| Magnetization | Direction and strength of magnetic ordering |
| Magnetoresistance | Resistance change caused by magnetic state |
| GMR | Resistance change in magnetic/conductive multilayers |
| TMR | Resistance change in magnetic tunnel junctions |
| MTJ | Two magnetic layers separated by a tunnel barrier |
| Free layer | Magnetic layer that stores the bit |
| Fixed layer | Reference magnetic layer |
| STT | Switching by spin-polarized current through the device |
| SOT | Switching by spin current generated through spin-orbit effects |
| VCMA | Electric-field control of magnetic anisotropy |

## Minimal mental model

The shortest useful explanation is:

1. Electron spin acts like a tiny magnet.
2. Magnetic layers can filter or prefer certain spin directions.
3. A layered device can have low or high resistance depending on magnetic alignment.
4. That resistance difference can represent a digital bit.
5. A current or voltage can switch the magnetic state.

This is the core of many spintronic devices.

## Further reading

- [NIST: Spin-transfer torque theory](https://www.nist.gov/programs-projects/theory-spin-transfer-torque)
- [NIST: Spintronics for neuromorphic computing](https://www.nist.gov/programs-projects/spintronics-neuromorphic-computing)
- [NIST: Magnetic random access memory](https://www.nist.gov/programs-projects/magnetic-random-access-memory)
- [National High Magnetic Field Laboratory: Giant magnetoresistance](https://nationalmaglab.org/magnet-academy/read-science-stories/science-simplified/giant-magnetoresistance/)
