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

A dataset with $\alpha = 1$ has a perfect reliability.\\
A dataset with $\alpha = 0$ has no reliability, task and labels are statistically unrelated.\\
A dataset with $\alpha < 0$ has a systematics disagreement, more than what can be expected by chance.

We can compute the Krippenderoff's alpha coefficient as:

$$
  \alpha = 1 - \frac{D_o}{D_e} \enspace.
$$

Where $D_o$ is the disagreement observed and $D_e$ is the disagreement expected by chance.
We define as $$\mathcal{L}(x_i)$$ the vector of labels given to the task $x_i \in \mathcal{X}$: $$\mathcal{L}(x_i) = (y_i^{(j)})_{j \in \mathcal{A}(x_i)}$$

$$D_o = \frac{1}{n_{\text{worker}}}\sum_{x_i \in \mathcal{X}}\sum_{k \in \mathcal{L}(x_i)}\sum_{k' \in \mathcal{L}(x_i)}\delta(k,k')\frac{1}{|\mathcal{L}(x_i)|-1}$$

$$D_e = \frac{1}{ n_{\text{task}}(n_{\text{task}}-1)}\sum_{x_i \in \mathcal{X}}\sum_{k \in \mathcal{L}(x_i)}\sum_{k' \in \mathcal{L}(x_i)}\delta(k,k')$$

Where $\delta$ is a metric function, for our case we use the discrete distance defined as : 

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
