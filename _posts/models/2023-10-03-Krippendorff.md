---
layout: post
title: Krippendorff's Alpha
category: [doc]
tags: [models]
permalink: /models/KrippendorffAlpha/
css:
  badge: true
  syntax: true
  custom: >-
    table { font-size: .95rem; margin-bottom: 1.5rem; }
    tr:nth-child(odd) { backgroud-color: #e3edf3; }
    th, td { padding: .5em; }
    .box { border: 1px solid #e3edf3; padding: 1rem; }
    .plaintext { color: mediumseagreen; }
excerpt: Models available in peerannot
featured: false

---

## Identification step

The Krippendorff's Alpha coefficient identification measures the agreement between workers on the labels answered to a dataset.

- A dataset with $\alpha = 1$ has a perfect reliability.
- A dataset with $\alpha = 0$ has no reliability, task and labels are statistically unrelated.
- A dataset with $\alpha < 0$ has a systematics disagreement, more than what can be expected by chance.

We can compute the Krippenderoff's alpha coefficient as :

$$
  \alpha = 1 - \frac{D_o}{D_e} \enspace.
$$

Where $D_o$ is the disagreement observed and $D_e$ is the disagreement expected by chance.

$$
  D_o = \frac{1}{n}\sum_{c  \in R}\sum_{k  \in R}\delta(c,k)\sum_{u \in U}\frac{n_{cku}}{P(m_u,2)} \enspace,
$$

$$
  D_e = \frac{1}{P(n,2)}\sum_{c  \in R}\sum_{k  \in R}\delta(c,k)P_{ck}\enspace.
$$


Where $n$ is the number of task, $R$ is the set of possible answers a worker can give, $P$ is the permutation function, $n_cku$ the number of pairs of answers $(c,k)$ for the task $u$ and $\delta$ is a metric function defined as : 

$$
\begin{equation}
  \delta(v,v') = 
    \begin{cases}
      0 & \text{if $v$ = $v'$}\\
      1 & \text{if $v \neq v'$}
    \end{cases} 
\enspace.
\end{equation}
$$


## CLI

For a classification problem, if the json file of answers is located at the current directory simply run:

```bash
peerannot identify . -s krippendorffalpha
```

This creates a file named `krippendorff_alpha.npy` saved in the `./identification` folder.
