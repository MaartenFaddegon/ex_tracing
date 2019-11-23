# Comparison of impact, tracing and logging


```
Name               ips        average  deviation         median         99th %
baseline      740.61 K        1.35 μs  ±1968.39%           1 μs           2 μs
logging        18.53 K       53.97 μs    ±55.13%          47 μs         110 μs
tracing         9.82 K      101.83 μs    ±32.18%          91 μs      210.33 μs

Comparison: 
baseline      740.61 K
logging        18.53 K - 39.97x slower +52.62 μs
tracing         9.82 K - 75.42x slower +100.48 μs
```
