---
title: Magnetic Tunnel Junction (MJT) SPICE Models from University of Minnesota
---
The University of Minnesota MTJ compact models are self-contained, physics-based SPICE models for magnetic tunnel junctions used in spin-transfer-torque MRAM and related spintronic switching mechanisms.

The model family covers:

| Model | Switching mechanism | Device coverage | Download |
| --- | --- | --- | --- |
| [[STT MTJ SPICE Models]] | Spin-transfer torque | In-plane MTJ, crystalline perpendicular MTJ, interface perpendicular MTJ | [STT_model.zip](http://mtj.umn.edu/STT_model.zip) |
| [[SHE MTJ SPICE Model]] | Spin Hall effect | Perpendicular MTJ plus spin Hall metal | [SHE_model.zip](http://mtj.umn.edu/SHE_model.zip) |
| [[VCMA MTJ SPICE Model]] | Voltage-controlled magnetic anisotropy | Interface perpendicular MTJ with VCMA-assisted switching | [VCMA_model.zip](http://mtj.umn.edu/VCMA_model.zip) |

## Common workflow

1. Open the model-specific `MTJ_write.sp` example.
2. Set the MTJ dimensions and material parameters: `lx`, `ly`, `lz`, `Ms0`, `P0`, `alpha`, `RA0`, and `Tmp0`.
3. Select magnetic anisotropy with `MA`: `MA='0'` for in-plane anisotropy and `MA='1'` for perpendicular anisotropy.
4. Select the initial free-layer state with `ini`: `ini='0'` for parallel and `ini='1'` for antiparallel.
5. Apply voltage or current with the polarity expected by the example: antiparallel-to-parallel switching uses positive bias with `ini='1'`; parallel-to-antiparallel switching uses negative bias with `ini='0'`.
6. Run the transient analysis and inspect the magnetization state variables, write current, switching time, and thermal stability measurements.

The UMN documentation asks users to acknowledge [UMN MTJ SPICE model](http://mtj.umn.edu/) in publications or presentations that use the compact models.

## Source links

- [UMN MTJ downloads](http://mtj.umn.edu/Downloads.html)
- [UMN STT SPICE model documentation](http://mtj.umn.edu/STT.html)
- [UMN SHE SPICE model documentation](http://mtj.umn.edu/SHE.html)
- [UMN VCMA SPICE model documentation](http://mtj.umn.edu/VCMA.html)
- [STT model paper, IEEE Xplore](https://ieeexplore.ieee.org/document/7338407/)
- [SHE model paper, IEEE Xplore](https://ieeexplore.ieee.org/document/8067488/)
- [VCMA model paper, IEEE Xplore](https://ieeexplore.ieee.org/document/8528833/)
- [Magnetic tunnel junction overview](https://en.wikipedia.org/wiki/Magnetic_tunnel_junction)
- [Spin-transfer torque overview](https://en.wikipedia.org/wiki/Spin-transfer_torque)
- [Spin Hall effect overview](https://en.wikipedia.org/wiki/Spin_Hall_effect)
