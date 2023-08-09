---
layout: post
title: Spam score
category: [doc]
tags: [models]
permalink: /models/spam_score/
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

The spam score was introduced by Raykar et. al (2012).
A spammer can be defined as someone answered independently of the true label *i.e.*

$$
\mathbb{P}(y_i^{(j)}=k\ |\ y_i^\star =\ell) = \mathbb{P}(y_i^{(j)}=k\ | y_i^\star =\ell')\ \forall (k,\ell, \ell') in [K]^3.
$$

Let $\alpha_{\ell k}^{(j)} = \mathbb{P}(y_i^{(j)}=k\ |\ y_i^\star =\ell)$.
Then for a spammer $\alpha_{\ell k}^{(j)} = \alpha_{\ell' k}^{(j)}\ \forall (k,\ell,\ell') in [K]$.
We can store them in a confusion matrix $\pi^{(j)}\in\mathbb{R}^{K\times K}$ such that $\pi^{(j)}_{\ell,k}=\alpha^{(j)}_{\ell,k}$

A perfect spammer will have equal rows, leading to a matrix of rank $1$.
The spam score $s^{(j)}$ is thus defined as the distance to the closest rank one approximation of the confusion matrix $\pi^{(j)}$.
More formally:

$$
s^{(j)} = \|\pi^{(j)} - e\hat v_j^\top \|_F^2 \quad \text{s.t } \hat v_j = \arg\min_{v_j} \|\pi^{(j)}-ev_j^\top \|_F^2,\ v_j^\top e=1 \enspace.
$$

Solving this optimization problem, we obtain that a perfect worker has $s^{(j)}=K-1$. We can normalize the scores and obtain the following explicit formula:

$$
s^{(j)}= \frac{1}[K(K-1)] \sum_{\ell\leq \ell'} \sum_k (\alpha^{(j)}_{\ell,k} - \alpha^{(j)}_{\ell',k})^2 \enspace.
$$

## CLI

To run the spammer identification in a classification problem with $K=10$ classes, we use the following command:

```{bash}
peerannot identify . -s spam_score -K 10
```

Label file can be modified using the argument `--labels=<new_path_to_json_file>`.
Spam scores are stored in the folder `./identification` in the `spam_score.npy` file.