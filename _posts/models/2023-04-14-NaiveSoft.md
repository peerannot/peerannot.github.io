---
layout: post
title: Naive Soft
category: [doc]
tags: [models]
permalink: /models/NaiveSoft/
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



# image:
#    path: /assets/images/settings-3311592.svg
---

<!-- https://math.meta.stackexchange.com/questions/33302/double-struck-1-in-mathjax -->

## Model

The Naive Soft model returns the empirical distribution overs answered for each task:

$$
\DeclareMathOperator*{\argmax}{argmax}
\hat y_i = \big( \frac{1}{|n_\texttt{worker|}}\sum_{j\in [n_\texttt{worker}]}  \unicode{x1D7D9}_{\{y_i^{(j)}=k\}}\big).$$

## CLI
With `peerannot` in a terminal located in the directory of answers, the DS model can be used as follows.

```bash
peerannnot aggregate . --strategy NaiveSoft --answers-file answers.json
```

Note that by default, if the answers are in a file names `answers.json` the `--answers-file` argument can be omitted.

## API

Import the aggregation model in the current session

```python
from peerannot.models import NaiveSoft as NS
```

Assuming the answers are in a dictionary names `answers` then run:

```python
ns = NS(answers, n_classes)
yhat = ns.get_probas()
```

Note that the Naive Soft aggregation produces labels in the simplex by default.

## API details: class models.NaiveSoft
NS model class inherits from `CrowdModel`

---
`__init__(answers, n_classes,**kwargs)`

Parameters:
- `answers`:*(dict)*
  Dictionnary of workers answers with format
```json

            {
                task0: {worker0: label, worker1: label},
                task1: {worker1: label}
            }
```
- `n_classes`: *(int)*
  Number of possible classes
- `kwargs`: *(dict)*
  Dictionary that can contain `path_remove` to remove tasks identified from the [`WAUM`](/models/WAUM) or another method.

---
`compute_baseline()`

For each given task, computes the number of votes for each label.

---
`get_probas()`

Returns the distribution of voted classes from the `baseline`.

---
`get_answers()`

Returns the most voted class from the `baseline`. In case of equalities, a random choice is applied.
