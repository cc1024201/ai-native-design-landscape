# Chipster

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Chipster joins model-generated hardware source to conventional verification and physical design. Its implemented digital path searches examples generates Verilog verifies with Icarus and can continue through a modified OpenLane flow to GDSII.

## Separate generators converge on fabrication artifacts

At commit [`ec3905b`](https://github.com/adeirman46/Chipster/tree/ec3905b0d16e440452a7e21ac7742b04d2d8d9c2) the repository includes Streamlit entry points RAG indexes generated RTL verification products OpenLane setup and sample `.mag` standard cells. The digital generator loops failed RTL back through the agent before physical design; the standard-cell generator produces editable Magic layout source from text.

```text
prompt + retrieved examples -> Verilog / MAG source -> Icarus / Magic checks
                                  |                       |
                                  +---- repair loop <-----+
                                  -> OpenLane -> GDSII
```

The repository labels analog generation under construction and photonics as future work. Those are not counted as implemented capabilities. Included examples demonstrate the digital and standard-cell paths but do not constitute foundry sign-off.

The README identifies a Bandung Institute of Technology development team and a University of Michigan/Brown mentor; the implementing team is attributed to Indonesia.

## Evidence

- [Pinned README and scope labels](https://github.com/adeirman46/Chipster/blob/ec3905b0d16e440452a7e21ac7742b04d2d8d9c2/README.md)
- [Digital generator source](https://github.com/adeirman46/Chipster/tree/ec3905b0d16e440452a7e21ac7742b04d2d8d9c2/src)
- [Generated chip evidence](https://github.com/adeirman46/Chipster/tree/ec3905b0d16e440452a7e21ac7742b04d2d8d9c2/examples/generated_chips)
