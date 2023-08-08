---
layout: post
category: [doc]
title: Simulate labels with hammer-spammer
tags: [datasets,simulate]
permalink: /datasets/simulate_hammer_spammer/

css:
  badge: true
  syntax: true
  custom: >-
    table { font-size: .95rem; margin-bottom: 1.5rem; }
    tr:nth-child(odd) { backgroud-color: #e3edf3; }
    th, td { padding: .5em; }
    .box { border: 1px solid #e3edf3; padding: 1rem; }
    .plaintext { color: mediumseagreen; }
excerpt: Simulate with hammer-spammer in peerannot
featured: false
---

This is an example of simulation using the `peerannot` library that considers the hammer-spammer setting.

## Discrete-difficulty simulation

Each task is assigned a true label $y_i^\star$.
Each worker is either a spammer or a hammer
- If worker is a hammer, they answer correctly: $y_i^{(j)}=y_i^\star$
- If the worker is a spammer, they answer uniformly a label over the range of possibilities: $\forall k,\ell\in[K]^2, \ \mathbb{P}(y_i^{(j)}=k | y_i^\star=\ell)=K^{-1}$.


### Run the simulation

Let us run a simulation with $n_{\texttt{worker}}=30$ workers, $n_{\texttt{task}}=100$ tasks with $K=3$ classes.
Each task receives a random number of votes between $1$ and $n_{\texttt{worker}}$ using the key `imbalance-votes`

The maximum number of tasks per worker / label per task can be modified using `workerload`/`feedback` parameters.

Results are stored in the folder `./temp/test_hammer_spammer`.
The number of spammers and hammers is controlled with the parameter `ratio` which indicates the number of spammers over the number of hammers.
We set the `seed` to $3$ for reproducibility.

```bash
peerannot simulate --n-worker=30 --n-task=100 --n-classes=3 --strategy hammer-spammer --imbalance-votes --seed=3 --folder ./temp/test_hammer_spammer
```

Confusion matrices for each worker are stored in the folder `./temp/test_hammer_spammer` to help further analysis.